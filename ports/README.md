# Cross-Platform Skill Ports

This folder contains generated adapters for non-Codex tools.

- Source of truth: `skills/public/<skill>/SKILL.md`
- Generated outputs:
  - Claude: `ports/claude/.claude/commands/<skill>.md`
  - Gemini: `ports/gemini/.gemini/commands/<skill>.toml`
  - Universal: `ports/universal/<skill>-prompt.md`

## Contributor rule

When adding a new skill, contribute source files only under `skills/public/<skill>/`.
Do not manually maintain port files. Ports are generated from source.

## Generate ports

From repo root:

```bash
./ports/scripts/convert-skill.sh <skill-name>
# or
./ports/scripts/convert-skill.sh all
```

## Install for different tools

From repo root:

```bash
./ports/install.sh <target> [destination] [skill]
```

Targets:

- `codex`
- `claude`
- `gemini`
- `universal`

Examples:

```bash
./ports/install.sh codex
./ports/install.sh codex . sg-weather-now
./ports/install.sh claude ~/my-project all
./ports/install.sh gemini ~/my-project sg-hdb-bto-announcements
./ports/install.sh universal ~/Desktop sg-skill-creator
```

Install from GitHub (Codex skills only):

```bash
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- all
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-weather-now
```

## CI behavior

- On pull requests, CI checks that ports can be generated.
- On push to `main`, CI regenerates ports and auto-commits changes if needed.
