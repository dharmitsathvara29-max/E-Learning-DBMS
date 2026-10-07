INSERT INTO students (student_name, email) VALUES
('Anaya',  'anaya@example.com'),   -- 1
('Kabir',  'kabir@example.com'),   -- 2
('Riya',   'riya@example.com'),    -- 3
('Arjun',  'arjun@example.com'),   -- 4
('Meera',  'meera@example.com'),   -- 5
('Rohan',  'rohan@example.com'),   -- 6
('Sneha',  'sneha@example.com'),   -- 7
('Vikram', 'vikram@example.com');  -- 8

INSERT INTO courses (course_name, duration_weeks) VALUES
('SQL Fundamentals',   4),    -- 1
('Python Programming', 8),    -- 2
('Web Development',    10),   -- 3
('Data Structures',    12);   -- 4 (no enrollments)

INSERT INTO enrollments (student_id, course_id, enrollment_date, completion_status) VALUES
-- Anaya
(1, 1, '2025-01-10', 'Completed'),
(1, 2, '2025-01-15', 'In Progress'),
(1, 3, '2025-02-01', 'In Progress'),
-- Kabir
(2, 1, '2025-01-12', 'In Progress'),
(2, 2, '2025-02-05', 'Not Started'),
-- Riya
(3, 1, '2025-01-20', 'Completed'),
(3, 3, '2025-02-10', 'In Progress'),
-- Arjun
(4, 1, '2025-01-08', 'Completed'),
(4, 2, '2025-01-18', 'Completed'),
(4, 3, '2025-02-03', 'In Progress'),
-- Meera
(5, 2, '2025-01-25', 'In Progress'),
-- Rohan
(6, 1, '2025-01-22', 'In Progress'),
(6, 3, '2025-02-12', 'Not Started'),
-- Sneha
(7, 1, '2025-01-14', 'Not Started'),
(7, 2, '2025-01-28', 'Completed'),
(7, 3, '2025-02-06', 'Completed'),
-- Vikram
(8, 3, '2025-02-15', 'In Progress');