# Cross-Platform Skill Ports

This folder contains portable variants and install helpers for the Singapore skills collection.

## Quick Install (recommended)

From repo root:

```bash
chmod +x ports/install.sh
./ports/install.sh <target> [destination] [skill]
```

Targets:

- `codex`
- `claude`
- `gemini`
- `universal`

Notes:

- `destination` is optional for `claude`, `gemini`, and `universal` (defaults to current directory).
- `skill` is optional for `codex` (defaults to `all`).

Examples:

```bash
./ports/install.sh codex
./ports/install.sh codex . sg-open-data-storyteller
./ports/install.sh claude ~/my-project
./ports/install.sh gemini ~/my-project
./ports/install.sh universal ~/Desktop
```

## Codex

Install all skills:

```bash
./ports/install.sh codex
```

Install one skill:

```bash
./ports/install.sh codex . sg-news-brief
./ports/install.sh codex . sg-open-data-storyteller
```

Use in Codex:

- `Use $sg-news-brief and give me a Singapore news brief for the last 24 hours.`
- `Use $sg-open-data-storyteller on <data.gov.sg link> and give me a standard brief for policy teams.`

## Claude / Gemini / Universal

Current command templates in this folder are examples centered on `sg-news-brief`.

If you need cross-platform adapters for `sg-open-data-storyteller`, add equivalent command files under:

- `ports/claude/.claude/commands/`
- `ports/gemini/.gemini/commands/`
- `ports/universal/`

## What to send friends

Share this repo URL and ask them to:

1. Clone or download the repo.
2. `cd` into repo root.
3. Run `./ports/install.sh codex` for Codex, or the relevant target for their tool.
