# Output Template

Use this exact structure:

```markdown
# Singapore Live Transit Snapshot
Period: <start datetime> to <end datetime>
Updated: <timestamp in SGT>
Data freshness: <when APIs/pages were checked>
Skill version: <v1.0>

## Top Updates
1. <headline> - <one-line impact>
2. ...

## Live Updates
- <headline> (<source org>, <observed datetime>): <1-2 sentence factual summary>
  - Affected services/stations: <services or lines>
  - Change type: <eta-update|delay|disruption|recovery|maintenance|advisory>
  - Confidence: <High|Medium|Low>
  - Why it matters: <1 sentence>
  - Source: <https://full-link>
  - Inference: <only if needed>

## Watchlist
- <low-confidence or emerging item>

## Caveats
- <coverage or API limitations>
```

Formatting rules:
- Use absolute date/time in SGT.
- Every update needs one full source URL.
- Keep tone concise and operational.
