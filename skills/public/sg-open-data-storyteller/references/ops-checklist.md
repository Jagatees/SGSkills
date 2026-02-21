# Ops Checklist (Production)

Use this checklist to keep the skill stable under API limits.

## 1) Cache strategy

- Cache key: `dataset_id + query_signature + mode`.
- Respect TTL guidance from `SKILL.md`.
- On cache hit, skip outbound API call.
- Invalidate cache on major schema/field changes.

## 2) Runtime telemetry (track per run)

- `api_calls_total`
- `api_calls_sql`
- `api_calls_row`
- `rate_limit_errors_total`
- `retries_total`
- `cache_hit_ratio`
- `used_partial_data` (`true|false`)
- `run_mode` (`fast|deep`)

## 3) Safety thresholds

- Alert if `rate_limit_errors_total >= 2` in a run.
- Alert if `api_calls_total > target_budget`.
- Alert if `used_partial_data=true` for 3+ consecutive runs on same dataset.

## 4) User-facing behavior

- If cap is reached, stop and publish with explicit caveat:
  - what was fetched
  - what was not fetched
  - how confidence changed
- Never hide missing coverage due to rate limits.

## 5) API key and quota policy

- Prefer authenticated calls where available.
- Do not log raw secrets in output.
- If key is absent, run in conservative mode (`fast`) by default.
- If key is present and stable, `deep` mode is allowed when user asks.
