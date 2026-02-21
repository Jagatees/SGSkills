# Skill Spec

Canonical requirements for all skills in this repo.

## Required Files

For each `skills/public/<skill-name>/`:

- `SKILL.md`
- `agents/openai.yaml`
- `references/qa-checklist.md`
- `references/output-template.md`

## SKILL.md Required Sections

1. `Overview`
2. `Workflow` with numbered stages
3. `Quality bar`
4. Reusable prompt examples

## Workflow Requirements

- Scope defaulting rules
- Data/source profiling rules
- Claim verification rules
- Confidence rules
- Caveat/fallback behavior

## Output Contract

- Period, updated timestamp, data freshness
- Source URL per insight
- Confidence label per insight
- Caveats section
- Watch-next signals

## Operational Requirements

- Bounded retries/backoff for API-dependent skills
- Explicit call-budget policy where relevant
- Partial-data fallback with confidence downgrade
