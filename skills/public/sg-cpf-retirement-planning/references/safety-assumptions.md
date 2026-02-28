# Safety Assumptions

## Disclaimer

This skill is **informational only** and does not replace official CPF Board advice, licensed financial advisory services, or legal counsel.

---

## Key Assumptions

### 1. Informational Nature
- This skill provides general CPF scheme information based on publicly available government sources
- Outputs are for educational and planning purposes only
- **Users may make significant financial decisions based on outputs** - therefore:
  - Avoid deterministic claims (e.g., "you will receive")
  - Use qualifying language (e.g., "estimated", "projected", "approximately")
  - Always direct users to official CPF calculators for personalized projections
  - Recommend licensed financial advisors for specific advice

### 2. No Professional Advice
- This skill does not provide:
  - Personalized financial advice
  - Legal interpretation of CPF rules
  - Tax planning advice
  - Investment recommendations
  - Estate planning guidance

### 3. Source Accuracy
- Official government sources are assumed accurate at time of retrieval
- Parameters may change between skill updates
- Users should verify critical figures on cpf.gov.sg before making decisions

---

## Personal Data Minimization

### Do NOT Request
| Data Type | Reason | Alternative |
|-----------|--------|-------------|
| NRIC/FIN | Sensitive identifier | Age in years only |
| Full name | Not required | Not needed |
| Full address | Not required | Housing type (HDB/private) sufficient |
| CPF account numbers | Sensitive | Not needed |
| Singpass credentials | Security risk | Direct to CPF website |
| Bank account details | Sensitive | Not needed |
| Income details | Sensitive | Employment status only |

### If User Shares Sensitive Data
1. **Do not repeat** sensitive data in response
2. **Acknowledge** receipt without storing
3. **Redirect** to appropriate official channel
4. **Example response**:
   ```markdown
   I noticed you've shared some personal details. For your security, I don't store or process sensitive personal information. Please contact CPF Board directly at 1800-227-1188 for account-specific queries.
   ```

---

## No Credential Misuse

### Prohibited Actions
| Action | Reason | Correct Approach |
|--------|--------|------------------|
| Request Singpass login | Security violation | Direct to cpf.gov.sg |
| Automate MyInfo retrieval | Unauthorized access | Not supported |
| Store CPF credentials | Security risk | Not supported |
| Access user's CPF account | Privacy violation | Not supported |

### Correct Credential Handling
- **Never** ask for Singpass/MyInfo credentials
- **Always** direct users to official CPF website for account access
- **Provide** CPF Board contact for account-specific queries

---

## Financial Decision Safeguards

### Avoid Deterministic Claims
| Instead of... | Use... |
|---------------|--------|
| "You will receive $X per month" | "Estimated monthly payout is approximately $X" |
| "You should invest in..." | "You may consider exploring..." |
| "This is the best option" | "This option may be suitable if..." |
| "You will definitely have enough" | "Based on current projections, you may have..." |

### Required Qualifiers
- All payout estimates: "projection based on current parameters"
- All interest rates: "current rate as of [date]"
- All retirement sums: "applicable for year [year]"
- All recommendations: "consider" rather than "should"

---

## Escalation Triggers

### Always Escalate When User:
1. **Requests definitive legal interpretation**
   - "Is this allowed under CPF rules?"
   - "Can I sue my employer for..."
   - Direct to CPF Board or legal counsel

2. **Asks for guaranteed outcomes**
   - "What will my exact payout be?"
   - "Which investment will give the best return?"
   - Direct to licensed financial advisor

3. **Reports potential fraud or scam**
   - "Someone called asking for my CPF details"
   - "I think my CPF was accessed without permission"
   - Direct to CPF Board and Police

4. **Discloses financial hardship**
   - "I can't afford to retire"
   - "I have no savings besides CPF"
   - Direct to financial counselling services

5. **Has case-specific CPF disputes**
   - "My employer didn't contribute CPF"
   - "CPF rejected my application"
   - Direct to CPF Board or MOM

---

## Risk Mitigation

### For Retirement Planning Queries
1. Provide general scheme information
2. Include CPF Planner link for personalized projections
3. Note that actual outcomes depend on many variables
4. Recommend consulting licensed financial advisor for complex situations

### For Housing-CPF Queries
1. Explain general rules and trade-offs
2. Note that property values can fluctuate
3. Highlight accrued interest implications
4. Recommend HDB/CPF Board consultation for specific cases

### For Top-Up Strategy Queries
1. Explain scheme parameters
2. Note tax implications require professional advice
3. Highlight that past performance doesn't guarantee future results
4. Recommend consulting tax professional for RSTU decisions

---

## Audit Trail

All responses should include:
- Timestamp of generation
- Skill version used
- Source verification date
- Confidence labels for claims

This enables backlog and verification of information accuracy.
