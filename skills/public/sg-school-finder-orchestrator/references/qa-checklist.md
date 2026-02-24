# QA Checklist (v1.0)

Pass all checks before sharing output:

1. Required intake fields are present, or output status is `Input Required` with missing-field checklist.
2. No final shortlist is shown when required intake fields are missing.
3. Chained flow is preserved in order: eligibility -> discovery -> admission orchestration.
4. Timestamp is absolute and in SGT.
5. Dates are absolute (for example: `February 24, 2026`) and not only relative labels.
6. Every factual claim row includes a full clickable `https://` source URL.
7. Top recommendations include explicit tradeoffs.
8. Every recommendation row includes `Data Gaps Affecting This Score`.
9. Every recommendation row includes a confidence label.
10. Output includes the status legend (`Input Required`, `Needs verification`, `Eligible`).
11. Output includes explicit no-admission-guarantee note.
12. Any interpretation beyond source text is prefixed with `Inference:`.

Scoring:
- 12/12: Production-ready
- 10-11/12: Usable with minor edits
- 0-9/12: Revise before sharing
