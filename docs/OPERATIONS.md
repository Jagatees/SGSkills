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

## Quick Copy: Local Install

Run from repo root:

```bash
chmod +x ports/install.sh
```

Install all skills for Codex:

```bash
./ports/install.sh codex
```

Install all skills for Claude:

```bash
./ports/install.sh claude ~/my-project all
```

Install all skills for Gemini:

```bash
./ports/install.sh gemini ~/my-project all
```

Copy all universal prompt files:

```bash
./ports/install.sh universal ~/Desktop all
```

If you do not have a custom install folder, use your current folder:

```bash
./ports/install.sh claude . all
./ports/install.sh gemini . all
./ports/install.sh universal . all
```

## Browser LLM (No Local CLI)

If you only use browser-based AI tools (for example ChatGPT web, Claude web, Gemini web):

1. Generate or copy universal prompt files:
```bash
./ports/install.sh universal . all
```
2. Open one file in `/Users/jagatees/Desktop/Files/Github_Hubs/SGSkills/ports/universal/` (or the folder you copied to).
3. Copy the prompt text into your browser LLM chat.
4. Add your task scope at the top (time window, location, stage, etc.), then run it.
