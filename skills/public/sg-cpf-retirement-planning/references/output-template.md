# Output Template

## Response Structure

### 1. Header
```markdown
# CPF Retirement Planning Summary
User Profile: <age, employment status>
Applicable Year: <year>
Generated: <timestamp>
Data Freshness: <last source verification>
Skill Version: <version>
```

### 2. Current CPF Parameters
```markdown
## Current CPF Parameters

| Parameter | Value | Source | Confidence |
|-----------|-------|--------|------------|
| OA Interest Rate | <value> | cpf.gov.sg | High |
| SA/MA/RA Interest Rate | <value> | cpf.gov.sg | High |
| Basic Retirement Sum (BRS) | <value> | cpf.gov.sg | High |
| Full Retirement Sum (FRS) | <value> | cpf.gov.sg | High |
| Enhanced Retirement Sum (ERS) | <value> | cpf.gov.sg | High |
| Extra Interest (Below 55) | <value> | cpf.gov.sg | High |
| Extra Interest (55 and above) | <value> | cpf.gov.sg | High |
```

### 3. Applicable Milestones
```markdown
## Applicable Milestones

Based on your current age of <age>:

| Age | Milestone | Action Required | Status |
|-----|-----------|-----------------|--------|
| <age> | Current | <relevant action> | Now |
| <next_age> | <milestone> | <action> | <years> years away |
| ... | ... | ... | ... |
```

### 4. Recommendations
```markdown
## Recommendations

### Priority 1 (Immediate - Within 3 Months)
1. **<Action Title>**
   - Why: <rationale>
   - How: <steps>
   - Source: <citation>

### Priority 2 (Short-term - Within 1 Year)
1. **<Action Title>**
   - Why: <rationale>
   - How: <steps>
   - Source: <citation>

### Priority 3 (Long-term - Beyond 1 Year)
1. **<Action Title>**
   - Why: <rationale>
   - How: <steps>
   - Source: <citation>
```

### 5. Official Tools & Resources
```markdown
## Official Tools & Resources

- **CPF Planner**: https://www.cpf.gov.sg/cpfplanner
  - For personalized retirement projections
- **CPF LIFE Estimator**: https://www.cpf.gov.sg/member/retirement-income/monthly-payouts/cpf-life
  - For CPF LIFE payout estimates
- **MoneySense Retirement Guide**: https://www.moneysense.gov.sg/retirement-planning
  - For comprehensive retirement planning
```

### 6. Caveats
```markdown
## Caveats

1. **Information Currency**: CPF parameters are subject to change. Values reflect latest official announcements as of <date>.

2. **Projections Not Guarantees**: All payout estimates are projections based on current parameters and assumptions. Actual payouts may differ.

3. **Personalization Limit**: This guidance is general in nature. Consult a licensed financial advisor for personalized advice.

4. **Policy Changes**: Government may adjust CPF parameters (interest rates, retirement sums, contribution rates) in future Budgets.

5. **Individual Circumstances**: Special rules may apply for:
   - Self-employed persons
   - Platform workers
   - Non-pensionable civil servants
   - Singapore Permanent Residents
   - Persons with disabilities
```

---

## Confidence Levels

| Level | Definition | When to Use |
|-------|------------|-------------|
| **High** | Directly stated in official CPF/MOM publications with clear effective dates | Interest rates, retirement sums, official policy parameters |
| **Medium** | Inferred from multiple official sources or dependent on user-provided information | Projections, personalized recommendations |
| **Low** | Based on historical patterns or subject to significant policy uncertainty | Long-term projections beyond 5 years |

---

## Source Citation Format

### Inline Citations
- `(CPF, 2026)` for CPF Board publications
- `(MOM, 2026)` for Ministry of Manpower publications
- `(MoneySense, 2026)` for MoneySense resources

### Full Citations
```markdown
*Source: Central Provident Fund Board. "What are the CPF interest rates?" 
https://www.cpf.gov.sg/service/article/what-are-the-cpf-interest-rates 
(Accessed: <date>)*
```

---

## Special Response Modes

### Input Required
```markdown
# Input Required

To provide personalized CPF retirement planning guidance, I need the following:

**Required:**
- Your current age (critical for determining applicable milestones)

**Optional (helps provide better guidance):**
- Employment status (employee, self-employed, platform worker)
- Retirement goals (desired monthly payout, target retirement age)
- Housing situation (HDB/private property, outstanding loans)

Please provide your age to continue.
```

### Escalation Required
```markdown
# Human Review Recommended

Your query requires review by a qualified professional:

**Reason**: <specific reason for escalation>

**Recommended Action**:
- For financial advice: Consult a licensed financial advisor
- For legal interpretation: Consult a qualified lawyer
- For case-specific CPF matters: Contact CPF Board directly at 1800-227-1188

**What I can help with**:
- General CPF scheme information
- Official policy parameters
- Links to government resources
```
