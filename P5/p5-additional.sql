DROP FUNCTION IF EXISTS fn_calc_illnesses;

DELIMITER //

CREATE FUNCTION fn_calc_illnesses(num_illnesses_per_year DOUBLE, period INT)
RETURNS DOUBLE
DETERMINISTIC 
NO SQL
BEGIN
    DECLARE result DOUBLE;
    SET result = num_illnesses_per_year / period;
    RETURN result;
END //

DELIMITER ;

SELECT fn_calc_illnesses(20000, 2);