WITH CTE AS(
    SELECT
    to_timestamp(started_at) as started_at,
    date(to_timestamp(started_at)) as date_started_at,
    hour(to_timestamp(started_at)) as hour_started_at,
    {{day_type('started_at')}} AS DAY_TYPE,
    {{get_season('started_at')}} AS STATION_OF_YEAR
    FROM {{ ref('stg_bike') }}
    -- WHERE date_started_at < '2023-07-01'
)
select * from CTE