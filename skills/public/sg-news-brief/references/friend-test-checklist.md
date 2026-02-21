# Friend Test Checklist (v2.1)

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
- Every included story has at least one source URL.
- Every source is a full clickable `https://` URL (not only domain text).
- Every included story has a confidence label.
- No low-confidence item appears outside `Watchlist`.
- `High` confidence appears only when official + independent corroborating source are present.
- Any non-confirmed analysis line uses the `Inference:` prefix.
- Tone changes correctly for audience mode.
- No duplicate story appears in multiple categories.

## Scoring

- 10/10 checks pass: Ready for wider sharing.
- 8-9 checks pass: Usable, improve weak spots and retest.
- 0-7 checks pass: Revise skill instructions before sharing.
