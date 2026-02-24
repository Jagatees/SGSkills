# API Setup

## Official source

- data.gov.sg Environment API (PSI):
  - `https://api.data.gov.sg/v1/environment/psi`

## Usage

Latest reading:

```bash
python3 skills/public/sg-haze-level-tracker/scripts/fetch_psi.py
```

Specific timestamp (ISO8601):

```bash
python3 skills/public/sg-haze-level-tracker/scripts/fetch_psi.py --datetime 2026-02-24T06:00:00
```

## Notes

- No API key is required for this endpoint.
- Treat API/network failures as partial coverage, not "no haze".
- Use only official source values for confidence `High`.
