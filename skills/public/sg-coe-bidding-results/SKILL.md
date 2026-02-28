---
name: sg-coe-bidding-results
description: Provide Singapore COE bidding result summaries by category using official sources, absolute timestamps, and confidence labels.
jurisdiction: SG
review_due: 2026-05-29
author_name: Jagatees
author_github: https://github.com/Jagatees
---

# SG COE Bidding Results

## Overview

Use this skill to answer Singapore COE bidding result requests with clear category-level prices and quota movement context.
It is for informational tracking and planning support, not legal, financial, or guaranteed outcome advice.

Read these references before running:
- `references/intake.md`
- `references/output-template.md`
- `references/source-map.md`
- `references/qa-checklist.md`
- `references/safety-assumptions.md`
- `references/review-contacts.md`
- `references/safety-evals.md`

## Workflow

### 1. Confirm request and scope

Capture or infer:
- Exercise scope: latest first/open exercise, previous exercise comparison, or trend summary
- Category scope: all categories or specific category (`A`, `B`, `C`, `D`, `E`)
- Output goal: quick snapshot, comparison brief, or concise trend

If missing, default to:
- latest completed exercise
- all categories
- concise snapshot + short comparison to the previous exercise

### 2. Safety and misuse triage

Record:
- Risk tier: `LOW`
- Regulated domain: `No` (informational transport-market data)
- Sensitive-period mode: `No`

Blocking behavior:
- Return `Refuse` for harmful, deceptive, or abusive requests.
- Return `Input Required` if user asks for unsupported precision (for example exact winning probability by bidder profile).
- Return `Human Review Required` if user asks for personalized financial/legal instructions framed as guaranteed bidding outcomes.

### 3. Gather sources with trust tiers

Use this order:
1. Tier 1 (primary): official LTA/OneMotoring COE bidding result pages and official quota notices.
2. Tier 2: established Singapore media or official dealer associations for contextual explanation only.
3. Tier 3: forums/social posts for weak sentiment signals only; never sole basis for prices/quotas.

Verification rules:
- For result values (quota premium, quota, bids received, success rates), prioritize latest timestamped official source.
- If multiple official pages differ, show conflict and prefer the latest official update time.
- If official source is unavailable, mark `Low confidence` and `Verification pending`.

### 4. Produce COE-results output

Follow `references/output-template.md`.
Include:
- As-of timestamp and exercise identifier
- Category-level result table (`A` to `E`) with key fields
- Change vs previous exercise where available
- Confidence labels and source links
- Facts vs inference separation

Use absolute timestamps in Singapore time.
Do not infer bidder-specific success chances as facts.

### 5. Apply QA and safety checks

Before finalizing:
- Run `references/qa-checklist.md`
- Ensure each category row is sourced or explicitly marked unavailable
- Ensure comparison math is correct and labeled if estimated
- Avoid guaranteed-outcome language for future bidding
- Lower confidence when source freshness or completeness is weak

### 6. Return final response

Return concise, decision-useful summary.
If user asks for short output, use:
1. Scope and time
2. Category results
3. Key changes
4. Caveats and confidence

## Quality Bar

- Uses official LTA/OneMotoring sources first for result claims.
- All time-sensitive statements include absolute Singapore timestamps.
- Category data and cross-exercise comparisons are clearly labeled.
- Facts and inference are separated.
- Confidence labels appear in each major section.

## Reusable prompts

- "Show the latest Singapore COE bidding results by category with source links and confidence labels."
- "Compare this COE exercise to the previous one for Categories A to E."
- "Give me a concise COE bidding result snapshot with caveats and confidence labels."
