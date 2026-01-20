WITH TRIPS AS(
    SELECT 
    ride_id,
    DATE(TO_TIMESTAMP(started_at)) AS trip_date,
    start_station_id,
    end_station_id,
    member_casual,
    TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(started_at), TO_TIMESTAMP(ended_at)) AS trip_duration_seconds
    FROM {{ ref('stg_bike') }}
)

SELECT *
FROM TRIPS