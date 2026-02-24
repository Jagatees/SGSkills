# API Setup

## Required credential

- LTA DataMall `AccountKey` for bus arrival API access.

## Quick setup (60 seconds)

1. Request key: `https://datamall.lta.gov.sg/content/datamall/en/request-for-api.html`
2. Set for current terminal:

```bash
export LTA_ACCOUNT_KEY="<your-key>"
```

3. Persist for future terminals (zsh):

```bash
echo 'export LTA_ACCOUNT_KEY="<your-key>"' >> ~/.zshrc
source ~/.zshrc
```

4. Verify:

```bash
python3 skills/public/sg-transit-live-eta-tracker/scripts/fetch_bus_arrival.py --bus-stop 83139
```

If verification fails, check key value/quoting and reopen terminal.
If you are already in the skill folder, `python3 scripts/fetch_bus_arrival.py --bus-stop 83139` also works.

## Bus arrival endpoint

- Endpoint: `https://datamall2.mytransport.sg/ltaodataservice/v3/BusArrival`
- Required query parameter: `BusStopCode`
- Optional query parameter: `ServiceNo`

Example with curl:

```bash
curl -sS \
  -H "AccountKey: ${LTA_ACCOUNT_KEY}" \
  "https://datamall2.mytransport.sg/ltaodataservice/v3/BusArrival?BusStopCode=83139&ServiceNo=14"
```

## Rail/service alert sources

Use official and timestamped channels only:
- LTA advisories/news
- SMRT service status channels
- SBS Transit service update channels

If an alert has no clear timestamp or URL, exclude it.

## Runtime notes

- Treat API/network failures as partial coverage, not "no incident."
- Treat HTTP `401/403` responses as invalid key configuration.
- Keep source payload snippets brief; summarize, do not paste raw large JSON.
