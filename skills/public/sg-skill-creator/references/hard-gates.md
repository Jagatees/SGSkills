# SG Skill Creator Hard Gates

Apply these checks before finalizing any SG skill output.

## Evidence gates
- Any factual claim without at least one evidence URL: exclude from final output.
- Any inaccessible, broken, or non-evidentiary URL: exclude claim until replaced.
- Any date-sensitive claim without absolute date: mark uncertain or exclude.

## High-impact gates
- Any high-impact public-interest/policy claim with only one reliable source:
  - downgrade to `Low confidence` + `Verification pending`, or
  - block from main output.
- Any unresolved source conflict on high-impact claims:
  - do not present as confirmed fact.

## Safety gates
- Any request matching disallowed categories: `Refuse`.
- Any `HIGH` risk or regulated-domain skill without explicit approval: `Human Review Required`.
- Any material uncertainty with missing required context: `Input Required`.

## Output gate
- If hard-gate checks are not passed, do not generate final scaffold output.
