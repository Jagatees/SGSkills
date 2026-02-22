Run the `sg-govtech-announcement-scanner` workflow for Singapore context.

If user provides arguments, treat them as scope preferences.

Task description:
Scan GovTech/OGP and Singapore agency announcement pages and produce a structured what-changed feed with impact labels, confidence, and source links. Use when users want recent official updates before deeper analysis.

Follow this skill specification exactly:


# SG GovTech Announcement Scanner

## Overview

Use this skill to extract official Singapore public-sector announcements into a clean, decision-ready update feed.
Focus on timeliness, factual extraction, and source traceability.

Use `references/source-map.md` to prioritize sources.
Use `references/output-template.md` for response format.
Run `references/qa-checklist.md` before final output.

## Workflow

### 1. Confirm scope

Collect or infer:
- Time window (last 24 hours, 7 days, 30 days, custom)
- Topic filters (optional)
- Audience (public, ops, policy)
- Output depth (quick 5 items, standard 10, deep 15+)

Defaults when unclear:
- Time window: last 7 days
- Topic: all
- Audience: ops
- Output depth: standard

### 2. Scan announcement sources

Prioritize official pages:
- GovTech updates/status/announcements
- OGP product and initiative updates
- Agency release pages relevant to user topic

If a source cannot be verified or dated, exclude it.

### 3. Extract structured fields

For each item extract:
- Headline
- Source organization
- Published date (absolute date)
- Change type (`launch|enhancement|policy-update|incident|deadline|advisory`)
- One-line impact
- Confidence (`High|Medium|Low`)
- Source URL

### 4. Apply confidence rules

- High: official source with clear date and direct change statement.
- Medium: reputable source quoting official update but partial details.
- Low: unclear date/source or ambiguous change details.

Low-confidence items should be moved to Watchlist, not top highlights.

### 5. Produce feed

Use the output template and include:
- Top updates
- Structured update list
- Watchlist
- Coverage caveats

## Quality bar

- Every item has an official or credible source URL.
- Every item includes absolute date and change type.
- No low-confidence item in top highlights.
- No uncited claim.

Output rules:
1. Use absolute dates.
2. Use full clickable source URLs where factual claims are present.
3. Keep confidence and caveats explicit.
4. Do not claim admission guarantees or certainty beyond evidence.
