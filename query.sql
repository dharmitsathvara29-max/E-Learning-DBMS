-- Query 1: Every student's enrolled courses
SELECT s.student_name,
       c.course_name,
       e.enrollment_date,
       e.completion_status
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c     ON e.course_id = c.course_id
ORDER BY s.student_name, e.enrollment_date;

-- Query 2: Enrollments per course
SELECT c.course_name,
       COUNT(e.enrollment_id) AS total_enrollments
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_enrollments DESC, c.course_name;

-- Query 3: Students enrolled in more than two courses
SELECT s.student_name,
       COUNT(e.course_id) AS courses_enrolled
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name
HAVING COUNT(e.course_id) > 2
ORDER BY s.student_name;

-- Query 4: Courses with no enrollments
SELECT c.course_id, c.course_name
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

-- Query 5: Update completion status
UPDATE enrollments
SET completion_status = 'In Progress'
WHERE student_id = (SELECT student_id FROM students WHERE student_name = 'Kabir')
  AND course_id  = (SELECT course_id FROM courses WHERE course_name = 'Python Programming');

UPDATE enrollments
SET completion_status = 'Completed'
WHERE student_id = (SELECT student_id FROM students WHERE student_name = 'Anaya')
  AND course_id  = (SELECT course_id FROM courses WHERE course_name = 'Web Development');

-- Verify the updates
SELECT s.student_name, c.course_name, e.completion_status
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c  ON e.course_id = c.course_id
ORDER BY s.student_name, c.course_name;
--add phone no via alter table
ALTER TABLE students
ADD COLUMN phone_number VARCHAR(15) UNIQUE;
