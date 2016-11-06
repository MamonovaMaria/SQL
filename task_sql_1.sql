CREATE DATABASE AccountingStudents
SET NAMES 'utf-8'
USE AccountingStudents

CREATE TABLE cities(
    city_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(20) NOT NULL,
    city_country VARCHAR(20) NOT NULL
);

CREATE TABLE students(
    student_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    course TINYINT UNSIGNED NOT NULL,
    gender ENUM('male','female') NOT NULL,
    city_id SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY(city_id) REFERENCES cities(city_id)
);

INSERT INTO cities
    (city_name, city_country) VALUES
    ('Erfurt', 'Germany'),
    ('San-Francisco', 'USA'),
    ('Capetown', 'South Africa'),
    ('Pekin', 'China'),
    ('Essen', 'Germany'),
    ('Hamburg', 'Germany'),
    ('Atlanta', 'USA');

INSERT INTO students
    (name, surname, course, gender, city_id) VALUES
    ('Mark', 'Schmidt', '3','male', '1'),
    ('Helen', 'Hunt', '2', 'female', '2'),
    ('Matumba', 'Zuko', '4', 'male', '3'),
    ('Rin', 'Kupo', '4', 'female','3'),
    ('Zhen', 'Chi Bao', '2', 'male', '4'),
    ('Peter', 'Zimmer', '3', 'male', '5'),
    ('Hanz', 'Mueller', '4', 'male', '6'),
    ('Alisa', 'Kepler', '4', 'female', '1'),
    ('Anna', 'Madavie', '2', 'female', '7');


SELECT COUNT(*) FROM students;

SELECT COUNT(*) FROM students WHERE gender='female';
SELECT course FROM students WHERE gender='female';

SELECT COUNT(*) FROM students, cities WHERE students.city_id = cities.city_id and city_country='Germany';

SELECT COUNT(*) FROM students WHERE course < '4';


UPDATE students SET course = '3' WHERE name = 'Anna'
UPDATE students SET course = '2' WHERE name = 'Peter'

DELETE FROM student, cities WHERE gender = 'female' AND students.city_id = cities.city_id and city_country='Germany';

ALTER TABLE students ADD COLUMN mastered BOOL NOT NULL DEFAULT false;
UPDATE students, cities SET students.mastered = true WHERE students.city_id = cities.city_id and city_country='Germany';
