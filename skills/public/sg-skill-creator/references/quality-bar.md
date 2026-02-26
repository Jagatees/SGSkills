# SG Skill Creator Quality Bar

## Structure
- [ ] Front matter has `name` and `description`.
- [ ] Front matter has `jurisdiction: SG`.
- [ ] Front matter has `review_due` in `YYYY-MM-DD` and is set to publish date + 90 days.
- [ ] Sections include Overview, Workflow, Quality Bar, Reusable prompts.
- [ ] Workflow is step-by-step and executable.

## Singapore quality
- [ ] Singapore context is explicit in scope and examples.
- [ ] Official Singapore sources are prioritized where applicable.
- [ ] Source trust tiers (Tier 1/2/3) are defined and enforced.
- [ ] Date handling uses absolute dates when needed.
- [ ] Facts vs inference are clearly separated.
- [ ] If non-official sources are used, rationale and confidence downgrade are explicit.
- [ ] Public-interest/policy claims follow 2-source rule or explicitly fall back to low-confidence pending verification.

## Reliability
- [ ] Missing-input behavior is defined.
- [ ] Confidence/caveat behavior is defined for uncertain outputs.
- [ ] Output format and quality checks are explicit.
- [ ] Guided mode behavior (`Quick`/`Standard`/`Strict`) is defined.
- [ ] Preview-first selection exists (2-3 mini output previews before full output).

## Safety (blocking)
- [ ] Risk tier (`LOW`/`MEDIUM`/`HIGH`) is recorded.
- [ ] Regulated-domain check is recorded (healthcare/finance/legal/education admissions/public safety).
- [ ] Disallowed-use categories are checked and none are enabled.
- [ ] Refusal behavior is explicit for harmful/illegal/abusive requests.
- [ ] Human review escalation is explicit for `HIGH` risk.
- [ ] Human review escalation is explicit for regulated domains unless prior explicit approval exists.
- [ ] `references/review-contacts.md` exists and defines approver roles.
- [ ] PDPA/privacy guardrails are explicit (collection minimization + redaction rules).
- [ ] Singpass/MyInfo/government-portal misuse workflows are explicitly disallowed.
- [ ] Social-harmony guardrail is explicit (no racial/religious/community harm enablement).
- [ ] Election/sensitive-period mode behavior is defined when applicable.
- [ ] Sensitive data export controls are defined (destination + access control) or export is disallowed.
- [ ] Refusal/escalation tests exist (>=3 refuse, >=2 escalate prompts).
- [ ] Proceed-with-caveat tests exist (>=2 prompts).
- [ ] `references/safety-evals.md` exists or equivalent tests are documented.
- [ ] Hard gates are explicit and enforced (missing URL, single-source high-impact, inaccessible evidence).

## Delivery
- [ ] `agents/openai.yaml` exists and is usable.
- [ ] References files match what SKILL.md requires.
- [ ] Prompts are practical for real user requests.
- [ ] `references/safety-assumptions.md` exists for safety-critical skills.
