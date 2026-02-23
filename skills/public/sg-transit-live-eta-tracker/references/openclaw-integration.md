# OpenClaw Integration

Use this skill as a recurring monitoring module in OpenClaw.

## Recommended recurring jobs

1. Morning commute check (weekdays, 07:00 SGT)
2. Evening commute check (weekdays, 17:30 SGT)
3. Incident follow mode (hourly while disruption is active)

## Prompt pattern for OpenClaw

```text
Use $sg-transit-live-eta-tracker.
Scope:
- Time window: now + next 60 minutes
- Mode: bus and rail
- Stops/services: <comma-separated list>
- Stations/lines: <comma-separated list>
Return:
- Top updates
- Structured update list with timestamps, change type, confidence, source URL
- Suggested alternate route risk note
```

## Inputs to store in OpenClaw profile

- Home bus stop code(s)
- Work/school bus stop code(s)
- Preferred MRT lines/stations
- Critical arrival deadline (for example, "arrive by 08:45 SGT")

## Safety

- Never claim guaranteed travel time.
- Mark non-official claims as `Low` confidence and keep in Watchlist.
