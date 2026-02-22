Run the `sg-school-eligibility-checker` workflow for Singapore context.

If user provides arguments, treat them as scope preferences.

Task description:
Check Singapore school admission baseline eligibility and required verification points before shortlisting schools, using official MOE/school sources.

Follow this skill specification exactly:


# SG School Eligibility Checker

## Overview

Use this skill to perform first-pass eligibility checks before school shortlisting.
Focus on preventing invalid recommendations and surfacing what must be verified with official sources.

Use `references/source-map.md` to prioritize sources.
Use `references/output-template.md` for response format.
Run `references/qa-checklist.md` before final output.

## Workflow

### 1. Confirm scope

Collect or infer:
- Child stage: preschool, primary, secondary, or post-secondary
- Age/date context if provided
- Residency status if provided (citizen/PR/other)
- Home location context (postal code/planning area)
- Constraints (language/support needs, budget, special requirements)

Defaults when unclear:
- Stage: primary when user says only "school"
- Output depth: standard
- Mark missing critical inputs as `Needs verification`

Required inputs gate (must be present for full processing):
- Child stage
- Child DOB (or birth year at minimum)
- Citizenship/residency status (`SC|PR|IS`)
- Home postal code or planning area

If any required input is missing:
- Stop before final eligibility determination.
- Return `Input Required` with a missing-fields checklist.
- Do not output final `Eligible` or `Not eligible` labels.

### 2. Gather official eligibility signals

Prioritize official sources:
- MOE admissions and school information pages
- Official school pages for school-specific requirements

For each requirement captured, retain:
- Requirement statement
- Effective/updated date when available
- Source URL

### 3. Classify eligibility status

For each candidate scenario, label:
- `Eligible`: no clear blockers from available official rules
- `Needs verification`: incomplete data or ambiguous rule interpretation
- `Not eligible`: clear mismatch against official baseline requirements

Rules:
- Do not infer eligibility certainty when critical inputs are missing.
- If any rule date is unclear, cap confidence at `Medium`.

### 4. Produce decision-ready checks

Return:
- Eligibility summary
- Missing information checklist
- Verification steps before shortlisting
- Confidence label (`High|Medium|Low`) and rationale

If required input gate is not met:
- Set status to `Input Required`.
- Provide only what is missing and how to provide it.

### 5. Handoff to next step

If status is `Eligible` or `Needs verification`, prepare a clean handoff payload for school shortlisting:
- Stage
- Location context
- Priority constraints
- Verified vs unverified fields

## Quality bar

- No admission guarantee claims.
- No uncited factual claim.
- Absolute dates for timeline/rule references.
- Use full clickable source links (`https://...`), not source labels only.
- Use `SGT` for output timestamps.
- Clear separation of `Facts` and `Inference:`.
- Every `Not eligible` conclusion must cite a direct official source.
- Never produce a final eligibility result when required inputs are missing; return `Input Required` instead.

## Reusable prompts

- "Use SG School Eligibility Checker to verify what primary school options are valid for my child before shortlisting."
- "Check eligibility constraints for secondary school selection in Singapore and tell me what I still need to verify."
- "Run eligibility checks first, then give me a handoff summary for shortlist building."

Output rules:
1. Use absolute dates.
2. Use full clickable source URLs where factual claims are present.
3. Keep confidence and caveats explicit.
4. Do not claim admission guarantees or certainty beyond evidence.
