# Singapore School Eligibility Check
Period checked: <absolute date>
Updated: <timestamp in SGT>

## Input Summary
- Child stage: <...>
- Age/date context: <...>
- Residency status: <...>
- Location: <...>
- Priorities: <...>
  - Example priorities: short commute, strong English/Chinese support, balanced academics + CCA, supportive environment
- Constraints: <...>
  - Example constraints: budget limit, no SAP preference, needs school-based learning support, co-ed only

## Eligibility Result
- Status: <Input Required|Eligible|Needs verification|Not eligible>
- Confidence: <High|Medium|Low>
- Rationale: <1-3 lines>

## Rule Checks
| Check | Result | Evidence | Source |
|---|---|---|---|
| <rule> | <Pass/Needs verification/Fail> | <short note> | <https://...> |

## Missing Information
- <required input not provided>

## Input Gate Check
- Required fields: child stage, DOB/birth year, citizenship/residency, home postal code/planning area
- Gate status: <Pass|Fail>
- If `Fail`, stop and request missing fields before final eligibility output.

## Facts vs Inference
### Facts
- <source-backed facts>

### Inference:
- <reasoned interpretation>

## Next Step Handoff
- Ready for shortlist: <Yes/No>
- Handoff payload:
  - Stage: <...>
  - Location: <...>
  - Priorities: <...>
  - Verified fields: <...>
  - Unverified fields: <...>
