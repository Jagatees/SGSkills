# Output Template

Use this clean, user-facing structure:

```markdown
# Singapore Haze Snapshot
Updated: <Month DD, YYYY, HH:MM AM/PM SGT>
Data freshness: <Month DD, YYYY, HH:MM AM/PM SGT>
Period: <start datetime> to <end datetime>
Skill version: <v1.0>

## Quick View
- National PSI (24h): <value> (<band>)
- Highest region now: <region> - <value> (<band>)
- Risk note: <one short sentence>

## By Region
- North: <value> (<band>) | Confidence: <High|Medium|Low>
- South: <value> (<band>) | Confidence: <High|Medium|Low>
- East: <value> (<band>) | Confidence: <High|Medium|Low>
- West: <value> (<band>) | Confidence: <High|Medium|Low>
- Central: <value> (<band>) | Confidence: <High|Medium|Low>

## What This Means
- <1 short practical point>
- <1 short practical point>

## Watchlist
- <only low-confidence or missing-data items>

## Source
- Official PSI API: <https://full-link>

## Caveats
- <API/data limitations>
```

Formatting rules:
- Put `Quick View` first.
- Keep each bullet to one line where possible.
- Use absolute SGT date/time only.
- Use plain wording; avoid jargon.
