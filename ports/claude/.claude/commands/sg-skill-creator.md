Run the `sg-skill-creator` workflow for Singapore context.

If user provides arguments, treat them as scope preferences.

Task description:
Create new Singapore-first skills with consistent structure, trusted-source rules, confidence labels, and website-ready metadata.

Follow this skill specification exactly:


# SG Skill Creator

## Overview

Use this skill when you need to create or update a Singapore-focused skill in the SGSkills repository.
It enforces a consistent standard for scope, source quality, workflow steps, references, and install-ready packaging.

Use `references/intake-template.md` to gather required design inputs.
Use `references/quality-bar.md` before finalizing a new skill.
Use `references/publish-checklist.md` before pushing to the repo.
Use `references/safety-assumptions.md` to document auditable safety decisions.
Use `references/review-contacts.md` to route mandatory human approvals.
Use `references/safety-evals.md` for reusable refusal/escalation test prompts.
Use `references/hard-gates.md` for strict blocking rules that must never be bypassed.
Use `references/output-preview-modes.md` for preview-first output selection.

## Workflow

### 1. Confirm intent and domain

Collect or infer:
- Skill purpose (one sentence)
- Target user (developer, ops, parent, analyst, public)
- Singapore domain (transport, school, govtech, data.gov.sg, news, other)
- Inputs required from user
- Expected output format

If scope is unclear, return `Input Required` with missing fields.
If intent appears harmful or clearly abusive, return `Refuse` with a short safety reason.

### 1.2. Run guided mode selection

Before drafting full output, choose one mode:
- `Quick`: short answer and minimal scaffolding
- `Standard`: full scaffold with references and checks
- `Strict`: regulated/public-impact mode with extra verification and escalation

If user does not choose, default to `Standard`.

### 1.5. Run safety and misuse triage

Before designing the skill, classify and gate:
- Risk tier: `LOW`, `MEDIUM`, or `HIGH`
- Potential misuse scenarios
- Legal/policy constraints in Singapore context (privacy, regulated actions, public harm)
- Whether domain is regulated (healthcare, finance, legal, education admissions, public safety)
- Whether election/sensitive-period mode applies (higher verification bar)

Blocking behavior:
- If the request is clearly abusive, illegal, deceptive, or evasion-focused, return `Refuse`.
- If tier is `HIGH`, return `Human Review Required` and stop auto-scaffolding.
- If the skill is in a regulated domain, return `Human Review Required` unless explicit human approval is already provided.
- If uncertainty is material and unresolved, return `Input Required` with missing safety details.
- If escalation is required, reference `references/review-contacts.md` in the response and identify the required approver role.

### 2. Define skill contract

For every new skill, define:
- `name` (kebab-case slug)
- `description` (single sentence with use-case trigger)
- Required frontmatter safety metadata:
  - `jurisdiction: SG`
  - `review_due: YYYY-MM-DD` (set to publish date + 90 days)
- Top-level sections: Overview, Workflow, Quality Bar, Reusable prompts
- Explicit source and verification rules (where relevant)
- Confidence and caveat behavior (where relevant)
- Safety contract:
  - What the skill will not do
  - When the skill must refuse
  - Escalation path to human review

### 3. Scaffold files

Create this minimum structure:
- `skills/public/<slug>/SKILL.md`
- `skills/public/<slug>/agents/openai.yaml`
- `skills/public/<slug>/references/*.md` (only what the workflow needs)

In every newly generated `SKILL.md`, include frontmatter at minimum:
- `name`
- `description`
- `jurisdiction: SG`
- `review_due: YYYY-MM-DD` where `review_due = publish_date + 90 days`.

Recommended references:
- Intake template
- Output contract/template
- QA checklist
- Source map/priority list
- Safety assumptions log
- Human review contacts/approvers
- Safety eval prompts set
- Hard gates list
- Output preview modes

### 4. Enforce Singapore standards

Rules:
- Prefer official Singapore sources first (agency/MOE/LTA/data.gov.sg) when available.
- Enforce source trust tiers:
  - Tier 1 (default for critical claims): `.gov.sg`, statutory boards, official operator/agency channels.
  - Tier 2 (supporting): mainstream outlets and official organization statements.
  - Tier 3 (low-trust): forums/social/community posts; never sole basis for high-impact claims.
