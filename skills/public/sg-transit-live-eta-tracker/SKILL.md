---
name: sg-transit-live-eta-tracker
description: Track Singapore bus arrival ETAs and train service alerts with official APIs and operator updates, then return a structured live commute snapshot with delays, confidence, and source links. Use when users need recurring real-time commute checks, OpenClaw transit monitoring, or route-risk summaries.
---

# SG Transit Live ETA Tracker

## Overview

Use this skill to deliver a real-time transport snapshot for Singapore commuters.
Focus on official sources, clear timestamps, and action-ready delay signals.

Use `references/api-setup.md` for credentials and endpoint details.
Use `references/openclaw-integration.md` for recurring OpenClaw usage.
Use `references/output-template.md` for response format.
Run `references/qa-checklist.md` before final output.

## 60-Second Setup (Per User)

Every user should use their own LTA DataMall key.

1. Request key: `https://datamall.lta.gov.sg/content/datamall/en/request-for-api.html`
2. Set key in terminal:
   - `export LTA_ACCOUNT_KEY="<your-key>"`
3. Persist key (zsh):
   - `echo 'export LTA_ACCOUNT_KEY="<your-key>"' >> ~/.zshrc`
   - `source ~/.zshrc`
4. Quick check:
   - `python3 scripts/fetch_bus_arrival.py --bus-stop 83139`

If key is missing or invalid:
- Report `Bus ETA unavailable: missing/invalid LTA_ACCOUNT_KEY`.
- Continue with rail alerts and advisory sources.
- Put bus ETA gaps in `Caveats`; do not claim "no delay" for bus services.

## Workflow

### 1. Confirm scope

Collect or infer:
- Time window (now, next 30 minutes, next 60 minutes)
- Mode filters (bus, rail, both)
- Stops/stations/lines of interest
- Audience (commuter, ops, incident response)
- Output depth (quick 3, standard 5-10, deep 10+)

Defaults when unclear:
- Time window: now + next 60 minutes
- Modes: bus and rail
- Audience: commuter
- Output depth: standard

### 2. Pull live bus and rail status

For bus ETAs:
- Use `scripts/fetch_bus_arrival.py` with LTA DataMall credentials.
- Require explicit stop code and optional service filter.
- If credentials are missing, report setup instruction and proceed with partial coverage.

For rail alerts:
- Pull official operator or agency service-alert channels listed in `references/api-setup.md`.
- Exclude any undated or unverifiable item.

### 3. Normalize into a single event feed

For each event include:
- Headline
- Source organization
- Observed timestamp (absolute, SGT)
- Affected services/stations/routes
- Change type (`eta-update|delay|disruption|recovery|maintenance|advisory`)
- One-line impact
- Confidence (`High|Medium|Low`)
- Source URL

### 4. Score confidence

- High: official source with precise timestamp and affected services.
- Medium: official source but partial details (for example, missing recovery estimate).
- Low: unclear time or indirect sourcing.

Low-confidence items go only to Watchlist.

### 5. Output commuter-ready snapshot

Use the output template and include:
- Top live updates
- Structured updates list
- Watchlist
- Caveats

## Quality bar

- Every item has an absolute timestamp and full source URL.
- Every item has change type and confidence.
- No low-confidence item in top updates.
- Any reasoning beyond source text is labeled `Inference:`.
