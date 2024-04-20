USE pandemic;

SELECT country_id,
AVG(Number_rabies) AS average_value,
MAX(Number_rabies) AS max_value, 
MIN(Number_rabies) AS min_value,
SUM(Number_rabies) AS sum_value
FROM cases_normalized
WHERE Number_rabies IS NOT NULL AND number_rabies <> ''
GROUP BY country_id
ORDER BY average_value DESC
LIMIT 10;