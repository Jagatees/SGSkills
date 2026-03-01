# Output Template: SG Car Park Availability

Use this structure unless user requests a different layout.

```md
As of: <YYYY-MM-DD HH:mm SGT>
Scope: <latest/specified time> (<area/location>, lot type <C|Y|all>)

Snapshot Summary:
- Data timestamp: <absolute timestamp from source>
- Freshness status: <Fresh | Delayed | Verification pending>
- Confidence: <High|Medium|Low>
- Sources: <https://...>

Area Results:
| Carpark | Type | Available Lots | Total Lots | Occupancy Estimate | Update Time |
|---|---|---:|---:|---:|---|
| <id/name> | <C/Y/...> | <value> | <value> | <value or N/A> | <timestamp> |

Facts vs inference:
- Facts: <published lot counts, timestamps, IDs>
- Inference: <freshness interpretation and caveats>

Caveats:
- <stale data, missing fields, geolocation mismatch, or verification-pending notes>
```
