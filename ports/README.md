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
./ports/install.sh codex . sg-govtech-announcement-scanner
./ports/install.sh claude ~/my-project sg-news-brief
./ports/install.sh claude ~/my-project sg-open-data-storyteller
./ports/install.sh gemini ~/my-project sg-news-brief
./ports/install.sh gemini ~/my-project sg-open-data-storyteller
./ports/install.sh universal ~/Desktop sg-news-brief
./ports/install.sh universal ~/Desktop sg-open-data-storyteller
```

## Codex

Install all skills:

```bash
./ports/install.sh codex
```

Install one skill:

```bash
./ports/install.sh codex . sg-news-brief
./ports/install.sh codex . sg-govtech-announcement-scanner
./ports/install.sh codex . sg-open-data-storyteller
```

Install from a website copy button (no local clone needed):

```bash
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- all
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-news-brief
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-govtech-announcement-scanner
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-open-data-storyteller
```

Use in Codex:

- `Use $sg-news-brief and give me a Singapore news brief for the last 24 hours.`
- `Use $sg-open-data-storyteller on <data.gov.sg link> and give me a standard brief for policy teams.`

## Claude / Gemini / Universal

Supported skills for these targets:

- `sg-news-brief`
- `sg-open-data-storyteller`

Install one skill:

```bash
./ports/install.sh claude ~/my-project sg-news-brief
./ports/install.sh claude ~/my-project sg-open-data-storyteller

./ports/install.sh gemini ~/my-project sg-news-brief
./ports/install.sh gemini ~/my-project sg-open-data-storyteller

./ports/install.sh universal ~/Desktop sg-news-brief
./ports/install.sh universal ~/Desktop sg-open-data-storyteller
```

## What to send friends

Share this repo URL and ask them to:

1. Clone or download the repo.
2. `cd` into repo root.
3. Run `./ports/install.sh codex` for Codex, or the relevant target for their tool.
