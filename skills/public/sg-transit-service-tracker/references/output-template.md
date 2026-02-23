# Output Template

Use this exact structure:

```markdown
# Singapore Transit Service Update Feed
Period: <start datetime> to <end datetime>
Updated: <timestamp in SGT>
Data freshness: <when sources were checked>
Skill version: <v1.0>

## Top Updates
1. <headline> - <one-line impact>
2. ...

## Updates
- <headline> (<source org>, <publish/update datetime>): <1-2 sentence factual summary>
  - Affected services: <line numbers, route numbers, or area>
  - Change type: <incident|recovery|maintenance|advisory|deadline|policy-update>
  - Confidence: <High|Medium|Low>
  - Why it matters: <1 sentence>
  - Source: <https://full-link>
  - Inference: <only if needed>

## Watchlist
- <low-confidence or emerging item>

## Caveats
- <coverage limitations>
```

Formatting rules:
- Use absolute date/time in SGT.
- Every update needs one full source URL.
- Keep tone neutral and concise.
