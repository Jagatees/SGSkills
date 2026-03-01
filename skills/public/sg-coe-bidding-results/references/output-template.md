# Output Template: SG COE Bidding Results

Use this structure unless user requests a different layout.

```md
As of: <YYYY-MM-DD HH:mm SGT>
Scope: <latest exercise | specific exercise/date> (<A-E | subset>)

Exercise Summary:
- Exercise: <identifier or period>
- Publication status: <Published | Pending publication | Verification pending>
- Update time: <absolute timestamp>
- Confidence: <High|Medium|Low>
- Sources: <https://...>

Category Results (A-E):
| Category | Quota Premium (S$) | Quota | Bids Received | Success Rate | Change vs Previous |
|---|---:|---:|---:|---:|---:|
| A | <value or N/A> | <...> | <...> | <...> | <+/-value or N/A> |
| B | <value or N/A> | <...> | <...> | <...> | <+/-value or N/A> |
| C | <value or N/A> | <...> | <...> | <...> | <+/-value or N/A> |
| D | <value or N/A> | <...> | <...> | <...> | <+/-value or N/A> |
| E | <value or N/A> | <...> | <...> | <...> | <+/-value or N/A> |

Facts vs inference:
- Facts: <published category-level values and timestamps>
- Inference: <publication-status interpretation and caveats>

Caveats:
- <missing fields, delayed publication, or verification-pending notes>
```
