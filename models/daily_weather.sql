WITH daily_weather AS(
    SELECT 
    DATE(time) AS daily_weather,
    weather,
    temp,
    pressure,
    humidity,
    clouds
    FROM {{ source('demo', 'weather') }}
),
daily_weather_agg AS(
    SELECT
    daily_weather,
    weather,
    ROUND(AVG(temp),2) AS avg_temp,
    ROUND(AVG(pressure),2) AS avg_pressure,
    ROUND(AVG(humidity),2) AS avg_humidity,
    ROUND(AVG(clouds),2) AS avg_clouds
    -- count(weather),
    -- ROW_NUMBER() OVER(PARTITION BY daily_weather ORDER BY COUNT(WEATHER) DESC) AS ROW_NUMBER
    FROM daily_weather
    GROUP BY daily_weather, weather
    QUALIFY ROW_NUMBER() OVER(PARTITION BY daily_weather ORDER BY COUNT(WEATHER) DESC) = 1
)

SELECT * FROM daily_weather_agg