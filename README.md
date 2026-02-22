# Singapore Skills

A curated collection of AI skills for Singapore-focused work.

This repository is building practical, reusable skills for local contexts across public policy, open data, transport, business, citizen services, and more.

## Why this repo exists

Most generic AI prompts miss Singapore-specific context and source reliability needs. These skills encode repeatable workflows so outputs are:

- locally relevant
- source-backed
- concise and usable
- easy to share across tools

## Skills in this collection

All public skills live under `skills/public/`.

Examples currently included:
- `sg-govtech-announcement-scanner`
- `sg-news-brief`
- `sg-open-data-storyteller`
- `sg-school-admission-orchestrator`
- `sg-school-eligibility-checker`
- `sg-school-discovery-finder`

As new Singapore-context skills are added, they are part of this same collection.

## Repo structure

```text
skills/public/<skill-name>/
  SKILL.md
  agents/openai.yaml
  references/

ports/
  install.sh
  README.md
  universal/
```

## Install for Codex

### Install one skill

```bash
mkdir -p ~/.codex/skills
cp -R skills/public/sg-news-brief ~/.codex/skills/
# or
cp -R skills/public/sg-govtech-announcement-scanner ~/.codex/skills/
# or
cp -R skills/public/sg-open-data-storyteller ~/.codex/skills/
```

### Install all public skills

```bash
mkdir -p ~/.codex/skills
cp -R skills/public/* ~/.codex/skills/
```

Restart Codex after install.

### Install from your website (copy-paste one command)

Users can install directly from GitHub without cloning first:

```bash
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- all
```

Single-skill variants for copy buttons:

```bash
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-news-brief
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-govtech-announcement-scanner
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-open-data-storyteller
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-school-admission-orchestrator
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-school-eligibility-checker
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-school-discovery-finder
```

## Example prompts

- `Use $sg-govtech-announcement-scanner for the last 7 days and show change type + impact + source links.`
- `Use $sg-news-brief and give me a Singapore news brief for the last 24 hours.`
- `Use $sg-open-data-storyteller on https://data.gov.sg/datasets?topics=education&resultId=d_3c55210de27fcccda2ed0c63fdd2b352 and give me a standard brief for policy teams.`
- `Use $sg-school-admission-orchestrator to shortlist 5 suitable primary schools near my area and provide tradeoffs with official source links.`
- `Use $sg-school-eligibility-checker to verify school admission baseline eligibility and provide a handoff payload for shortlist generation.`
- `Use $sg-school-discovery-finder to generate a ranked candidate school list by stage and location before final shortlist scoring.`

## Cross-platform ports

See `ports/README.md` for using prompt ports in other tools.

## Documentation

- `ARCHITECTURE.md`
- `CONTRIBUTING.md`
- `docs/SKILL_SPEC.md`
- `docs/OPERATIONS.md`
- `docs/PORTABILITY.md`
- `docs/ROADMAP.md`
- `docs/CHANGELOG.md`
- `templates/` for starter files when creating new skills

## Roadmap

Planned additions include:

- policy-to-product translator
- citizen journey auditor
- grants and eligibility explainer
- transport operations watcher
- regulatory watch briefs

## Contributing

Contributions are welcome if they improve Singapore-context quality, reliability, and practical usability.

When contributing:

- keep workflows testable and source-driven
- include references/checklists for quality control
- avoid uncited claims and speculative logic

## License

MIT (see `LICENSE`).
