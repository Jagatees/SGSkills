# Portability

How skills map across runtimes.

## Source of Truth

`skills/public/<skill-name>/` is the primary logic contract.

## Runtime Adapters

- Codex/OpenAI: `agents/openai.yaml`
- Claude: `ports/claude/.claude/commands/*.md`
- Gemini: `ports/gemini/.gemini/commands/*.toml`
- Universal: `ports/universal/*.md`

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
