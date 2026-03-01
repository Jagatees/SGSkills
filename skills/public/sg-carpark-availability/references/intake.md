# Intake: SG Car Park Availability

## Core
- Skill slug: `sg-carpark-availability`
- One-line purpose: Provide Singapore car park availability summaries with data-freshness caveats and confidence labels.
- Target users: drivers, support teams, operations analysts.
- Domain: Singapore transport parking availability.
- Risk tier: `LOW`.

## Inputs and outputs
- Required input: area/location intent for carpark lookup.
- Optional input: lot type, snapshot time, output length.
- Output format: quick summary or structured brief.
- Confidence labels: required (`High`/`Medium`/`Low`).

## Sources and quality
- Tier 1: official Singapore carpark-availability API/dataset.
- Tier 2: official notices for outages/delays.
- Tier 3: media/community reposts (supporting only).
- Verification rule: lot-count claims must trace to official published values.

## Safety and governance
- Informational wayfinding support only.
- Do not guarantee parking availability at arrival time.
- Do not fabricate lot counts or freshness timestamps.
