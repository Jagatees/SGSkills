---
name: sg-haze-level-tracker
description: Fetch Singapore haze-related PSI readings from official data.gov.sg API and return a region-by-region haze snapshot with risk band, confidence, and source links.
---

# SG Haze Level Tracker

## Overview

Use this skill to return current haze-level context across Singapore using official PSI readings.
Prioritize official source data, explicit timestamps in SGT, and clear regional risk labels.

Use `references/api-setup.md` for endpoint and usage details.
Use `references/output-template.md` for output format.
Use `references/sample-output.md` as the readability baseline.
Run `references/qa-checklist.md` before final output.

## Workflow

### 1. Confirm scope

Collect or infer:
- Time window: latest now, or a requested timestamp
- Focus: national only, or national + regions
- Output depth: quick (topline), standard (all regions), deep (with notes)

Default when unclear:
- Latest now
- National + regions
- Standard depth

### 2. Pull official PSI data

- Run `scripts/fetch_psi.py`.
- Use `--datetime <ISO8601>` when user asks for a specific point in time.
- If API fails, report the error explicitly and do not claim "safe/no haze."

### 3. Normalize into haze snapshot

For each included region provide:
- Region
- PSI 24-hour value
- Haze band (`Good|Moderate|Unhealthy|Very Unhealthy|Hazardous`)
- One-line implication
- Confidence (`High|Medium|Low`)
- Source URL

### 4. Confidence rubric

- High: official API response includes reading + timestamp for the region.
- Medium: official API response available but one or more fields are partial.
- Low: stale, incomplete, or inferred-only value.

Low-confidence entries go only to `Watchlist`.

### 5. Output commuter/public-ready snapshot

Use `references/output-template.md` and include:
- Quick view summary first
- Region-by-region readings
- Watchlist
- Caveats

## Quality bar

- Use absolute SGT timestamps.
- Include full `https://` source URL.
- Keep facts and inference separate (`Inference:` when needed).
- Do not place low-confidence items in top summary.
- Keep wording plain, short, and scannable for mobile screens.
