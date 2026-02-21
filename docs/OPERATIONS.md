# Operations

Operational standards for running skills safely in production-like usage.

## API/Rate-Limit Standard

- Prefer low-call strategies (aggregate APIs first).
- Set per-run call target + hard cap.
- Retry with bounded backoff only.
- Stop with explicit caveat when limits are exceeded.

## Caching Standard

- Cache key should include `skill + dataset/query + mode`.
- Define TTL by data volatility.
- Never hide that cached data was used in internal logs/notes.

## Telemetry Standard

Track per run (where applicable):

- `api_calls_total`
- `rate_limit_errors_total`
- `retries_total`
- `cache_hit_ratio`
- `used_partial_data`
- `run_mode`

## Incident Rule of Thumb

- Repeated rate-limit failures: reduce depth to fast mode by default.
- High partial-data frequency: review query plan and call budget.

## Data Integrity

- Exclude invalid/suppressed values from numeric calculations.
- State aggregation method for numeric summaries.
- Prefer omission over speculation.
