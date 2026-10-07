-- Clean start (drops in child-first order)
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

-- Students table
CREATE TABLE students (
    student_id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email        VARCHAR(100) UNIQUE
);

-- Courses table
CREATE TABLE courses (
    course_id      INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_name    VARCHAR(100) NOT NULL UNIQUE,
    duration_weeks INT
);

-- Junction table: resolves the many-to-many relationship
CREATE TABLE enrollments (
    enrollment_id     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id        INT NOT NULL,
    course_id         INT NOT NULL,
    enrollment_date   DATE NOT NULL,
    completion_status VARCHAR(20) NOT NULL DEFAULT 'Not Started',
    CONSTRAINT fk_enroll_student FOREIGN KEY (student_id)
        REFERENCES students(student_id) ON DELETE CASCADE,
    CONSTRAINT fk_enroll_course FOREIGN KEY (course_id)
        REFERENCES courses(course_id) ON DELETE CASCADE,
    CONSTRAINT uq_student_course UNIQUE (student_id, course_id),
    CONSTRAINT chk_status CHECK (completion_status IN ('Not Started', 'In Progress', 'Completed'))
);