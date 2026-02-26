# Output Template: SG Weather Now

Use this structure unless user requests a different layout.

```md
As of: <YYYY-MM-DD HH:mm SGT>
Scope: <Singapore-wide or specific area>

Current Snapshot:
- Conditions: <brief>
- Confidence: <High|Medium|Low>
- Sources: <https://...>
- Timestamp: <absolute timestamp>

Nowcast (Next 2 Hours):
- <rain/thunderstorm/temperature/wind summary>
- Confidence: <High|Medium|Low>
- Sources: <https://...>
- Timestamp: <absolute timestamp>

24-Hour Outlook:
- <summary>
- Confidence: <High|Medium|Low>
- Sources: <https://...>
- Timestamp: <absolute timestamp>

Active Advisories/Warnings:
- <none or list>
- What to do: <simple practical action, aligned to official advisory wording>
- Confidence: <High|Medium|Low>
- Sources: <https://...>
- Timestamp: <absolute timestamp>

Facts vs inference:
- Facts: <issued weather data>
- Inference (optional): <clearly labeled planning interpretation>

Caveat:
- <rapidly changing conditions or verification pending notes>
```
