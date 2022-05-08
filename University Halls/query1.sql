USE university_halls;
SELECT degree,COUNT(*) as number_scientists FROM teachers
GROUP BY degree
