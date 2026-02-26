# QA Checklist: SG Weather Now

- [ ] `As of` timestamp is present in SGT.
- [ ] Scope (area + horizon) is explicit.
- [ ] MSS/NEA is used for core weather claims.
- [ ] Current, 2-hour, and 24-hour sections are separated.
- [ ] Active advisories/warnings are clearly listed (or explicitly none).
- [ ] Time-sensitive items use absolute timestamps.
- [ ] Nowcast and warning timestamps are recent enough for the stated use case; otherwise confidence is lowered.
- [ ] Confidence labels are attached to every section.
- [ ] Facts and inference are separated.
- [ ] No fabricated or single-source warning-level claim is present.
- [ ] Caveat for rapidly changing conditions is included when needed.
