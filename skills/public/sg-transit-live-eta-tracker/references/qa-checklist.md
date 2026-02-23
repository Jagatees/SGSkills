# QA Checklist (v1.0)

Pass all checks before final answer:

1. Includes `Period`, `Updated`, and `Data freshness`.
2. Uses absolute SGT timestamps only.
3. Every update has full `https://` source URL.
4. Every update includes affected service/station and valid `Change type`.
5. Every update has confidence label.
6. No `Low` confidence item in top updates.
7. Any interpretation beyond source text is marked `Inference:`.
8. Watchlist section is present.
9. Caveats section is present and specific.
10. API errors are reported explicitly when encountered.

Scoring:
- 10/10: Production-ready
- 8-9/10: Usable with minor edits
- 0-7/10: Revise before use
