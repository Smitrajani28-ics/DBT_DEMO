WITH CTE AS(
    SELECT
    *
    FROM {{ ref('trip_fact') }}
)

SELECT *
FROM CTE