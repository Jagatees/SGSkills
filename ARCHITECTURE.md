# Architecture

This repository is a skill pack for Singapore-focused AI workflows.

## Goals

- Keep skills reusable across tools.
- Keep outputs reliable with references, caveats, and confidence labels.
- Keep installation simple for Codex and portable for other assistants.

## Layout

```text
skills/public/<skill-name>/
  SKILL.md
  agents/
    openai.yaml
  references/

ports/
  install.sh
  README.md
  claude/.claude/commands/
  gemini/.gemini/commands/
  universal/

docs/
templates/
```

## Core Concepts

- `SKILL.md`: behavior contract and workflow.
- `references/`: rubrics, templates, QA checklists, query recipes, ops guides.
- `agents/openai.yaml`: display metadata and default prompt for Codex/OpenAI-style runtime.
- `ports/`: tool-specific adapters for Claude, Gemini, and universal prompt files.

## Install Paths

- Codex runtime: `~/.codex/skills/<skill-name>/...`
- Claude command port: `<destination>/.claude/commands/*.md`
- Gemini command port: `<destination>/.gemini/commands/*.toml`
- Universal: prompt markdown copied into chosen directory

## Release Flow

1. Update skill files in `skills/public/...`
2. Sync to local runtime when needed (`~/.codex/skills/...`)
3. Run a quick smoke test (prompt/output sanity, installer path checks)
4. Commit + push to `main`
5. Record in `docs/CHANGELOG.md`
