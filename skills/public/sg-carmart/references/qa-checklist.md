# QA Checklist: Sgcarmart Assistant

- [ ] `As of` timestamp is present in SGT.
- [ ] Mode and user constraints are explicitly restated.
- [ ] Every recommended car includes a canonical listing URL.
- [ ] Facts and inference are clearly separated.
- [ ] Money values are shown in SGD only.
- [ ] Monthly components are explicit per car: Loan, Road tax, Insurance, Petrol (or `Unknown`).
- [ ] Missing fields are marked `Unknown` instead of guessed.
- [ ] Confidence label is attached to each car section.
- [ ] Seller details are included when available.
- [ ] At least 3 listing images are included when available.
- [ ] Fallback entries are clearly tagged `Outside constraints` when strict matches are insufficient.
- [ ] Caveats include assumptions and data freshness limits.
