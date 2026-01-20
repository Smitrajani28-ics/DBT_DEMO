WITH CTE AS(
    SELECT
    to_timestamp(started_at) as started_at,
    date(to_timestamp(started_at)) as date_started_at,
    hour(to_timestamp(started_at)) as hour_started_at,
    CASE
    WHEN dayname(to_timestamp(started_at)) IN ('Sat','Sun')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAYS' 
    END AS DAY_TYPE,
    MONTH(to_timestamp(started_at)),
    CASE
    WHEN MONTH(to_timestamp(started_at)) IN (12,1,2) THEN 'WINTER'
    WHEN MONTH(to_timestamp(started_at)) IN (3,4,5) THEN 'SPRING'
    WHEN MONTH(to_timestamp(started_at)) IN (6,7,8) THEN 'SUMMER'
    ELSE 'AUTUMN' 
    END AS STATION_OF_YEAR
    FROM {{ source('demo', 'bike') }}
    -- WHERE date_started_at < '2023-07-01'
)
select * from CTE