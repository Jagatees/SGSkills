# Output Template: Sgcarmart Assistant

Use this structure unless user requests a brief response.

```md
As of: <YYYY-MM-DD HH:mm SGT>
Mode: <shortlist under budget|beginner best-value recommendation|specific listing review>
Constraints recap:
- Budget: <SGD>
- Monthly cap: <SGD/month>
- Filters: <body/fuel/COE/mileage/owners>

Ranked results:

## <Rank>. <Car title> (Age: <x.x yrs>)
- Listing: <canonical URL>
- Facts:
  - Price: <SGD or Unknown>
  - Depreciation: <SGD/year or Unknown>
  - COE left/expiry: <value or Unknown>
  - Mileage: <value or Unknown>
  - Owners: <value or Unknown>
  - Seller: <name | location | rating/reviews | phone | sold activity>
- Estimated monthly:
  - Loan: <SGD/month or Unknown>
  - Road tax: <SGD/month or Unknown>
  - Insurance: <SGD/month or Unknown>
  - Petrol: <SGD/month or Unknown>
- Inference:
  - Value signals: <2-3 bullets>
  - Risk flags: <2-3 bullets>
  - Why this is worth it: <exactly 3 sentences for recommendation mode>
- Confidence: <High|Medium|Low>
- Source: <listing URL>

<Embed at least 3 listing images when available>

Negotiation checklist:
- <service records>
- <wear parts and accident history>
- <loan/downpayment clarity>
- <transfer timeline and warranty terms>

Caveats:
- <missing fields, stale listing data, or assumption notes>

Facts vs inference summary:
- Facts: <what was directly stated in listings>
- Inference: <comparative interpretation and assumptions>
```
