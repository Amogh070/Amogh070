SELECT
DATE(time) AS daily_weather,
weather,
round(AVG(temp),2) AS avg_temp,
round(AVG(pressure),2) AS avg_pressure,
round(AVG(humidity),2) AS avg_humidity,
round(AVG(clouds),2) AS avg_clouds,
COUNT(*) AS weather_count
FROM {{ source('Demo', 'weather') }}
GROUP BY DATE(time), weather
QUALIFY ROW_NUMBER() OVER (PARTITION BY DATE(time)ORDER BY COUNT(*) DESC
) = 1