#!/usr/bin/env python3
"""
Fetch and normalize Singapore PSI readings from data.gov.sg.

Usage:
  python3 fetch_psi.py
  python3 fetch_psi.py --datetime 2026-02-24T06:00:00
"""

from __future__ import annotations

import argparse
import json
import sys
import urllib.parse
import urllib.request
from datetime import datetime, timedelta, timezone

try:
    from zoneinfo import ZoneInfo
except Exception:  # pragma: no cover
    ZoneInfo = None

API_URL = "https://api.data.gov.sg/v1/environment/psi"
SGT_TZ = ZoneInfo("Asia/Singapore") if ZoneInfo else timezone(timedelta(hours=8))


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Fetch SG PSI readings.")
    parser.add_argument("--datetime", help="Optional ISO8601 datetime query")
    parser.add_argument("--timeout", type=int, default=15, help="HTTP timeout seconds")
    return parser.parse_args()


def iso_now_sgt() -> str:
    return datetime.now(timezone.utc).astimezone(SGT_TZ).isoformat(timespec="seconds")


def parse_dt(value: str) -> str:
    dt = datetime.fromisoformat(value.replace("Z", "+00:00"))
    if dt.tzinfo is None:
        dt = dt.replace(tzinfo=SGT_TZ)
    return dt.astimezone(SGT_TZ).isoformat(timespec="seconds")


def band_from_psi(psi_value: float | int | None) -> str:
    if psi_value is None:
        return "Unknown"
    value = float(psi_value)
    if value <= 50:
        return "Good"
    if value <= 100:
        return "Moderate"
    if value <= 200:
        return "Unhealthy"
    if value <= 300:
        return "Very Unhealthy"
    return "Hazardous"


def fetch(datetime_query: str | None, timeout: int) -> dict:
    query: dict[str, str] = {}
    if datetime_query:
        query["date_time"] = parse_dt(datetime_query)
    url = API_URL
    if query:
        url = f"{API_URL}?{urllib.parse.urlencode(query)}"

    with urllib.request.urlopen(url, timeout=timeout) as resp:
        body = resp.read().decode("utf-8")
    return json.loads(body)


def normalize(payload: dict, source_url: str) -> dict:
    item = (payload.get("items") or [{}])[0]
    readings = item.get("readings") or {}
    psi_24h = readings.get("psi_twenty_four_hourly") or {}

    region_rows = []
    for region, value in psi_24h.items():
        region_rows.append(
            {
                "region": region,
                "psi_24h": value,
                "haze_band": band_from_psi(value),
                "confidence": "High" if value is not None else "Low",
            }
        )

    return {
        "checked_at": iso_now_sgt(),
        "source": source_url,
        "reading_timestamp": item.get("timestamp"),
        "update_timestamp": item.get("update_timestamp"),
        "regions": sorted(region_rows, key=lambda x: x["region"]),
    }


def main() -> int:
    args = parse_args()
    try:
        query_value = parse_dt(args.datetime) if args.datetime else None
        source_url = API_URL if not query_value else f"{API_URL}?date_time={urllib.parse.quote(query_value)}"
        payload = fetch(args.datetime, args.timeout)
        print(json.dumps(normalize(payload, source_url), indent=2))
        return 0
    except Exception as exc:  # noqa: BLE001
        print(json.dumps({"error": str(exc), "checked_at": iso_now_sgt()}), file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
