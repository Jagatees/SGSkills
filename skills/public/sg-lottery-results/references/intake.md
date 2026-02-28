# Intake: SG Lottery Results

## Core
- Skill slug: `sg-lottery-results`
- One-line purpose: Provide Singapore 4D and TOTO draw results summaries with confidence labels and publication-status caveats.
- Target users: public users, customer support, community moderators.
- Domain: Singapore lottery result checking.
- Risk tier: `LOW`.

## Inputs and outputs
- Required input: lottery result query.
- Optional input: product (`4D` or `TOTO`), target draw date, preferred output length.
- Output format: quick summary or structured brief.
- Confidence labels: required (`High`/`Medium`/`Low`).

## Sources and quality
- Tier 1: official Singapore Pools draw result pages.
- Tier 2: official publication notices and schedule updates.
- Tier 3: media/community reposts (supporting only).
- Verification rule: winning-number claims must trace to official published draw results.

## Safety and governance
- Informational result checking only.
- Do not provide betting optimization or guaranteed-win claims.
- Do not fabricate winning numbers or draw metadata.
- Escalate requests that target vulnerable groups or minors for gambling workflows.
