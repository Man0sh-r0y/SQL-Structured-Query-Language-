-- Table 1
CREATE TABLE Department1 (
    id INT PRIMARY KEY,
    EmployeeID INT,
    Name VARCHAR(50),
    Role VARCHAR(50)
);

-- Table 2
CREATE TABLE Department2 (
    id INT PRIMARY KEY,
    EmployeeID INT,
    Name VARCHAR(50),
    Role VARCHAR(50)
);

INSERT INTO Department1 (id, EmployeeID, Name, Role) VALUES
    (1, 1, 'A', 'Engineer'),
    (2, 2, 'B', 'Salesman'),
    (3, 3, 'C', 'Manager'),
    (4, 4, 'D', 'Salesman'),
    (5, 5, 'E', 'Engineer');

INSERT INTO Department2 (id, EmployeeID, Name, Role) VALUES
    (3, 3, 'C', 'Manager'),
    (6, 6, 'F', 'Marketing'),
    (7, 7, 'G', 'Salesman');

-- SET OPERATION

-- List out all the employees in the company (UNION SET OPERATION)
SELECT * FROM Department1
UNION
SELECT * FROM Department2;

-- List out all the employees in all departments who work as Salesman
SELECT * FROM Department1 WHERE Role = 'Salesman'
UNION 
SELECT * FROM Department2 WHERE Role = 'Salesman';

-- List out all the employees who work in all the departments (INTERSECTION SET OPERATION)
SELECT Department1.* FROM Department1 
INNER JOIN Department2 
ON Department1.EmployeeID = Department2.EmployeeID;

-- Another Way to write the above query
SELECT Department1.* FROM Department1
INNER JOIN Department2 
USING (EmployeeID);

-- Without using INNER JOIN (Same Previous Question)
SELECT Department1.* FROM Department1, Department2
WHERE Department1.EmployeeID = Department2.EmployeeID;

-- List out all the employees working in department 1 but not in department 2 (MINUS SET OPERATION)
SELECT Department1.* FROM Department1
LEFT JOIN Department2
USING (EmployeeID)
WHERE Department2.id IS NULL;

DROP TABLE IF EXISTS Department1;
DROP TABLE IF EXISTS Department2;