# Intake

## Core

This skill provides CPF retirement planning guidance for Singapore users. It helps navigate CPF schemes, optimize retirement savings, and plan for retirement adequacy using official Singapore government sources.

**Primary Use Cases:**
- Understanding CPF account structures and interest rates
- Planning for retirement sum requirements
- Selecting appropriate CPF LIFE plans
- Optimizing top-up strategies (MRSS, RSTU)
- Analyzing housing-CPF trade-offs

## Inputs and Outputs

### Required Inputs
| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| Age | User's current age | **Yes** (critical for milestones) | None - must ask |
| Employment Status | Employee, self-employed, platform worker | No | Employee (with caveat) |
| Retirement Goals | Desired monthly payout, retirement age | No | FRS at age 65 |
| Housing Situation | HDB/private property, outstanding loans | No | Not applicable |
| CPF Balances | Current OA, SA, MA balances | No | Use CPF Planner for personalized |

### Outputs
| Output | Description |
|--------|-------------|
| CPF Parameters Summary | Current interest rates, retirement sums, extra interest tiers |
| Applicable Milestones | Key ages and actions based on user's age |
| Prioritized Recommendations | Immediate, short-term, long-term actions |
| Official Tools | Links to CPF Planner and calculators |
| Confidence Labels | High/Medium/Low for all claims |
| Caveats | Limitations, assumptions, and policy change notes |

## Sources and Quality

### Source Trust Tiers
| Tier | Domain | Usage |
|------|--------|-------|
| Tier 1 (Primary) | .gov.sg domains (including cpf.gov.sg, mom.gov.sg, moneysense.gov.sg, hdb.gov.sg, sgpc.gov.sg, mas.gov.sg) | Authoritative; cite directly |
| Tier 2 (Secondary) | Official public-sector publications not on .gov.sg (if any) | Supporting; cite with context |
| Tier 3 (Context) | Non-authoritative contextual materials (research, commentary) | Background context only; do not use for official policy values |
| Not Trusted | Non-.gov.sg domains | Do not cite as authoritative |

### Quality Gates
- [ ] All numeric claims cite official sources
- [ ] Interest rates specify floor rate or pegged rate
- [ ] Retirement sums specify applicable year
- [ ] Payout estimates note "projections, not guarantees"
- [ ] Absolute dates used (e.g., "from 1 January [YYYY]")
- [ ] Confidence labels applied to all claims

### Freshness Requirements
| Data Type | Update Frequency | Check Before Use |
|-----------|------------------|------------------|
| Interest rates | Quarterly (Jan, Apr, Jul, Oct) | Verify current quarter |
| Retirement sums | Annually (Budget announcement) | Verify current year |
| CPF LIFE parameters | Annually | Verify current year |
| Contribution rates | Periodically | Check for recent changes |
| MRSS/RSTU parameters | Annually | Verify current year |

## Safety and Governance

### Risk Classification
**Risk Tier: MEDIUM**
- Users may make significant financial decisions based on outputs
- Involves retirement planning with long-term implications
- Requires accurate, up-to-date government policy information

### Safety Rules
1. **No personalized financial advice** - Direct users to licensed financial advisors
2. **No deterministic claims** - All projections noted as estimates
3. **No credential requests** - Never ask for Singpass/MyInfo credentials
4. **Data minimization** - Do not request NRIC, full address, or sensitive identifiers

### Escalation Triggers
- User requests definitive legal interpretation
- User asks for guaranteed investment outcomes
- User shares sensitive personal data requiring protection
- Ambiguous policy interpretation needed
- Edge cases not covered by official guidance

### Governance Metadata
Governance metadata (including `jurisdiction`, `review_due`, risk tier, and data classification) is defined in the `SKILL.md` frontmatter and must be treated as the single source of truth.
