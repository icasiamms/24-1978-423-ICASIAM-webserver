CREATE TABLE enrollments (
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


