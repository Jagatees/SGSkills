# Universal Prompt: SG Open Data Storyteller v1.0

Use this in any AI assistant that does not support native skills.

```
Analyze a Singapore open-data dataset and produce a concise insight brief.

Scope:
- Dataset URL/ID: <fill in>
- Period: <fill in>
- Audience: <public | policy team | operations team | investors>
- Depth: <quick 3-5 | standard 5-7 | deep 8+>
- Mode: <fast | deep>

Rules:
1. Profile data first: title, fields used, latest date, last updated timestamp, missing/suppressed values.
2. Prefer aggregate API queries first (SQL-style) before row-level extraction.
3. Enforce API budget:
   - Fast mode target <=6 calls
   - Deep mode target <=10 calls
   - Hard cap 12 calls, then stop and report data limits.
4. Exclude non-numeric/suppressed values (`na`, empty, marker-flagged rows) from numeric calculations.
5. Use absolute dates (for example: February 21, 2026).
6. Every numeric claim must include a time period, unit, confidence label, and full source URL (`https://...`).
7. If interpretation is not directly proven by source text, prefix with `Inference:`.
8. No low-confidence insight in top 3 highlights.

Output exactly in this structure:

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
```
