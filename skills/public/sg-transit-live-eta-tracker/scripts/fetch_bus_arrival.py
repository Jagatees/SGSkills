#!/usr/bin/env python3
"""
Fetch and normalize SG bus arrival data from LTA DataMall BusArrival endpoint.

Usage:
  export LTA_ACCOUNT_KEY="..."
  python3 fetch_bus_arrival.py --bus-stop 83139 --service 14
"""

from __future__ import annotations

import argparse
import json
import os
import sys
import urllib.error
import urllib.parse
import urllib.request
from datetime import datetime, timedelta, timezone

try:
    from zoneinfo import ZoneInfo
except Exception:  # pragma: no cover
    ZoneInfo = None

API_URL = "https://datamall2.mytransport.sg/ltaodataservice/v3/BusArrival"
SGT_TZ = ZoneInfo("Asia/Singapore") if ZoneInfo else timezone(timedelta(hours=8))


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Fetch SG bus arrival timings.")
    parser.add_argument("--bus-stop", required=True, help="Bus stop code (e.g. 83139)")
    parser.add_argument("--service", help="Optional service number filter (e.g. 14)")
    parser.add_argument("--timeout", type=int, default=15, help="HTTP timeout seconds")
    return parser.parse_args()


def iso_now() -> str:
    return datetime.now(timezone.utc).astimezone(SGT_TZ).isoformat(timespec="seconds")


def fetch(bus_stop: str, service: str | None, timeout: int) -> dict:
    account_key = os.getenv("LTA_ACCOUNT_KEY")
    if not account_key:
        raise RuntimeError("Missing LTA_ACCOUNT_KEY environment variable.")

    query = {"BusStopCode": bus_stop}
    if service:
        query["ServiceNo"] = service
    url = f"{API_URL}?{urllib.parse.urlencode(query)}"

    req = urllib.request.Request(url, headers={"AccountKey": account_key})
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            body = resp.read().decode("utf-8")
    except urllib.error.HTTPError as exc:
        if exc.code in (401, 403):
            raise RuntimeError("Invalid LTA_ACCOUNT_KEY (HTTP 401/403).") from exc
        raise
    return json.loads(body)


def normalize(payload: dict, bus_stop: str, service: str | None) -> dict:
    out = {
        "checked_at": iso_now(),
        "source": API_URL,
        "bus_stop_code": bus_stop,
        "service_filter": service,
        "services": [],
    }
    for item in payload.get("Services", []):
        out["services"].append(
            {
                "service_no": item.get("ServiceNo"),
                "next_bus_eta": item.get("NextBus", {}).get("EstimatedArrival"),
                "next_bus2_eta": item.get("NextBus2", {}).get("EstimatedArrival"),
                "next_bus3_eta": item.get("NextBus3", {}).get("EstimatedArrival"),
                "load": item.get("NextBus", {}).get("Load"),
                "bus_type": item.get("NextBus", {}).get("Type"),
            }
        )
    return out


def main() -> int:
    args = parse_args()
    try:
        payload = fetch(args.bus_stop, args.service, args.timeout)
        print(json.dumps(normalize(payload, args.bus_stop, args.service), indent=2))
        return 0
    except Exception as exc:  # noqa: BLE001
        print(json.dumps({"error": str(exc), "checked_at": iso_now()}), file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
