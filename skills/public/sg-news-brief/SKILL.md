---
name: sg-news-brief
description: Create concise Singapore news digests with source links and category grouping. Use when users ask for Singapore news summaries, policy/event roundups, or daily/weekly briefings.
---

# SG News Brief

## Overview

Use this skill to produce short, trustworthy Singapore news briefings for daily or weekly updates. Prioritize factual accuracy, source transparency, and clear implications for Singapore readers.

Read `references/source-priority.md` before collecting stories.

## Workflow

### 1. Confirm brief scope

Collect or infer:
- Time window: today, last 24 hours, last 7 days, or custom dates.
- Topics: policy, transport, housing, business, technology, health, education, security, sports, or general.
- Audience: public readers, founders/SMEs, investors, students, or internal teams.
- Output length: quick (3-5 items), standard (6-10 items), or deep (10+ items).

If user intent is unclear, default to:
- Last 24 hours
- General Singapore news
- Standard length

### 2. Gather candidate stories

Use high-trust Singapore-first sources first. Include regional/global outlets only when they add important context for Singapore.

For each story capture:
- Headline
- Event date
- Publish date
- Source name
- URL
- 1-2 sentence summary

### 3. Verify before writing

Apply these checks:
- Keep only stories with at least one reputable source link.
- Prefer stories with direct primary statements where possible.
- Use absolute dates (for example: `February 21, 2026`) instead of only relative labels like "today."
- If facts conflict across outlets, state uncertainty briefly and cite both.

Do not present speculation as confirmed fact.

### 4. Categorize and rank

Group stories into categories that matter for Singapore users:
- Public policy and government
- Economy and business
- Transport and infrastructure
- Housing and cost of living
- Society, education, and health
- Technology and cybersecurity

Rank within each category by:
- Impact on people in Singapore
- Timeliness
- Reliability of sourcing

### 5. Produce the brief

Use this format:

```markdown
# Singapore News Brief
Period: <start date> to <end date>
Updated: <timestamp with timezone>

## Top Headlines
1. <headline> - <one-line why it matters>
2. ...

## By Category
### <category>
- <headline> (<source>, <publish date>): <2-3 sentence summary>
  - Why it matters: <1 sentence>
  - Source: <url>

## Watchlist
- <emerging issue to monitor next update>

## Notes
- Coverage limits or uncertainty notes (if any).
```

## Quality Bar

- Keep tone neutral and concise.
- Avoid duplicate stories across categories.
- Separate facts from interpretation.
- Include source links for every item.
- End with a short "watch next" view when relevant.

## Reusable prompts

- "Give me a Singapore news brief for the last 24 hours, standard length."
- "Summarize Singapore policy and business news for this week for SME founders."
- "Create a housing and transport focused Singapore brief with only high-confidence items."
