# Universal Prompt: sg-transit-service-tracker

Use this in any AI assistant that does not support native Codex skills.

Do not skip required input gates in the spec.

Prompt:
You are running the sg-transit-service-tracker workflow.

Task description:
Monitor Singapore bus and MRT service updates and return a structured feed of disruptions, recoveries, planned maintenance, and commuter advisories with impact, confidence, and source links. Use when users need recurring transport operations snapshots or commute-risk checks.

If the user provides arguments, treat them as scope preferences.

Follow this skill specification exactly:


# SG Transit Service Tracker

## Overview

Use this skill to scan official Singapore transport channels and produce a clear what-changed feed for MRT and bus services.
Prioritize timeliness, source traceability, and practical commuter impact.

Use `references/source-map.md` to prioritize trusted sources.
Use `references/output-template.md` for output format.
Run `references/qa-checklist.md` before final output.

## Workflow

### 1. Confirm scope

Collect or infer:
- Time window (last 6 hours, 24 hours, 7 days, custom)
- Mode filters (MRT, bus, both)
- Corridor/operator focus (optional)
- Audience (commuters, ops teams, public information)
- Output depth (quick 5 items, standard 10, deep 15+)

Defaults when unclear:
- Time window: last 24 hours
- Modes: MRT and bus
- Audience: commuters
- Output depth: standard

### 2. Scan official transport channels

Prioritize Tier 1 sources:
- LTA service advisories and transport news
- SMRT service status pages
- SBS Transit service update channels
- Other relevant official operator pages (for example, Tower Transit, Go-Ahead Singapore)

If an item has no clear timestamp or source URL, exclude it.

### 3. Extract structured fields

For each item extract:
- Headline
- Source organization
- Published or updated date/time (absolute)
- Affected lines/services
- Change type (`incident|recovery|maintenance|advisory|deadline|policy-update`)
- One-line impact
- Confidence (`High|Medium|Low`)
- Source URL

### 4. Apply confidence rules

- High: direct official source with explicit date/time and affected service details.
- Medium: official source but missing one key detail (for example: unclear recovery time).
- Low: unclear timestamp, ambiguous service scope, or indirect/secondary source only.

Move low-confidence items to Watchlist only.

### 5. Produce feed

Use the output template and include:
- Top updates
- Structured update list
- Watchlist
- Coverage caveats

## Quality bar

- Every item has a full official source URL.
- Every item includes absolute date/time and a valid change type.
- No low-confidence item in top updates.
- Any interpretation beyond source text is labeled `Inference:`.

Output requirements:
- Use absolute dates (for example: February 21, 2026).
- Include confidence labels and explicit caveats when data is missing.
- Keep facts and inference clearly separated where required by the spec.
