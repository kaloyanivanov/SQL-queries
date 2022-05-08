USE university_halls;
SELECT teachers.name,
COUNT(*) AS numberOfLectures
FROM occupancy JOIN teachers
ON occupancy.teacher_id = teachers.id
WHERE teachers.name = 'Petar Petrov Petrov'