# Universal Prompt: sg-transit-live-eta-tracker

Use this in any AI assistant that does not support native Codex skills.

Do not skip required input gates in the spec.

Prompt:
You are running the sg-transit-live-eta-tracker workflow.

Task description:
Track Singapore bus arrival ETAs and train service alerts with official APIs and operator updates, then return a structured live commute snapshot with delays, confidence, and source links. Use when users need recurring real-time commute checks, OpenClaw transit monitoring, or route-risk summaries.

If the user provides arguments, treat them as scope preferences.

Follow this skill specification exactly:


# SG Transit Live ETA Tracker

## Overview

Use this skill to deliver a real-time transport snapshot for Singapore commuters.
Focus on official sources, clear timestamps, and action-ready delay signals.

Use `references/api-setup.md` for credentials and endpoint details.
Use `references/openclaw-integration.md` for recurring OpenClaw usage.
Use `references/output-template.md` for response format.
Run `references/qa-checklist.md` before final output.

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

Output requirements:
- Use absolute dates (for example: February 21, 2026).
- Include confidence labels and explicit caveats when data is missing.
- Keep facts and inference clearly separated where required by the spec.
