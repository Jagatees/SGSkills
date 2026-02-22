# QA Checklist

Run before final output:

- Every factual claim has a source URL.
- Source links are full clickable URLs (`https://...`), not labels only.
- All timeline/date references are absolute dates.
- Timestamp is shown in `SGT`.
- No admission guarantee language appears.
- `Facts` and `Inference:` are separated.
- Tradeoffs are explicit for each top recommendation.
- Shortlist table includes `Data Gaps Affecting This Score`.
- If DOB/citizenship/postal code is missing, confidence is capped at `Medium`.
- Low-confidence recommendations are clearly labeled.
- Any missing or stale data is called out in `Caveats`.
- When required inputs are missing, output `Input Required` and do not produce a final shortlist ranking.
