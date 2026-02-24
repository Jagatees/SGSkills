# Friend Test Checklist (v2.2)

Use this checklist to validate whether the skill is production-ready.

## Test prompts

1. "Give me a Singapore news brief for the last 24 hours, standard length."
2. "Use SG News Brief for SME founders, policy + business only."
3. "Use SG News Brief for students, explain technical terms simply."
4. "Only include high-confidence stories and show source links."
5. "Give me a 7-day brief and mark uncertain items clearly."

## Pass criteria

- Includes `Period`, `Updated`, and `Data freshness`.
- Uses absolute dates (for example: `February 21, 2026`).
- Every included story has both `event date` and `publish date` validated or explicitly marked uncertain.
- Every included story has at least one source URL.
- Every source is a full clickable `https://` URL (not only domain text).
- No included story uses homepage/section/tag URLs as evidence links.
- Every included story has a confidence label.
- No low-confidence item appears outside `Watchlist`.
- `High` confidence appears only when a Tier 1 primary source URL and an independent corroborating source URL are both present in output.
- `Partially verified` items, if included, are marked `Confidence: Medium` with explicit uncertainty wording.
- Policy/legal status claims are backed by at least one primary source URL.
- Any non-confirmed analysis line uses the `Inference:` prefix.
- Tone changes correctly for audience mode.
- No duplicate story appears in multiple categories.
- No headline claim appears unless it is verified in the internal claim-evidence table.
- If fewer than 3 verified stories exist for `last 24 hours`, output a shorter brief with explicit note unless user explicitly allows widening.

## Scoring

- 17/17 checks pass: Ready for wider sharing.
- 14-16 checks pass: Usable, improve weak spots and retest.
- 0-13 checks pass: Revise skill instructions before sharing.
