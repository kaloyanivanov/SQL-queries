DROP FUNCTION IF EXISTS isHallOccupied;
DELIMITER $$

CREATE FUNCTION isHallOccupied(
	hall_number VARCHAR(5),
    lecture_date DATE
) 
RETURNS TEXT

DETERMINISTIC

BEGIN
    DECLARE message TEXT;
    DECLARE hall_id INT;
    DECLARE iterator int;
    DECLARE flag BOOLEAN;
    
	SET message=CONCAT('Hall ', hall_number,' is free at');
    SET flag=false;
    
    SELECT id INTO hall_id FROM halls
    WHERE halls.hall_number = hall_number;
    
    
     IF(NOT isOccupied(hall_id,lecture_date,'9:30'))
     THEN SET message=CONCAT(message,' 9:30');
     SET flag=true;
     END IF;
     
     IF(NOT isOccupied(hall_id,lecture_date,'11:30'))
     THEN SET message=CONCAT(message,' 11:30');
     SET flag=true;
     END IF;
     
     IF(NOT isOccupied(hall_id,lecture_date,'13:45'))
     THEN SET message=CONCAT(message,' 13:45');
     SET flag=true;
     END IF;
     
     IF(NOT isOccupied(hall_id,lecture_date,'15:45'))
     THEN SET message=CONCAT(message,' 15:45');
     SET flag=true;
     END IF;
     
     IF(NOT isOccupied(hall_id,lecture_date,'17:45'))
     THEN SET message=CONCAT(message,' 17:45');
     SET flag=true;
     END IF;
	 
     IF(NOT flag)
     THEN SET message='The hall is occupied this day';
	 END IF;
     SET message=CONCAT(message,'.');

    
	RETURN (message);
END$$
DELIMITER ;