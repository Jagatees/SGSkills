# API Query Recipes (Rate-Limit Safe)

Use these patterns with `datastore_search_sql` first. URL-encode the SQL for the API call.

## 1) Yearly trend (latest value + YoY)

```sql
SELECT
  year,
  avg(cast(gross_monthly_median as numeric)) AS avg_gross_median,
  avg(cast(employment_rate_ft_perm as numeric)) AS avg_ft_perm,
  count(*) AS n
FROM "<dataset_id>"
WHERE gross_monthly_median <> 'na'
  AND employment_rate_ft_perm <> 'na'
GROUP BY year
ORDER BY year
```

## 2) Latest-year breakdown by group (for variance/risk)

```sql
SELECT
  university,
  avg(cast(gross_monthly_median as numeric)) AS avg_gross_median,
  avg(cast(employment_rate_ft_perm as numeric)) AS avg_ft_perm,
  count(*) AS n
FROM "<dataset_id>"
WHERE year = <latest_year>
  AND gross_monthly_median <> 'na'
  AND employment_rate_ft_perm <> 'na'
GROUP BY university
ORDER BY avg_gross_median DESC
```

## 3) Data quality check (missing/suppressed share)

```sql
SELECT
  year,
  count(*) AS total_rows,
  sum(CASE WHEN gross_monthly_median = 'na' OR employment_rate_ft_perm = 'na' THEN 1 ELSE 0 END) AS excluded_rows
FROM "<dataset_id>"
GROUP BY year
ORDER BY year
```

## 4) Distribution spread trend (p25 vs p75)

```sql
SELECT
  year,
  avg(cast(gross_mthly_25_percentile as numeric)) AS avg_p25,
  avg(cast(gross_mthly_75_percentile as numeric)) AS avg_p75,
  avg(cast(gross_mthly_75_percentile as numeric) - cast(gross_mthly_25_percentile as numeric)) AS avg_gap,
  count(*) AS n
FROM "<dataset_id>"
WHERE gross_mthly_25_percentile <> 'na'
  AND gross_mthly_75_percentile <> 'na'
GROUP BY year
ORDER BY year
```

## Request strategy

- Standard brief target: 3-5 SQL calls total.
- Add row-level calls only if a claim cannot be made from aggregates.
- If rate-limited after bounded retries, stop and publish with explicit limits.
