# QA Checklist

## Pre-Response Quality Check

Before finalizing any response, verify all items below:

### Source Quality
- [ ] All numeric claims cite official .gov.sg sources
- [ ] No non-.gov.sg domains cited as authoritative
- [ ] Source URLs are valid and accessible
- [ ] Interest rates specify floor rate or pegged rate
- [ ] Retirement sums specify the applicable year

### Accuracy
- [ ] Interest rates match current CPF published rates
- [ ] Retirement sums (BRS/FRS/ERS) are current year values
- [ ] Extra interest tiers are correctly stated
- [ ] CPF LIFE plan descriptions are accurate
- [ ] Milestone ages are correct (55, 65, 70)

### Formatting
- [ ] Absolute dates used (e.g., "from 1 January 2026")
- [ ] Confidence labels applied to all claims
- [ ] Currency values formatted consistently (S$ or $)
- [ ] Tables properly formatted with headers
- [ ] Links are clickable and correct

### Completeness
- [ ] User's age confirmed or requested
- [ ] Applicable milestones provided for user's age
- [ ] At least one recommendation per priority level
- [ ] CPF Planner link included
- [ ] Caveats section included

### Safety
- [ ] No personalized financial advice provided
- [ ] No deterministic claims (guarantees)
- [ ] No sensitive personal data requested or stored
- [ ] Projections noted as estimates, not guarantees
- [ ] Escalation triggered when appropriate

---

## Post-Response Verification

### For Numeric Outputs
| Parameter | Expected Source | Verification Method |
|-----------|-----------------|---------------------|
| OA Interest Rate | cpf.gov.sg | Check interest rate page |
| SA/MA/RA Interest Rate | cpf.gov.sg | Check interest rate page |
| BRS | cpf.gov.sg | Check retirement sums page |
| FRS | cpf.gov.sg | Should equal 2 × BRS |
| ERS | cpf.gov.sg | Should equal 4 × BRS |

### For Recommendation Quality
- [ ] Recommendations are actionable
- [ ] Recommendations are prioritized correctly
- [ ] Each recommendation cites a source
- [ ] Recommendations match user's life stage

### For User Context
- [ ] Response addresses user's stated goals
- [ ] Age-appropriate milestones included
- [ ] Employment status considered (if provided)
- [ ] Housing situation considered (if provided)

---

## Error Recovery

### Missing Required Input
If age is not provided:
1. Return "Input Required" response
2. Explain why age is critical
3. Offer to proceed with general guidance if user prefers

### Source Unavailable
If official source is temporarily unavailable:
1. Acknowledge limitation
2. Provide most recent known values with date
3. Direct user to CPF website for verification
4. Apply "Medium" or "Low" confidence label

### Conflicting Information
If sources conflict:
1. Use primary source (cpf.gov.sg) as authoritative
2. Note discrepancy in caveats
3. Apply "Medium" confidence label
4. Direct user to CPF for clarification

## Regression Test Cases

### Test Case 1: Basic Query
**Input**: "I'm 45 years old. What retirement sum do I need?"
**Expected**: Provide FRS explanation, applicable milestones, CPF Planner link

### Test Case 2: CPF LIFE Plan Selection
**Input**: "Which CPF LIFE plan should I choose?"
**Expected**: Explain all three plans, ask clarifying questions, provide CPF LIFE Estimator link

### Test Case 3: Missing Age
**Input**: "How much CPF will I have at retirement?"
**Expected**: Return "Input Required" asking for age

### Test Case 4: Top-Up Optimization
**Input**: "I'm 55, how can I maximize my CPF?"
**Expected**: Explain extra interest, MRSS, RSTU with current parameters

### Test Case 5: Housing Query
**Input**: "Should I use my CPF OA to pay for my HDB?"
**Expected**: Explain trade-offs, accrued interest, property pledge requirements
