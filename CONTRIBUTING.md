# Contributing

Thanks for contributing to Singapore Skills.

## What good contributions look like

- Singapore-relevant workflows
- Source-backed, auditable outputs
- Explicit caveats and confidence handling
- Clear templates/checklists in `references/`

## Add a New Skill

1. Create folder: `skills/public/<skill-name>/`
2. Add:
   - `SKILL.md`
   - `agents/openai.yaml`
   - `references/` (at least output template + QA checklist)
3. Do not hand-write ports:
   - Claude/Gemini/Universal ports are generated from `SKILL.md`
   - CI auto-syncs ports after merge to `main`
4. (Optional local preview) Generate ports locally:
   - `./ports/scripts/convert-skill.sh <skill-name>`
   - or `./ports/scripts/convert-skill.sh all`
5. Update docs:
   - `README.md` (if needed)
   - `docs/CHANGELOG.md`
   - `docs/ROADMAP.md` (optional)

## Required Quality Bar

- No uncited numeric claims
- Absolute dates
- Confidence labels where applicable
- Fail-safe behavior for missing/limited data

## Naming

- Use kebab-case skill names (`sg-open-data-storyteller`)
- Keep one skill per folder
- Keep references narrowly scoped and reusable

## Pull Request Checklist

- [ ] Skill runs end-to-end with a realistic prompt
- [ ] QA checklist exists and is followed
- [ ] Source skill files are complete (`SKILL.md`, `agents/openai.yaml`, `references/`)
- [ ] Docs updated
