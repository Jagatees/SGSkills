Run the `sg-lottery-results` workflow for Singapore context.

If user provides arguments, treat them as scope preferences.

Task description:
Provide Singapore 4D and TOTO draw results summaries using official Singapore Pools sources, absolute timestamps, and confidence labels.

Follow this skill specification exactly:


# SG Lottery Results

## Overview

Use this skill to answer Singapore lottery results questions for 4D and TOTO draws.
It is for informational result-checking support only, not betting advice, probability edge claims, or guaranteed-win guidance.

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
- Product: `4D`, `TOTO`, or both
- Draw scope: latest draw or specific draw date
- Output mode: quick summary or structured brief

If missing, default to:
- both products if user asks for "SG lottery" generally
- latest published draw
- quick summary

### 2. Safety and misuse triage

Record:
- Risk tier: `LOW`
- Regulated domain: `No`
- Sensitive-period mode: `No`

Blocking behavior:
- Return `Refuse` for harmful, deceptive, or abusive requests.
- Return `Input Required` if requested product/date cannot be inferred.
- Return `Human Review Required` if the user requests automation for gambling harm (for example targeting vulnerable persons or minors).

### 3. Gather sources with trust tiers

Use this order:
1. Tier 1 (primary): official Singapore Pools draw results pages for 4D and TOTO.
2. Tier 2: official Singapore Pools announcements for schedule changes or result publication delays.
3. Tier 3: media/community reposts only as weak backup signals; never sole basis.

Verification rules:
- For winning numbers and draw metadata, use official published results.
- If sources conflict, prefer Singapore Pools and state conflict.
- If latest result is not published yet, mark `Low confidence` and `Verification pending`.
- If official results for the requested draw are absent on the Singapore Pools results page after checking, output `Pending publication` and set product confidence to `Low`.
- If using time-based gating, cite an explicit official Singapore Pools schedule/announcement for that draw and include that source in output.

### 4. Produce lottery-results output

Follow `references/output-template.md`.
Include:
- Query scope and as-of time
- Latest or requested 4D and/or TOTO results
- Draw date and draw number when available
- Source link per product
- Confidence label and caveats

Use absolute timestamps in Singapore time.
Clearly separate facts (published numbers and metadata) from inference (publication-status interpretation).

### 5. Apply QA and safety checks

Before finalizing:
- Run `references/qa-checklist.md`
- Ensure every product section includes source links and draw date
- Do not provide betting strategy claims or winning guarantees
- Add caveat when results are pending or partially published
- Lower confidence when publication status cannot be verified

### 6. Return final response

Return concise, actionable results-checking output.
If user asks for fast output, use short sections:
1. Scope and as-of time
2. 4D results
3. TOTO results
4. Caveats
5. Confidence and links

## Quality Bar

- Uses official Singapore Pools sources first for draw-result claims.
- Every time-sensitive statement has absolute Singapore timestamp.
- Facts and inference are clearly separated.
- No betting-advice or guaranteed-win language.
- Confidence labels are present in major sections.

## Reusable prompts

- "Show the latest Singapore 4D and TOTO results with source links and confidence labels."
- "Give me only the latest 4D results in a quick format with draw date and timestamp."
- "Check whether today's TOTO results are published yet and show verification status."

Output rules:
1. Use absolute dates.
2. Use full clickable source URLs where factual claims are present.
3. Keep confidence and caveats explicit.
4. Do not claim admission guarantees or certainty beyond evidence.
