{% macro date_status(date_col) %}

CASE
    WHEN TO_DATE({{ date_col }}) < CURRENT_DATE
    THEN 'Past'
    ELSE 'Future'
END AS date_status

{% endmacro %}