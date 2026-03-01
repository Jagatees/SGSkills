# Intake: SG COE Bidding Results

## Core
- Skill slug: `sg-coe-bidding-results`
- One-line purpose: Provide Singapore COE bidding results summaries with confidence labels and publication-status caveats.
- Target users: public users, support teams, analysts.
- Domain: Singapore COE bidding results.
- Risk tier: `LOW`.

## Inputs and outputs
- Required input: COE result query.
- Optional input: exercise/date scope, category subset, preferred output length.
- Output format: quick summary or structured brief.
- Confidence labels: required (`High`/`Medium`/`Low`).

## Sources and quality
- Tier 1: official OneMotoring/LTA COE result pages.
- Tier 2: official schedule/announcement updates from OneMotoring/LTA.
- Tier 3: media reposts (supporting only).
- Verification rule: category-level result claims must trace to official published values.

## Safety and governance
- Informational checking only.
- Do not provide manipulation or guaranteed-outcome guidance.
- Do not fabricate premiums, quota, or bids values.
