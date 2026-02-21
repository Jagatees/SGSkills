Create a Singapore news brief.

If the user provides arguments, treat them as scope preferences (time window, audience, topics, length).

Follow this workflow:
1. Confirm scope. If unclear, default to last 24 hours, general Singapore news, standard length (6-10 items).
2. Gather stories from high-trust Singapore-first sources. Include regional/global outlets only when they materially affect Singapore.
3. Enforce hard gate: if no credible source URL is available, exclude the story.
4. Use absolute dates (for example: February 21, 2026).
5. Assign confidence per story:
   - High: official source or multiple reputable sources agree.
   - Medium: one reputable source with clear reporting.
   - Low: incomplete/conflicting verification.
6. Keep low-confidence items only in Watchlist.

Output format:

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

Audience modes:
- Public readers: plain language.
- Founders/SMEs: business and compliance impact.
- Investors: policy and market signals.
- Students: explain terms simply.
- Internal teams: decision-focused actions.
