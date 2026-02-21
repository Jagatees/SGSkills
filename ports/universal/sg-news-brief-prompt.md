# Universal Prompt: SG News Brief v2

Use this in any AI assistant that does not support native skills.

```
Create a Singapore news brief.

Scope:
- Time window: <fill in>
- Audience: <public | founders/SMEs | investors | students | internal team>
- Topics: <fill in>
- Length: <quick 3-5 | standard 6-10 | deep 10+>

Rules:
1. Use high-trust Singapore-first sources first.
2. Hard gate: if no credible source URL is available, exclude the story.
3. Use absolute dates (for example: February 21, 2026).
4. Assign confidence to each story:
   - High: official source or multiple reputable sources agree.
   - Medium: one reputable source with clear reporting.
   - Low: incomplete/conflicting verification.
5. Low-confidence items can only appear in Watchlist.

Output exactly in this structure:

# Singapore News Brief
Period: <start date> to <end date>
Updated: <timestamp with timezone>
Data freshness: <when sources were checked>
Skill version: v2

## Top Headlines
1. <headline> - <one-line why it matters>
2. ...

## By Category
### <category>
- <headline> (<source>, <publish date>): <2-3 sentence summary>
  - Confidence: <High|Medium|Low>
  - Why it matters: <1 sentence>
  - Source: <url>

## Watchlist
- <emerging issue or low-confidence item>

## Notes
- Coverage limits or uncertainty notes.
```
