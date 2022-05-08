USE university_halls;
SELECT occupancy.dateOfLecture,
occupancy.dayOfWeek,
occupancy.hourOfLecture,
teachers.name,
halls.hall_number
FROM occupancy JOIN teachers
ON occupancy.teacher_id = teachers.id
RIGHT JOIN halls ON occupancy.hall_id=halls.id