---
name: sg-school-discovery-finder
description: Build a source-backed candidate list of Singapore schools by stage, location, and family priorities before final scoring and shortlist decisions.
---

# SG School Discovery Finder

## Overview

Use this skill to generate an initial candidate school set for Singapore families after baseline eligibility checks.
Focus on official coverage, transparent filters, and practical commute-first discovery.

Use `references/source-map.md` to prioritize sources.
Use `references/output-template.md` for response format.
Run `references/qa-checklist.md` before final output.

## Workflow

### 1. Confirm discovery scope

Collect or infer:
- Child stage: preschool, primary, secondary, or post-secondary
- Location context: postal code, planning area, town, or region
- Search radius preference: near-home first, broader area, or custom
- Priorities: language, programs, CCA, support needs, school type
- Candidate depth: quick (10), standard (15-20), deep (25+)

Defaults when unclear:
- Stage: primary
- Candidate depth: standard
- Search policy: near-home practical commute first

Required inputs gate (must be present for full discovery set):
- Child stage
- Child DOB (or birth year at minimum)
- Citizenship/residency status (`SC|PR|IS`)
- Home postal code or planning area

If any required input is missing:
- Return `Input Required` with missing-fields checklist.
- Do not output final ranked candidate set.
- Optionally provide a clearly labeled `Preview only` sample list.

### 2. Pull official candidate inventory

Build candidate list from official sources first:
- MOE school directories/listing pages
- Official school pages for profile fields

For each candidate capture:
- School name
- Level/type
- Location/address
- Key programs/support markers
- Source URL

Rules:
- Exclude candidates without official source verification.
- If location or level is ambiguous, keep in watchlist instead of main candidate set.

### 3. Apply discovery filters

Filter candidates based on:
- Stage/type match
- Location relevance and commute practicality
- Family-priority signals (language/program/support fit)

Tag each school with:
- `Core match` (high relevance)
- `Consider` (partial fit)
- `Watchlist` (insufficient data or lower fit)

### 4. Rank for handoff

Create ranked candidate output for downstream shortlisting:
- Top candidate set (for orchestrator scoring)
- Backup candidate set
- Excluded items with reason

Rules:
- Do not claim admission probability.
- Keep ranking objective and auditable with short criteria notes.

### 5. Produce handoff payload

Use output template and include:
- Candidate table with tags and rationale
- Filter logic summary
- Coverage caveats
- Handoff payload for scoring/shortlist step

If required input gate is not met:
- Output only missing fields and the exact input format needed.
- Do not produce handoff payload for final shortlist scoring.

## Quality bar

- No uncited factual claim.
- Absolute dates for any time-sensitive references.
- Use full clickable source links (`https://...`), not source labels only.
- Use `SGT` for output timestamps.
- Every included candidate has an official source URL.
- Exclusion reasons are explicit.
- Clear separation of `Facts` and `Inference:`.
- Never produce final ranked discovery output when required inputs are missing; return `Input Required` instead.

## Reusable prompts

- "Use SG School Discovery Finder to build a primary-school candidate list near Tampines with practical commute and language support considerations."
- "Find candidate secondary schools based on support needs and co-curricular priorities, then return a ranked handoff payload."
- "Generate a standard-depth candidate school list with clear include/exclude reasons and source links."
