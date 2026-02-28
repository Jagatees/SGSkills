# Changelog

## 2026-02-28

### sgcarmart

- Added new `sgcarmart` public skill for Singapore used-car listing analysis and comparison.
- Added skill workflow covering intake, affordability framing, extraction fields, ranking logic, and confidence handling.
- Added required references (`output-template.md`, `qa-checklist.md`) plus source-map, intake, safety assumptions, and review contacts.
- Added OpenAI agent metadata for the new skill.

## 2026-02-21

### sg-govtech-announcement-scanner

- Added new lane skill to scan GovTech/OGP/agency announcement pages.
- Added structured extraction contract (headline, date, change type, impact, confidence, source).
- Added output template, QA checklist, and source map references.
- Added Codex agent metadata and default prompt.
### sg-open-data-storyteller

- Added API reliability playbook and SQL-first guidance.
- Added data-cleaning rules for suppressed/missing values.
- Added aggregation-method disclosure requirement.
- Added frequency-aware default windows.
- Added call-budget and bounded retry/backoff controls.
- Added `references/api-query-recipes.md`.
- Added production ops controls and `references/ops-checklist.md`.

### Ports

- Added Claude/Gemini/Universal adapters for `sg-open-data-storyteller`.
- Updated `ports/install.sh` to support skill selection across non-codex targets.
