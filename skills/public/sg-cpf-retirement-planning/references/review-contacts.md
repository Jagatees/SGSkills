# Review Contacts

## Escalation Required

When queries require human review or fall outside this skill's scope, follow the internal routing below. This file is for **internal reviewer roles and approval routing**, not end-user contact directories.

---

## Internal human-review roles and routing

| Scenario / trigger                                                                 | Primary reviewer role         | Backup / escalation role              | Approval / notes                                                                 |
|------------------------------------------------------------------------------------|--------------------------------|----------------------------------------|----------------------------------------------------------------------------------|
| Complex CPF retirement/LIFE questions that cannot be answered from official docs   | CPF domain expert (skill owner) | Secondary CPF domain expert            | Domain expert confirms response accuracy or advises to direct user to CPF Board. |
| Policy / safety concerns (e.g., borderline advice, sensitive personal situations)  | Policy & safety reviewer       | On-call safety approver               | Safety reviewer confirms compliance with content and safety guidelines.          |
| Requests that look like personalised financial advice or tax planning              | Policy & safety reviewer       | CPF domain expert                      | Confirm we stay within educational scope; direct user to licensed professionals. |
| Escalations where user insists on speaking to an official CPF representative       | CPF domain expert (skill owner) | Product owner / PM for this skill     | Reviewer confirms escalation and instructs agents to refer user to CPF contact.  |
| Technical issues with the skill (wrong data, broken flows)                         | Skill engineer / maintainer    | Product owner / PM for this skill     | Engineer investigates; PM decides if skill should be temporarily disabled.       |

**Notes**
- Reviewer roles here are *internal* roles; map them to the appropriate people/teams in your deployment.
- Update this table when ownership or escalation paths change.
- Do **not** add end-user phone numbers, email addresses, or office hours to this file.

---

## Directing users to official contacts

When a conversation requires support from an official agency (e.g., CPF Board, MAS, HDB), reviewers should **refer users to the official contact pages**, not quote specific phone numbers or office hours from this file.

In general:
- For CPF account or retirement matters, direct users to the official CPF contact page:  
  https://www.cpf.gov.sg/member/contact-us
- For financial advisory licensing or adviser checks, direct users to MAS resources:  
  - Financial advisers directory: https://www.mas.gov.sg/instruments/directory/financial-advisors-directory  
  - Investor Alert List: https://www.mas.gov.sg/investor-alert-list
- For housing-related matters (e.g., HDB purchases, housing grants), direct users to HDB's official site:  
  https://www.hdb.gov.sg
- For tax matters, refer users to IRAS' official site:  
  https://www.iras.gov.sg
- For legal/estate-planning issues, refer users to the Law Society of Singapore or qualified legal professionals via their official sites.

The exact wording used to direct users should:
- Stay within this skill's permitted scope (no personalised financial or legal advice).
- Encourage users to rely on the latest information from the agencies' official websites.

---
| CPF housing grants | HDB | https://www.hdb.gov.sg |
| Property pledge matters | CPF Board | 1800-227-1188 |
| Resale flat CPF refund | CPF Board | 1800-227-1188 |

### Employment-Related CPF Queries

| Query Type | Escalate To | Contact |
|------------|-------------|---------|
| CPF contribution disputes | MOM | 6438 5122 |
| Self-employed CPF | CPF Board | 1800-227-1188 |
| Platform worker CPF | CPF Board / MOM | 1800-227-1188 |
| Foreign worker CPF | MOM | 6438 5122 |

### Healthcare-Related CPF Queries

| Query Type | Escalate To | Contact |
|------------|-------------|---------|
| MediSave usage | CPF Board | 1800-227-1188 |
| MediShield Life | CPF Board | 1800-222-3399 |
| Basic Healthcare Sum | CPF Board | 1800-227-1188 |

---

## Vulnerable User Support

### Seniors Requiring Assistance
| Service | Provider | Contact |
|---------|----------|---------|
| Financial counselling | Credit Counselling Singapore | 1800-225-5227 |
| Seniors helpline | Agency for Integrated Care | 1800-650-6060 |
| Silver Generation Office | Silver Generation Office | 1800-555-5555 |

### Persons with Disabilities
| Service | Provider | Contact |
|---------|----------|---------|
| SG Enable | SG Enable | 1800-858-5885 |
| Caregiver support | AWWA | 6511 5200 |
| Disability services | MINDS | 6479 5655 |

---

## Regulatory & Legal

### Financial Disputes
| Query Type | Escalate To | Contact |
|------------|-------------|---------|
| Financial institution disputes | FIDReC | 6327 8878 |
| Investment complaints | MAS | 6225 5577 |
| Insurance disputes | FIDReC | 6327 8878 |

### Legal Matters
| Query Type | Escalate To | Contact |
|------------|-------------|---------|
| CPF nomination disputes | Lawyer / CPF Board | - |
| Estate matters | Lawyer | Law Society: 6532 7111 |
| Legal aid | Legal Aid Bureau | 1800-225-5529 |

---

## Government Feedback & Appeals

| Query Type | Channel | Contact |
|------------|---------|---------|
| CPF policy feedback | REACH | https://www.reach.gov.sg |
| Government services feedback | Feedback Unit | 1800-353-5555 |
| CPF decisions appeal | CPF Board (Appeals) | Written appeal required |

---

## When to Escalate

### Always Escalate When:
1. User requests definitive legal interpretation
2. User asks for guaranteed investment outcomes
3. User reports potential CPF fraud or scam
4. User discloses financial hardship requiring intervention
5. Query involves dispute with employer over CPF contributions
6. User requires case-specific CPF Board decision

### Response for Escalation:
```markdown
Your query requires assistance beyond what this skill can provide.

**Recommended Contact**: [Appropriate contact from tables above]
**Reason**: [Specific reason]

Please contact them directly for personalized assistance. If you need general CPF information, I can still help with that.
```
