---
name: sg-news-brief
description: Create concise Singapore news digests with source links and category grouping. Use when users ask for Singapore news summaries, policy/event roundups, or daily/weekly briefings.
---

# SG News Brief

## Overview

Use this skill to produce short, trustworthy Singapore news briefings for daily or weekly updates. Prioritize factual accuracy, source transparency, and clear implications for Singapore readers.
Current release target: v2.2 checklist with confidence scoring, strict sourcing, inference labeling, and claim-level verification.

Read `references/source-priority.md` before collecting stories.
Use `references/audience-modes.md` to match tone and section emphasis by audience.
Use `references/sample-brief.md` as a formatting baseline.
Use `references/friend-test-checklist.md` for repeatable QA runs.

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

Time-window guardrail:
- For `last 24 hours`, keep strict boundary coverage only.
- Do not silently widen to 7 days. If fewer than 3 verified items exist, return a shorter brief with an explicit constraint note.

### 2. Gather candidate stories

Use high-trust Singapore-first sources first. Include regional/global outlets only when they add important context for Singapore.

For each story capture:
- Headline
- Event date
- Publish date
- Source name
- URL
- 1-2 sentence summary
- Claim evidence notes (exact fact + which source line/section supports it)

### 3. Verify before writing

Apply these checks:
- Enforce hard gate: if no credible source URL is available, exclude the story.
- Enforce hard gate: if a source URL is inaccessible or does not contain the claimed fact, exclude the story.
- Require full clickable URLs (`https://...`) in output, not bare domains.
- Enforce hard gate: do not use homepage/section/tag URLs (for example, a site front page or category page) as story evidence links.
- Prefer stories with direct primary statements where possible.
- Use absolute dates (for example: `February 21, 2026`) instead of only relative labels like "today."
- Validate both event date and publish date. If either date is unclear, mark `Medium` at most or move to `Watchlist`.
- For legal or policy status claims (for example: "Bill passed", "Act commenced", "rule effective"), require a primary source.
- If facts conflict across outlets, state uncertainty briefly and cite both.
- Assign confidence per story using the rubric below.
- Any interpretation beyond explicit source text must be prefixed with `Inference:`.

Do not present speculation as confirmed fact.

### 3a. Confidence rubric

- High: direct official/primary source (Tier 1) plus at least one independent reputable source that agrees on core facts. Both URLs must be shown.
- Medium: one reputable source with clear reporting but limited corroboration, and no contradiction from primary sources.
- Low: incomplete verification, conflicting details, or indirect sourcing.

Low-confidence items can appear only in `Watchlist` and must be labeled clearly.

### 3b. Claim-level evidence table (required before final output)

Before writing the brief, build a compact internal table for every included story:

- Claim
- Primary source URL
- Secondary source URL (if any)
- Evidence snippet (short supporting quote/fact)
- Verification status (`Verified` | `Partially verified` | `Unverified`)
- Date check (`Pass` | `Fail`)

Rules:
- Only `Verified` claims can appear in `Top Headlines` or `By Category`.
- `Partially verified` items can appear only with `Confidence: Medium` and explicit uncertainty wording.
- `Unverified` items must be excluded (or moved to `Watchlist` with `Confidence: Low`).

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
Data freshness: <when sources were checked>
Skill version: <v2.2>

## Top Headlines
1. <headline> - <one-line why it matters>
2. ...

## By Category
### <category>
- <headline> (<source>, <publish date>): <2-3 sentence summary>
  - Event date: <Month DD, YYYY or Unknown>
  - Publish date: <Month DD, YYYY>
  - Confidence: <High|Medium|Low>
  - Why it matters: <1 sentence>
  - Primary source: <https://full-link-to-primary-source>
  - Secondary source: <https://full-link-to-independent-source or N/A (required for High)>

## Watchlist
- <emerging issue to monitor next update>

## Notes
- Coverage limits or uncertainty notes (if any).
```

If there are fewer than 3 fully verified stories for the requested period:
- For strict requests (for example: last 24 hours), deliver a shorter brief with an explicit verification constraint note.
- Widen the period only when user explicitly allows it.
- Or deliver a shorter brief and explain the verification constraint.
- Never fill missing slots with weakly verified claims.

## Quality Bar

- Keep tone neutral and concise.
- Avoid duplicate stories across categories.
- Separate facts from interpretation.
- Include source links for every included story.
- Never use homepage/section/tag links as evidence URLs for included stories.
- Include explicit event date and publish date for every included story, or mark uncertainty.
- End with a short "watch next" view when relevant.
- Never include an uncited claim as a confirmed fact.
- Use `Inference:` prefix for analytical statements not directly confirmed by sources.
- Never promote a claim from `Watchlist` into main sections without re-verification.
- If a claim includes dates, ensure dates are explicitly written and source-backed.

## Audience modes

Apply one mode unless user asks for mixed audience:
- Public readers: plain language, low jargon, broader social impact.
- Founders/SMEs: business impact, compliance implications, operational next steps.
- Investors: market-sensitive updates, policy signals, sector implications.
- Students: definitions first, context before impact, shorter summaries.
- Internal teams: decision-focused summaries, explicit risks and actions.

## Reusable prompts

- "Give me a Singapore news brief for the last 24 hours, standard length."
- "Summarize Singapore policy and business news for this week for SME founders."
- "Create a housing and transport focused Singapore brief with only high-confidence items."
