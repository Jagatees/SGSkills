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
- `skill` is optional for all targets (defaults to `all`).
- If you do not know what destination path to use, set destination to `.` (current folder).

Examples:

```bash
./ports/install.sh codex
./ports/install.sh codex . sg-skill-creator
./ports/install.sh codex . sg-open-data-storyteller
./ports/install.sh codex . sg-govtech-announcement-scanner
./ports/install.sh codex . sg-transit-service-tracker
./ports/install.sh codex . sg-transit-live-eta-tracker
./ports/install.sh claude ~/my-project sg-news-brief
./ports/install.sh claude ~/my-project sg-open-data-storyteller
./ports/install.sh claude ~/my-project sg-skill-creator
./ports/install.sh claude ~/my-project all
./ports/install.sh gemini ~/my-project sg-news-brief
./ports/install.sh gemini ~/my-project sg-open-data-storyteller
./ports/install.sh gemini ~/my-project sg-skill-creator
./ports/install.sh gemini ~/my-project all
./ports/install.sh universal ~/Desktop sg-news-brief
./ports/install.sh universal ~/Desktop sg-open-data-storyteller
./ports/install.sh universal ~/Desktop sg-skill-creator
./ports/install.sh universal ~/Desktop all
```

No custom path example:

```bash
./ports/install.sh claude . all
./ports/install.sh gemini . all
./ports/install.sh universal . all
```

## Codex

Install all skills:

```bash
./ports/install.sh codex
```

Install one skill:

```bash
./ports/install.sh codex . sg-news-brief
./ports/install.sh codex . sg-skill-creator
./ports/install.sh codex . sg-govtech-announcement-scanner
./ports/install.sh codex . sg-open-data-storyteller
./ports/install.sh codex . sg-transit-service-tracker
./ports/install.sh codex . sg-transit-live-eta-tracker
```

Install from a website copy button (no local clone needed):

```bash
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- all
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-skill-creator
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-news-brief
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-govtech-announcement-scanner
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-open-data-storyteller
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-transit-service-tracker
curl -fsSL https://raw.githubusercontent.com/Jagatees/SGSkills/main/ports/install-from-github.sh | bash -s -- sg-transit-live-eta-tracker
```

Use in Codex:

- `Use $sg-news-brief and give me a Singapore news brief for the last 24 hours.`
- `Use $sg-open-data-storyteller on <data.gov.sg link> and give me a standard brief for policy teams.`
- `Use $sg-transit-service-tracker for the last 24 hours and list disruptions with affected lines and source links.`
- `Use $sg-transit-live-eta-tracker for the next 60 minutes and assess delay risk for my commute.`

## Claude / Gemini / Universal

Supported skills:
- `sg-skill-creator`
- `sg-news-brief`
- `sg-govtech-announcement-scanner`
- `sg-open-data-storyteller`
- `sg-transit-service-tracker`
- `sg-transit-live-eta-tracker`
- `sg-school-admission-orchestrator`
- `sg-school-eligibility-checker`
- `sg-school-discovery-finder`
- `sg-school-finder-orchestrator`

Install one skill:

```bash
./ports/install.sh claude ~/my-project sg-news-brief
./ports/install.sh claude ~/my-project sg-open-data-storyteller
./ports/install.sh claude ~/my-project sg-skill-creator

./ports/install.sh gemini ~/my-project sg-news-brief
./ports/install.sh gemini ~/my-project sg-open-data-storyteller
./ports/install.sh gemini ~/my-project sg-skill-creator

./ports/install.sh universal ~/Desktop sg-news-brief
./ports/install.sh universal ~/Desktop sg-open-data-storyteller
./ports/install.sh universal ~/Desktop sg-skill-creator
```

Install all skills:

```bash
./ports/install.sh claude ~/my-project all
./ports/install.sh gemini ~/my-project all
./ports/install.sh universal ~/Desktop all
```

## Browser-Based LLM Use (No Local LLM/CLI Needed)

For users who only use browser AI tools:

1. Create universal prompt files:
```bash
./ports/install.sh universal . all
```
2. Open any file in `ports/universal/`.
3. Copy the prompt text into your browser LLM chat.
4. Add your scope inputs (for example: date range, location, audience), then run.

## Convert Skills For Other LLMs

Regenerate Claude + Gemini + Universal ports from `skills/public/*/SKILL.md`:

```bash
./ports/scripts/convert-skill.sh all
```

Or regenerate only one skill:

```bash
./ports/scripts/convert-skill.sh sg-school-eligibility-checker
```

## What to send friends

Share this repo URL and ask them to:

1. Clone or download the repo.
2. `cd` into repo root.
3. Run `./ports/install.sh codex` for Codex, or the relevant target for their tool.
