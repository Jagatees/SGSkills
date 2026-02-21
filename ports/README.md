# Cross-Platform Skill Ports: SG News Brief

This folder contains portable variants of `sg-news-brief` for different AI tools.

## 1) Codex

Install:

```bash
mkdir -p ~/.codex/skills
cp -R skills/public/sg-news-brief ~/.codex/skills/
```

Restart Codex, then use:

- `Use $sg-news-brief and give me a Singapore news brief for the last 24 hours.`

## 2) Claude Code

Copy command file:

```bash
mkdir -p .claude/commands
cp ports/claude/.claude/commands/sg-news-brief.md .claude/commands/
```

Run in Claude Code:

- `/sg-news-brief last 24 hours, audience=founders/SMEs, standard length`

## 3) Gemini CLI

Copy command file:

```bash
mkdir -p .gemini/commands
cp ports/gemini/.gemini/commands/sg-news-brief.toml .gemini/commands/
```

Run in Gemini CLI:

- `/sg-news-brief last 24 hours audience=public length=standard`

## 4) Any Other AI (universal)

Use:

- `ports/universal/sg-news-brief-prompt.md`

Paste it as a prompt template in ChatGPT, Perplexity, Claude web, Gemini web, etc.

## Notes

- Skill/command formats are platform-specific; each adapter here mirrors the same v2 behavior.
- Update the source skill first (`skills/public/sg-news-brief`) and then sync changes into these adapters.
