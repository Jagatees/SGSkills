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
3. Add portability adapters if needed:
   - Claude command
   - Gemini command
   - Universal prompt
4. Update docs:
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
- [ ] Ports updated (or intentionally deferred with note)
- [ ] Docs updated
