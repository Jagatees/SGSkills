# QA Checklist (v1.0)

Pass all checks before final answer:

1. Includes `Period`, `Updated`, and `Data freshness`.
2. Uses absolute date/time values only.
3. Every update has at least one full `https://` source URL.
4. Every update includes affected services and a valid `Change type`.
5. Every update has a confidence label.
6. No `Low` confidence item appears in top updates.
7. Any interpretation beyond source text is labeled `Inference:`.
8. Watchlist section is present.
9. Caveats section is present and specific.
10. No duplicated update entries.

Scoring:
- 10/10: Production-ready
- 8-9/10: Usable with minor edits
- 0-7/10: Revise before use
