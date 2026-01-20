WITH TRIPS AS(
    SELECT *
    FROM {{ source('demo', 'bike') }}
)

SELECT *
FROM TRIPS