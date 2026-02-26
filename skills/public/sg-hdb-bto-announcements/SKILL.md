---
name: sg-hdb-bto-announcements
description: Explain Singapore HDB BTO launches and application steps using official sources, clear process stages, and confidence labels.
jurisdiction: SG
review_due: 2026-05-27
---

# SG HDB BTO Announcements

## Overview

Use this skill to give a simple, accurate summary of Singapore BTO information:
- current or recent launch details
- the BTO application process
- what users should check next

This skill is for practical planning and awareness, not legal advice or guaranteed outcome prediction.

Read these references before running:
- `references/intake.md`
- `references/output-template.md`
- `references/source-map.md`
- `references/qa-checklist.md`
- `references/safety-assumptions.md`
- `references/review-contacts.md`
- `references/safety-evals.md`

## Workflow

### 1. Confirm request and scope

Capture or infer:
- Geography: Singapore-wide or town/project-specific
- Request type: latest launch summary, process explainer, or both
- User goal: first-time understanding, timeline planning, or document prep

If missing, default to:
- Singapore-wide
- latest launch summary + process explainer
- concise output

### 2. Safety and misuse triage

Record:
- Risk tier: `MEDIUM`
- Regulated domain: `No` (housing guidance; not legal representation)
- Sensitive-period mode: `No` unless directed by user or policy event context

Blocking behavior:
- Return `Refuse` for deceptive, abusive, or fraudulent requests.
- Return `Input Required` if user asks for outcome guarantees or missing core context.
- Return `Human Review Required` for legal interpretation or high-stakes financial/legal decisions framed as definitive advice.

### 3. Gather sources with trust tiers

Use this order:
1. Tier 1 (primary): HDB and other official Singapore government pages.
2. Tier 2: Official media releases and mainstream reports quoting agencies.
3. Tier 3: Forums/social posts only as weak signals; never sole basis.

Verification rules:
- For launch details, prioritize official pages with publication dates.
- For eligibility or grants, link to official pages and avoid uncited rules.
- If source timestamps conflict, report conflict and use latest official timestamp.
- If only non-official signals exist, mark `Low confidence` and `Verification pending`.

### 4. Produce BTO-focused output

Follow `references/output-template.md`.
Include:
- Latest launch snapshot
- Simple process steps
- Key checks for users
- Caveats and next action
- Confidence label and source links for each major section

Use absolute timestamps in Singapore time when date/time is relevant.

### 5. Apply QA and safety checks

Before finalizing:
- Run `references/qa-checklist.md`
- Distinguish official facts from interpretation
- Avoid guaranteed outcomes
- Ensure each major section includes at least one official source link
- Add caveat if information may change after publication

### 6. Return final response

Return concise, actionable guidance.
If user asks for "quick mode", use short sections:
1. Latest
2. Process
3. What to do now
4. Confidence + links

## Quality Bar

- Uses HDB/government sources first for claims.
- Includes absolute dates for launch/application timelines.
- Keeps process explanation simple and step-based.
- Separates facts from guidance.
- Adds confidence labels to each major section.

## Reusable prompts

- "Use $sg-hdb-bto-announcements and explain the BTO process in simple steps with official links."
- "Summarize the latest HDB BTO launch and what first-time applicants should do next."
- "Give me a quick BTO guide: key dates, process, and confidence labels."
