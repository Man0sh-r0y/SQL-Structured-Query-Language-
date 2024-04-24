-- Create the student table
CREATE TABLE Student (
    id INT PRIMARY KEY, -- attribute
    name VARCHAR(255) -- attribute
);

-- insert values into table
INSERT into Student VALUES (1, 'Manash');

-- show all the data of student table
SELECT * FROM Student;

-- delete the student table
DROP TABLE IF EXISTS Student;