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
Use `references/api-query-recipes.md` to keep API calls minimal.
Use `references/ops-checklist.md` for caching, telemetry, and quota-safe operations.

## Workflow

### 1. Confirm scope

Collect or infer:
- Dataset(s): data.gov.sg URL(s) or dataset IDs
- Time window: last 30 days, quarter, year, or custom
- Audience: public, policy teams, operations teams, investors
- Output depth: quick (3 insights), standard (5-7), deep (8+)

Defaults when unclear:
- One primary dataset
- Time window by frequency:
  - Annual datasets: latest complete year (or latest 2 complete years for YoY)
  - Monthly/weekly/daily datasets: last 12 months
- Audience: public
- Standard depth
- Run mode: `fast`

Run modes:
- `fast` (default): 3-5 insights, SQL-first, target <=6 API calls, no exhaustive row extraction.
- `deep`: 8+ insights, may use limited row-level calls after aggregates, target <=10 API calls.
- If user requests deep mode, warn that rate-limit risk is higher.

### 1.5 Retrieve data reliably (data.gov.sg API playbook)

Use this order to avoid flaky runs:
- Prefer `datastore_search_sql` for aggregates (fewer calls, easier to cite).
- Use `datastore_search` only when row-level records are needed.
- Use one API call per command (avoid multi-step chained shell commands).
- Start with metadata + 2-4 aggregate SQL calls; avoid full-table extraction by default.
- Before calling APIs, check if valid cached results exist for the same dataset + query.

Primary endpoints:
- Metadata/page context: `https://data.gov.sg/datasets/<dataset_id>/view`
- Row API: `https://data.gov.sg/api/action/datastore_search?resource_id=<dataset_id>&limit=<n>&offset=<m>`
- SQL API: `https://data.gov.sg/api/action/datastore_search_sql?sql=<url_encoded_sql>`

Rate-limit and access handling:
- If API returns `TOO_MANY_REQUESTS` (code `24`), wait 10-12 seconds and retry once.
- If still blocked, switch to `datastore_search_sql` with narrower queries.
- Use bounded retries only:
  - Max 2 retries per endpoint
  - Backoff: 10s, then 20s
  - If still blocked, stop and report partial/unavailable coverage explicitly.
- Enforce call budget to prevent runaway retries:
  - Fast mode target: <=6 total API calls per dataset
  - Deep mode target: <=10 total API calls per dataset
  - Hard cap: 12 calls in any mode; after cap, stop fetching and publish with explicit data-limit caveat
- If network/permission constraints block direct API calls, use the dataset page to capture:
  - Latest date coverage
  - Last updated timestamp
  - Visible field names and sample rows
  Then reduce confidence and state the limitation explicitly.
- If an API key is available, prefer authenticated requests for higher and more stable quotas.

Pagination and completeness:
- Check `result.total`, `result.limit`, and `result._links.next`.
- For full extracts, iterate offsets only when essential to answer the user request.
- Record row counts used in analysis (for reproducibility).
- Prefer publishing high-confidence aggregate insights over failing on exhaustive extraction.

Caching policy:
- Cache reusable responses for metadata and common aggregate queries.
- Suggested cache TTLs:
  - Metadata/profile calls: 24 hours
  - Aggregate trend queries: 6 hours
  - Row-level detail queries: 1 hour
- If cache is used, include cache timestamp in internal notes and keep source URL unchanged.

### 2. Profile data before analysis

For each dataset:
- Record dataset title and URL
- Record field names used
- Record latest available date and update timestamp
- Identify missing values and major breaks in series

Hard gate:
- If data is stale for the requested use case or key fields are missing, say so explicitly and reduce confidence.

### 2.5 Clean and validate metrics before aggregation

Before computing numeric trends:
- Treat the following as non-numeric/missing unless the dataset explicitly documents otherwise:
  - `na`, `NA`, empty strings
  - values flagged with markers such as `^`, `*`, `#`, `**`
- Exclude invalid rows from numeric calculations.
- Record the number and share of excluded rows for each metric/time period.
- If excluded share is high (>=10%), cap confidence at `Medium` unless a stronger justification is provided.

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
- For every aggregate claim, state the aggregation method:
  - `Unweighted row mean`, `Weighted by cohort size`, `Median across rows`, etc.
- If weighting is unavailable, say so and avoid policy claims that assume population representativeness.

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
