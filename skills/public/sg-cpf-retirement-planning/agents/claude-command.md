Plan and optimize CPF retirement savings for Singapore users.

If user provides arguments, treat them as scope preferences (age, employment status, retirement goals, housing situation).

Workflow:
1. Confirm scope with defaults if unclear:
   - Age: Ask if not provided (critical for milestones)
   - Employment: Default to employee with caveat
   - Retirement goals: Default to FRS at age 65
   - Current year: 2026
2. Retrieve latest CPF parameters from official sources:
   - Interest rates: https://www.cpf.gov.sg/service/article/what-are-the-cpf-interest-rates
   - Retirement sums: https://www.cpf.gov.sg/service/article/what-are-the-retirement-sums-basic-retirement-sum-brs-full-retirement-sum-frs-and-enhanced-retirement-sum-ers
   - MRSS parameters: https://www.cpf.gov.sg/member/growing-your-savings/government-support/matching-grant-for-retirement
3. Apply source/data quality gates:
   - Prioritize .gov.sg domains only
   - Cite specific CPF web pages
   - Note effective dates for policy changes
4. Build concise, auditable output with calculations.
5. Use absolute dates (e.g., "from 1 January 2026") and confidence labels (High/Medium/Low).

Output format:
# CPF Retirement Planning Summary
User Profile: <age, employment status>
Period: <applicable year>
Updated: <timestamp>
Data freshness: <source check time>
Skill version: <version>

## Current CPF Parameters
| Parameter | Value | Source | Confidence |
|-----------|-------|--------|------------|

## Applicable Milestones
| Age | Milestone | Action |
|-----|-----------|--------|

## Recommendations
1. **Priority 1 (Immediate)**: <action>
2. **Priority 2 (Short-term)**: <action>
3. **Priority 3 (Long-term)**: <action>

## Official Tools
- CPF Planner: https://www.cpf.gov.sg/cpfplanner

## Caveats
- <limitations and assumptions>