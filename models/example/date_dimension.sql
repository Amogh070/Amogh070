WITH cte AS (

    SELECT
        start_date,

        DAYNAME(start_date) AS day_name,

        CASE
            WHEN DAYNAME(start_date) IN ('Sat', 'Sun')
            THEN 'WEEKEND'
            ELSE 'BUSINESSDAY'
        END AS day_type,

        CASE
            WHEN MONTH(start_date) IN (12,1,2) THEN 'WINTER'
            WHEN MONTH(start_date) IN (3,4,5) THEN 'SUMMER'
            WHEN MONTH(start_date) IN (6,7,8) THEN 'MONSOON'
            WHEN MONTH(start_date) IN (9,10,11) THEN 'FALL'
        END AS season_of_year,

        {{ date_status('start_date') }}

    FROM {{ source('Demo', 'travel_clean') }}

)

SELECT *
FROM cte