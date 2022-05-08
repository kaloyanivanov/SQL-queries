DROP FUNCTION IF EXISTS isOccupied;

DELIMITER $$

CREATE FUNCTION isOccupied(
	hall_id INT,
    lecture_date DATE,
	hourOfLecture ENUM('9:30','11:30', '13:45', '15:45', '17:45')
) 
RETURNS BOOLEAN

DETERMINISTIC

BEGIN
    DECLARE isOccupied BOOLEAN;
    IF((SELECT COUNT(*) FROM occupancy
	WHERE occupancy.hall_id=hall_id AND occupancy.dateOfLecture=lecture_date AND occupancy.hourOfLecture=hourOfLecture) = 0)
    THEN SET isOccupied = false;
    ELSE SET isOccupied = true;
    END IF;
	RETURN (isOccupied);
END$$
DELIMITER ;