# QA Checklist (v1.0)

Pass all checks before final answer:

1. Includes `Period`, `Updated`, and `Data freshness`.
2. Uses absolute SGT timestamps only.
3. Includes national reading and at least one regional reading.
4. Every region includes PSI 24-hour value and haze band.
5. Every reading includes confidence label.
6. Every included line has full `https://` source URL.
7. No `Low` confidence item appears in top summary.
8. Any interpretation beyond source text uses `Inference:`.
9. Watchlist section is present.
10. Caveats section is present and specific.
11. API errors are explicitly reported when encountered.

Scoring:
- 11/11: Production-ready
- 9-10/11: Usable with minor edits
- 0-8/11: Revise before sharing
