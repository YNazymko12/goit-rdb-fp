USE pandemic;

-- 1 --
SELECT Entity, Code, Year, 
CONCAT(Year, "-01-01") AS year_start_date
FROM infectious_cases;

-- 2 --
SELECT Entity, Code, Year, 
CURDATE() AS year_current_date
FROM infectious_cases;

-- 3 --
SELECT Entity, Code, Year,
TIMESTAMPDIFF(YEAR, CONCAT(Year, '-01-01'), CURDATE()) AS difference_year
FROM infectious_cases;