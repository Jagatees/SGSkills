---
name: sg-open-data-storyteller
description: Turn Singapore open datasets into concise, policy-relevant narratives with trends, caveats, and source-backed implications. Use when users ask for data.gov.sg analysis, public-sector insight summaries, or evidence-based briefs.
---

# SG Open Data Storyteller

## Overview

Use this skill to convert Singapore open data into clear stories for decision-making.
Focus on evidence, public impact, and transparent caveats.

Read `references/insight-rubric.md` for ranking logic.
Use `references/output-template.md` for response format.
Run `references/qa-checklist.md` before final output.

## Workflow

### 1. Confirm scope

Collect or infer:
- Dataset(s): data.gov.sg URL(s) or dataset IDs
- Time window: last 30 days, quarter, year, or custom
- Audience: public, policy teams, operations teams, investors
- Output depth: quick (3 insights), standard (5-7), deep (8+)

Defaults when unclear:
- One primary dataset
- Last 12 months
- Audience: public
- Standard depth

### 2. Profile data before analysis

For each dataset:
- Record dataset title and URL
- Record field names used
- Record latest available date and update timestamp
- Identify missing values and major breaks in series

Hard gate:
- If data is stale for the requested use case or key fields are missing, say so explicitly and reduce confidence.

### 3. Compute and verify insights

Build only simple, auditable claims:
- Level: latest value
- Change: WoW/MoM/YoY where valid
- Context: compare against baseline period

For every claim, keep internal evidence:
- Claim text
- Exact metric/value
- Time period
- Dataset URL

Rules:
- Do not report causal conclusions unless source text supports causality.
- If interpretation is reasonable but not proven, prefix with `Inference:`.
- If a claim cannot be reproduced from visible data, exclude it.

### 4. Rank by decision value

Prioritize insights by:
- Public impact in Singapore
- Timeliness
- Data reliability
- Actionability

Use rubric in `references/insight-rubric.md`.

### 5. Produce the story brief

Follow `references/output-template.md`.

Minimum output requirements:
- Period and update timestamp (SGT)
- Source URL for each insight
- Confidence per insight (`High|Medium|Low`)
- `Caveats` section
- `Watch next` section with 2-3 monitoring signals

## Quality bar

- No uncited numeric claim.
- No low-confidence insight in top 3 highlights.
- Absolute dates only (for example: `February 21, 2026`).
- Clearly separate `Facts` and `Inference:`.
- If data quality is weak, shorten output instead of filling with speculation.

## Reusable prompts

- "Use SG Open Data Storyteller on this data.gov.sg dataset and give me 5 actionable insights."
- "Summarize cost-of-living trends from open data for the last 12 months."
- "Create a policy brief from this dataset for operations teams with caveats."
