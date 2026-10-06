CREATE DATABASE school;

SHOW DATABASES;

USE school;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(100),
    course VARCHAR(100),
    year_level INT );

SHOW TABLES;

DESCRIBE students;

INSERT INTO students (name, course, year_level) 
VALUES 
    ('Juan Dela Cruz', 'BSIT', 1), 
    ('Maria Santos', 'BSIT', 2), 
    ('Pedro Reyes', 'BSIT', 3);

SELECT * FROM students;
WHERE course = 'BSIT';

SELECT * FROM students 
WHERE year_level >= 2;

INSERT INTO students (name, course, year_level) 
VALUES 
    ('Icasiam Marc S', 'BSIT', 3);

SELECT * FROM students;

UPDATE students 
SET year_level =2  
WHERE name = 'Juan Dela Cruz';

DELETE FROM students 
WHERE name = 'Pedro Reyes';

CREATE TABLE courses( 
    course_id INT AUTO_INCREMENT PRIMARY KEY, 
    course_name VARCHAR(100), 
    escription VARCHAR(100), 
    units INT 
    );

INSERT INTO courses (course_name, description, units) 
VALUES 
    ('BSIT', 'Web Development', 20), 
    ('NURSING', 'Caring', 20), 
    ('BSCS', 'Engineering', 20);

SELECT * FROM courses;