# Intake: SG Weather Now

## Core
- Skill slug: `sg-weather-now`
- One-line purpose: Provide Singapore weather nowcasts and advisories with official links and confidence labels.
- Target users: commuters, event planners, operations teams, public users.
- Domain: Singapore weather and advisories.
- Risk tier: `MEDIUM`.

## Inputs and outputs
- Required input: weather query.
- Optional input: area focus, time horizon, output length.
- Output format: structured brief with timestamped sections.
- Confidence labels: required (`High`/`Medium`/`Low`).

## Sources and quality
- Tier 1: MSS/NEA official weather pages and advisories.
- Tier 2: official gov/operator impact notices.
- Tier 3: social/community posts (supporting only).
- Verification rule: warning-level claims must cite latest official timestamped source.

## Safety and governance
- Avoid overclaiming beyond official windows.
- Do not present non-official rumors as confirmed alerts.
- Escalate life-critical decision support beyond published advisories.
