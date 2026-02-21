Analyze a Singapore open-data dataset and produce a concise insight brief.

If the user provides arguments, treat them as scope preferences (dataset URL/ID, period, audience, depth, mode).

Follow this workflow:
1. Confirm scope. If unclear, default to one dataset, public audience, standard depth (5-7 insights), and fast mode.
2. Profile data first: title, fields used, latest date, last updated time, missing/suppressed values.
3. Prefer aggregate API queries first (SQL-style) before row-level extraction.
4. Enforce call budget and retries:
   - Fast mode target <=6 calls (hard cap 12)
   - Retry only with bounded backoff, then stop and report limits
5. Exclude non-numeric/suppressed values (`na`, empty, marker-flagged rows) from numeric calculations.
6. Use absolute dates (for example: February 21, 2026).
7. For every numeric claim, include period, unit, source URL, confidence label.
8. If interpretation is not directly proven by source text, prefix with `Inference:`.

Output format:

# Singapore Open Data Story Brief
Period: <start date> to <end date>
Updated: <timestamp in SGT>
Data freshness: <when sources were checked>
Skill version: v1.0

## Top Highlights
1. <insight title> - <one-line why it matters>
2. ...

## Insights
- <insight title> (<dataset name>, <latest date used>): <2-3 sentence factual summary>
  - Confidence: <High|Medium|Low>
  - Why it matters: <1 sentence>
  - Source: <https://full-dataset-link-or-query-link>
  - Aggregation method: <Unweighted row mean | Weighted by cohort size | Median across rows | ...>
  - Inference: <only if needed>

## Caveats
- <known data limitation>

## Watch next
- <metric or signal to monitor next update>
