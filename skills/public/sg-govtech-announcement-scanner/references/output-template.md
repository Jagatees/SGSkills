# Output Template

Use this exact structure:

```markdown
# Singapore Government Announcements Feed
Period: <start date> to <end date>
Updated: <timestamp in SGT>
Data freshness: <when sources were checked>
Skill version: <v1.0>

## Top Updates
1. <headline> - <one-line impact>
2. ...

## Updates
- <headline> (<source org>, <publish date>): <1-2 sentence factual summary>
  - Change type: <launch|enhancement|policy-update|incident|deadline|advisory>
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
- Use absolute dates.
- Every update needs one full source URL.
- Keep tone neutral and concise.
