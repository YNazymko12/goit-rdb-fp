DROP FUNCTION IF EXISTS fn_subtract_now_year;

DELIMITER //

CREATE FUNCTION fn_subtract_now_year(year INT)
RETURNS int
DETERMINISTIC
NO SQL
BEGIN
	DECLARE result INT;
    SET result = YEAR(CURDATE()) - year;
    RETURN result;
END //

DELIMITER ;

SELECT fn_subtract_now_year(1994)    
    