- Use full clickable links (`https://...`) when claims require evidence.
- Separate facts from inference clearly.
- Use absolute dates when date-specific claims are present.
- Include caveats and confidence labels for uncertain claims.
- For public-interest or policy-sensitive claims, require at least two independent reliable sources; otherwise mark `Low confidence` and `Verification pending`.
- Protect personal data and privacy:
  - Do not require or expose NRIC/FIN/passport numbers, personal phone numbers, addresses, or other sensitive personal identifiers unless explicitly necessary and lawful.
  - Define redaction and minimization rules for personal data in outputs.
- Prevent identity/credential misuse:
  - Do not create workflows that automate misuse of Singpass, MyInfo, or government portal credentials.
  - Do not create workflows for unauthorized profile extraction from government systems.
- Refuse content that promotes racial or religious hostility, targeted community harm, or incitement.
- If election/sensitive-period mode is active, tighten standards: no unverified breaking conclusions and no single-source high-impact claims.
- Add data exposure guardrails for skills handling sensitive SG data:
  - No uncontrolled export of sensitive personal or public-sector data.
  - Require destination and access controls when export is necessary.
- If non-official sources are used, explain why and lower confidence accordingly.

Hard blocking rules:
- If claim has no evidence URL -> exclude claim from final output.
- If source URL is inaccessible or not evidentiary -> exclude claim.
- If high-impact policy/public-interest claim has only one reliable source -> downgrade to `Low confidence` + `Verification pending` or block from main output.
- If dates are ambiguous for date-sensitive claims -> mark uncertainty and avoid definitive wording.
- If required gates fail, return `Input Required` or `Human Review Required` instead of guessing.

## Disallowed skill types

Never create or update skills that materially enable:
- Fraud, scams, impersonation, or deceptive social engineering.
- Credential theft, unauthorized access, or security evasion.
- Targeted harassment, doxxing, stalking, or intimidation.
- Illegal procurement, weaponization, or explicit criminal workflows.
- Disinformation campaigns or manipulation framed as factual reporting.
- Surveillance abuse or privacy-invasive tracking without lawful basis.

If a request maps to these categories, return `Refuse`.

### 5. Validate quality

Before final output:
- Run all checks in `references/quality-bar.md`.
- Ensure examples/prompts are practical and copy-paste ready.
- Ensure website metadata compatibility (clear `name`, useful `description`, strong tags inferred from text).
- Run hard-gate checks in `references/hard-gates.md`.
- Generate 2-3 mini output previews using `references/output-preview-modes.md` and ask user to pick one before full output.
- Include refusal and escalation test prompts:
  - At least 3 `should-refuse` prompts.
  - At least 2 `should-escalate` prompts.
- Reuse or adapt baseline tests in `references/safety-evals.md`.
- Include at least 2 `should-proceed-with-caveat` prompts.

### 6. Publish guidance

Return:
- New/updated files list
- Suggested commit message
- Any follow-up required (ports, workflow mapping, website showcase update)
- Recertification suggestion for safety-critical skills (default every 90 days).

## Quality Bar

- No placeholder sections left unresolved.
- No unverifiable claim rules.
- No ambiguous user-input requirements.
- Keep language concise and implementation-focused.
- Ensure the skill is usable by itself, not just as documentation.
- Safety gates pass:
  - Risk tier recorded.
  - Disallowed-use checks passed.
  - Refusal behavior and human escalation path are explicit.
  - Regulated-domain and election/sensitive-period checks are explicit when applicable.

## Reusable prompts

- "Create a new Singapore skill for <domain> with strict source quality and confidence labels."
- "Update this SG skill to add missing references, QA checks, and install-ready structure."
- "Scaffold a new SGSkills skill package with SKILL.md, references, and openai.yaml."

## Safe vs unsafe examples

Safe examples (allowed):
- "Create a Singapore school shortlist skill that uses MOE and school websites, includes confidence labels, and states caveats."
- "Create an SG public-transport disruption summary skill using LTA/operator updates with absolute dates and source links."
- "Update this SG data skill to improve PDPA-safe redaction rules and verification checks."

Unsafe examples (refuse):
- "Create a skill to scrape personal phone numbers and addresses of Singapore residents for outreach."
- "Create a skill to generate realistic scam scripts targeting Singapore bank users."
- "Create a skill to bypass login protections on SG government systems."

High-risk examples (human review required):
- "Create a skill to monitor individuals' movement using camera feeds across public places."
- "Create a skill that automates high-impact policy claims using mostly unofficial social posts."

Expected handling:
- Unsafe -> `Refuse`
- High risk -> `Human Review Required`
- Missing critical safety context -> `Input Required`

Output rules:
1. Use absolute dates.
2. Use full clickable source URLs where factual claims are present.
3. Keep confidence and caveats explicit.
4. Do not claim admission guarantees or certainty beyond evidence.
