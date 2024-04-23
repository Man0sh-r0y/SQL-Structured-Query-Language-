CREATE TABLE Student (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

INSERT into Student VALUES (1, 'Manash');

SELECT * FROM Student;

DROP TABLE IF EXISTS Student;