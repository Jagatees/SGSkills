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
- `sg-skill-creator`
- `sg-weather-now`

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
cp -R skills/public/sg-skill-creator ~/.codex/skills/
# or
cp -R skills/public/sg-weather-now ~/.codex/skills/
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
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-skill-creator
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-weather-now
```

## Example prompts

- `Use $sg-weather-now and summarize Singapore weather now, next 2 hours, and next 24 hours with confidence labels and official source links.`
- `Use $sg-skill-creator to create a new Singapore-first skill with trusted-source rules, confidence labels, and website-ready metadata.`

## Cross-platform ports

See `ports/README.md` for using prompt ports in other tools.

### Local install for other LLM tools

From repo root:

```bash
chmod +x ports/install.sh
./ports/install.sh claude ~/my-project all
./ports/install.sh gemini ~/my-project all
./ports/install.sh universal ~/Desktop all
```

Single-skill examples:

```bash
./ports/install.sh claude ~/my-project sg-weather-now
./ports/install.sh gemini ~/my-project sg-weather-now
./ports/install.sh universal ~/Desktop sg-weather-now
```

### Convert any skill to other LLM formats

Regenerate Claude + Gemini + Universal adapters from source skills:

```bash
./ports/scripts/convert-skill.sh all
# or one skill
./ports/scripts/convert-skill.sh sg-skill-creator
```

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
