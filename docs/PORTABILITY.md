# Portability

How skills map across runtimes.

## Source of Truth

`skills/public/<skill-name>/` is the primary logic contract.

## Runtime Adapters

- Codex/OpenAI: `agents/openai.yaml`
- Claude: `ports/claude/.claude/commands/*.md`
- Gemini: `ports/gemini/.gemini/commands/*.toml`
- Universal: `ports/universal/*.md`

All public skills should have all four adapter forms.

## Conversion Flow

1. Edit or add skill logic in `skills/public/<skill-name>/SKILL.md`.
2. Regenerate adapters:
   - `./ports/scripts/convert-skill.sh <skill-name>`
   - `./ports/scripts/convert-skill.sh all`
3. Verify generated files exist for all targets:
   - `ports/claude/.claude/commands/<skill-name>.md`
   - `ports/gemini/.gemini/commands/<skill-name>.toml`
   - `ports/universal/<skill-name>-prompt.md`
4. Test local install:
   - `./ports/install.sh codex . <skill-name>`
   - `./ports/install.sh claude <destination> <skill-name>`
   - `./ports/install.sh gemini <destination> <skill-name>`
   - `./ports/install.sh universal <destination> <skill-name>`

## What Should Stay Consistent

- Workflow steps
- Output structure
- Quality checks
- Confidence/caveat behavior

## What Can Differ

- Command syntax
- Prompt wrapper format
- Tool-specific argument passing

## Install

Use `ports/install.sh` to install per target.
