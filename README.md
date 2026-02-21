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
- `sg-news-brief`
- `sg-open-data-storyteller`

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
cp -R skills/public/sg-open-data-storyteller ~/.codex/skills/
```

### Install all public skills

```bash
mkdir -p ~/.codex/skills
cp -R skills/public/* ~/.codex/skills/
```

Restart Codex after install.

## Example prompts

- `Use $sg-news-brief and give me a Singapore news brief for the last 24 hours.`
- `Use $sg-open-data-storyteller on https://data.gov.sg/datasets?topics=education&resultId=d_3c55210de27fcccda2ed0c63fdd2b352 and give me a standard brief for policy teams.`

## Cross-platform ports

See `ports/README.md` for using prompt ports in other tools.

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
