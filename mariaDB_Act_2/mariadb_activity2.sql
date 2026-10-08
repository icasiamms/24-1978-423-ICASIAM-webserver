CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);

ALTER TABLE enrollments
ADD CONSTRAINT fk_student 
FOREIGN KEY (student_id) 
REFERENCES students(id);

ALTER TABLE enrollments
ADD CONSTRAINT fk_course 
FOREIGN KEY (course_id) 
REFERENCES courses(course_id);

INSERT INTO enrollments (student_id, course_id, enrollment_date) 
VALUES  
    (1, 1, '2026-09-09'), 
    (2, 2, '2026-09-09'), 
    (4, 3, '2026-09-09');

SELECT 
    students.name, 
    courses.course_name, 
    enrollments.enrollment_date 
FROM enrollments 
JOIN students  
    ON enrollments.student_id = students.id 
JOIN courses 
    ON enrollments.course_id = courses.course_id;

SELECT  students.name, courses.course_name 
FROM enrollments 
JOIN students 
    ON enrollments.student_id = students.id 
JOIN courses  
    ON enrollments.course_id = courses.course_id 
WHERE courses.course_name = 'BSIT';

SELECT students.name, courses.course_name 
FROM enrollments 
JOIN students 
    ON enrollments.student_id = students.id 
JOIN courses 
    ON enrollments.course_id = courses.course_id 
ORDER BY students.name ASC;

SELECT COUNT(*) AS total_students 
FROM students;

SELECT COUNT(*) AS total_enrollments 
FROM students;

SELECT 
    courses.course_name, 
    COUNT(enrollments.student_id) AS number_of_students 
FROM courses 
LEFT JOIN enrollments 
    ON courses.course_id = enrollments.course_id 
GROUP BY courses.course_id, courses.course_name;

SELECT
    courses.course_name, 
    COUNT(enrollments.student_id) AS number_of_students 
FROM courses LEFT JOIN enrollments 
    ON courses.course_id = enrollments.course_id 
GROUP BY courses.course_id, courses.course_name 
ORDER BY number_of_students DESC;

SELECT
    students.id AS student_id,
    students.name AS student_name,
    courses.course_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
ORDER BY students.name;

INSERT INTO students (name, course, year_level) VALUES
('Junjun Dela Cruz', 'BS Information Technology', 2),
('Marites Santos', 'BS Accountancy', 3),
('Boyet Garcia', 'BS Business Administration', 2),
('Inday Reyes', 'BS Nursing', 1),
('Toto Mendoza', 'BS Civil Engineering', 4);

INSERT INTO courses (course_name, description, units) VALUES
('BS Information Technology', 'Computer and information technology', 3),
('BS Accountancy', 'Accounting and financial management', 3),
('BS Business Administration', 'Business and management studies', 3),
('BS Nursing', 'Healthcare and nursing studies', 3),
('BS Civil Engineering', 'Civil engineering and construction', 3);

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2026-08-15'),
(1, 3, '2026-08-15'),
(2, 2, '2026-08-15'),
(2, 3, '2026-08-15'),
(3, 1, '2026-08-16'),
(3, 3, '2026-08-16'),
(4, 4, '2026-08-16'),
(4, 1, '2026-08-16'),
(5, 5, '2026-08-17'),
(5, 1, '2026-08-17');

SELECT students.name
FROM students
JOIN enrollments
    ON students.id = enrollments.student_id
JOIN courses
    ON enrollments.course_id = courses.course_id
WHERE courses.course_name = 'BS Information Technology';

SELECT courses.course_name
FROM courses
JOIN enrollments
    ON courses.course_id = enrollments.course_id
JOIN students
    ON enrollments.student_id = students.id
WHERE students.name = 'Junjun Dela Cruz';

SELECT 
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name
ORDER BY number_of_students DESC;

SELECT 
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name
ORDER BY number_of_students DESC
LIMIT 1;

SELECT *
FROM students
ORDER BY name ASC;

SELECT COUNT(*) AS total_enrollments
FROM enrollments;
