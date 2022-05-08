DROP DATABASE IF EXISTS university_halls;
CREATE DATABASE university_halls;
USE university_halls;

CREATE TABLE university_halls.halls(
	id INT AUTO_INCREMENT PRIMARY KEY ,
	hall_number VARCHAR(5) NOT NULL UNIQUE ,
    capacity INT UNSIGNED NOT NULL  ,
    computers INT UNSIGNED NOT NULL ,
    projector BOOLEAN NOT NULL DEFAULT 0 ,
    internet BOOLEAN NOT NULL DEFAULT 0 ,
    board BOOLEAN NOT NULL DEFAULT 0
);

CREATE TABLE university_halls.teachers(
	id INT AUTO_INCREMENT PRIMARY KEY ,
	name VARCHAR(255) NOT NULL ,
    degree VARCHAR(255) NOT NULL ,
    faculty VARCHAR(255) NOT NULL ,
    department VARCHAR(255) NOT NULL ,
    phone VARCHAR(20) NULL DEFAULT NULL ,
    email VARCHAR(255) NULL DEFAULT NULL 
);

CREATE TABLE university_halls.occupancy(
	id INT AUTO_INCREMENT PRIMARY KEY ,
    dateOfLecture DATE NOT NULL ,
    dayOfWeek ENUM('Monday','Tuesday','Wednesday','Thursday','Friday') ,
    hourOfLecture ENUM('9:30','11:30', '13:45', '15:45', '17:45') ,
    teacher_id INT NOT NULL ,
    hall_id INT NOT NULL ,
    CONSTRAINT FOREIGN KEY (teacher_id) 
		REFERENCES teachers(id) ,
	CONSTRAINT FOREIGN KEY (hall_id) 
		REFERENCES halls(id) 
);

INSERT INTO halls
VALUES 	(NULL, '1001', 30, 15, 0, 1, 0 ) ,
		(NULL, '1002', 120, 1, 1, 1, 1 ) ,
        (NULL, '1003', 150, 2, 1, 1, 1 ) ,
        (NULL, '1004', 200, 0, 1, 0, 1 );

INSERT INTO teachers
VALUES	(NULL, 'Petar Petrov Petrov', 'Professor', 'MTF', 'Materialoznanie', '0888127476', 'ppetrov@university.com') ,
		(NULL, 'Ivan Ivanov Ivanov', 'Doctor', 'FT', 'Comunicacionni mrezhi', '0865235631', 'iivanov@university.com') ,
		(NULL, 'Nikolai Nikolov Nikolov', 'Doctor', 'FA', 'Avtomatizaciq', '0877853764', 'nnikolov@university.com');

INSERT INTO occupancy
VALUES 	(NULL, '2021-05-10', DAYNAME('2021-05-10'), '9:30', 1, 2) ,
		(NULL, '2021-05-11', DAYNAME('2021-05-11'), '15:45', 2, 3) ,
        (NULL, '2021-05-12', DAYNAME('2021-05-12'), '17:45', 1, 3) ,
        (NULL, '2021-05-13', DAYNAME('2021-05-13'), '15:45', 2, 1) ,
        (NULL, '2021-05-14', DAYNAME('2021-05-14'), '11:30', 3, 1);