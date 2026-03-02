Run the `sg-carmart` workflow for Singapore context.

If user provides arguments, treat them as scope preferences.

Task description:
Analyze and compare Singapore used-car listings with transparent value signals, risk flags, and negotiation-ready summaries.

Follow this skill specification exactly:


# Sgcarmart Assistant

## Overview

Use this skill to analyze and compare Singapore used-car listings from Sgcarmart.
The output should help buyers make practical decisions with clear assumptions, confidence labels, and source links.

Read these references before running:
- `references/intake.md`
- `references/output-template.md`
- `references/source-map.md`
- `references/qa-checklist.md`
- `references/safety-assumptions.md`
- `references/review-contacts.md`

## Workflow

### 1. Confirm scope

Capture or infer:
- mode: `shortlist under budget`, `beginner best-value recommendation`, or `specific listing review`
- budget range in SGD
- monthly payment comfort in SGD/month
- optional constraints: body type, fuel type, min COE left, mileage cap, owner cap

Defaults when missing:
- mode: `shortlist under budget`
- options count: `5`
- no default minimum COE-left filter unless user requests one
- monthly distance assumption for fuel estimate: `1200 km`

### 2. Safety and finance framing

Record:
- risk tier: `LOW`
- regulated domain: `No`
- sensitive-period mode: `No`

Required safety behavior:
- Provide informational analysis only, not financial advice.
- Do not claim guaranteed resale outcomes or guaranteed maintenance cost.
- Refuse deceptive or illegal requests (for example odometer tampering guidance).

### 3. Gather and profile listing data

Use `references/source-map.md` trust tiers.
Extract and normalize these fields where available:
- listing URL
- asking price
- depreciation
- COE left or expiry
- registration date and estimated age
- mileage
- owner count
- road tax
- fuel type and engine/spec summary
- seller/dealer name, location, rating/reviews, phone, sold activity (if shown)
- listing images (minimum 3 when available)

Missingness rule:
- If any field is absent, mark `Unknown`.

### 4. Verify claims and compute comparable insights

Claim rules:
- Distinguish `Facts` (explicit listing data) from `Inference` (value or risk interpretation).
- Keep all money in SGD.
- Use absolute timestamps in Singapore time for as-of statements.

Computation rules:
- Compute estimated monthly cost components where possible: `Loan`, `Road tax`, `Insurance`, `Petrol`.
- For salary-based affordability mode:
  - gross salary to take-home = `gross * 0.8`
  - monthly payment cap = `take-home * (user_percent / 100)`
  - if direct monthly cap and salary cap are both provided, use the lower cap

Confidence rules:
- `High`: primary listing fields available and internally consistent.
- `Medium`: minor missing fields or stale listing timestamps.
- `Low`: critical pricing/COE/seller fields missing or conflicting.

### 5. Rank and recommend

Prioritize by:
- fit to budget and monthly affordability
- COE runway and age balance
- mileage/owners risk profile
- seller trust signals
- value-for-price versus alternatives in the same shortlist

If exact matches are fewer than requested:
- fill remaining slots with closest matches and label clearly as `Outside constraints`.

### 6. Output

Use `references/output-template.md`.
Always include:
- as-of timestamp
- constraint recap
- per-car facts, inference, confidence, source link
- caveats and negotiation checklist

Full-card format rule:
- If at least one car is returned, keep the original `Top 5 worth-it picks` full-card structure.
- For each returned car, include complete listing details, monthly breakdown (`Loan`, `Road tax`, `Insurance`, `Petrol`), risk flags, trust signals, and negotiation checklist.
- Include at least 3 embedded images per car when available.
- Do not collapse results into short bullets or summary-only format unless the user explicitly asks for brief output.
- If only 1 to 4 cars are available, preserve the same full-card numbering and explicitly mark missing slots as unavailable due to constraints.

## Quality Bar

- No uncited numeric claim.
- Facts and inference are explicitly separated.
- Every recommendation has confidence labels and source links.
- Time-sensitive statements use absolute Singapore timestamps.
- Missing or weak data triggers confidence downgrade and caveats.

## Reusable prompts

- "Use sgcarmart assistant to shortlist 5 used cars under SGD 90,000 with max SGD 1,400 monthly loan and at least 2 years COE left."
- "Review this Sgcarmart listing and tell me value signals, risk flags, and negotiation points."
- "Compare these 3 listings and rank them by best value for a first-time owner."

Output rules:
1. Use absolute dates.
2. Use full clickable source URLs where factual claims are present.
3. Keep confidence and caveats explicit.
4. Do not claim admission guarantees or certainty beyond evidence.
