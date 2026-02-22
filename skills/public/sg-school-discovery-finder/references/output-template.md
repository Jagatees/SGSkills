# Singapore School Discovery Report
Period checked: <absolute date>
Updated: <timestamp in SGT>

## Discovery Scope
- Child stage: <...>
- Location context: <...>
- Search radius policy: <...>
- Priorities: <...>
  - Example priorities: short commute, stronger language pathways, balanced academics + CCA, supportive school environment
- Constraints: <...>
  - Example constraints: co-ed only, avoid SAP schools, budget sensitivity, specific support needs
- Candidate depth: <...>

## Input Gate Check
- Required fields: child stage, DOB/birth year, citizenship/residency, home postal code/planning area
- Gate status: <Pass|Fail>
- If `Fail`, stop and request missing fields before final ranked candidate output.

## Candidate Set (Ranked)
| School | Tag | Why Included | Location Fit | Priority Fit | Source |
|---|---|---|---|---|---|
| <school> | <Core match/Consider/Watchlist> | <1 line> | <1 line> | <1 line> | <https://...> |

## Backup Candidates
- <school>: <brief reason> (Source: <https://...>)

## Exclusions
- <school or class of schools>: <explicit reason>

## Facts vs Inference
### Facts
- <source-backed fact>

### Inference:
- <reasoned interpretation>

## Handoff Payload (for shortlist scoring)
- Stage: <...>
- Location: <...>
- Priorities: <...>
- Candidate schools: <ordered list>
- Data gaps: <...>
