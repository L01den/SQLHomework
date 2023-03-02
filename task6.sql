CREATE DATABASE IF NOT EXISTS task6;
USE task6;

delimiter $$
CREATE FUNCTION convert_func(sec INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE temp INT DEFAULT 0;
	DECLARE min INT DEFAULT 0;
	DECLARE hour INT DEFAULT 0;
	DECLARE day INT DEFAULT 0;
	DECLARE result VARCHAR(100);
    
    IF (sec > 60) THEN
		SET temp = sec/60;
		SET sec = sec%60;
	END IF;
    IF (temp > 60) THEN
		SET min = temp%60;
		SET temp = temp/60; 
	END IF;
    IF (temp > 24) THEN
		SET hour = temp%24;
		SET day = temp/24; 
	END IF;
    -- SET result = CONCAT("Day ", day);
    SET result = CONCAT("Day ", day, ", hours  ", hour, ", minutes ", min, ", second ", sec);
    RETURN result;
    END $$ 
delimiter ;

SELECT convert_func(123456);

delimiter $$
CREATE FUNCTION evan()
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
	DECLARE item INT DEFAULT 0;
    DECLARE result VARCHAR(20) DEFAULT "";
    
    WHILE item < 10 DO
		SET item = item +2;
		SET result = CONCAT(result, " ", item);
	END WHILE;
	RETURN result;
END $$

SELECT evan();