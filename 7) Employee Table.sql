-- Create Employee Table
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    EmailID VARCHAR(100),
    PhoneNo VARCHAR(20),
    City VARCHAR(50)
);

INSERT INTO Employee (id, FirstName, LastName, Age, EmailID, PhoneNo, City) VALUES
    (1, 'John', 'Doe', 30, 'john@example.com', '1234567890', 'New York'),
    (2, 'Jane', 'Smith', 25, 'jane@example.com', '0987654321', 'Los Angeles'),
    (3, 'Alice', 'Johnson', 35, 'alice@example.com', '9876543210', 'Chicago'),
    (4, 'Bob', 'Williams', 40, 'bob@example.com', '0123456789', 'Houston'),
    (5, 'Emily', 'Brown', 28, 'emily@example.com', '5555555555', 'San Francisco'),
    (6, 'David', 'Jones', 32, 'david@example.com', '1111111111', 'New York'),
    (7, 'Sarah', 'Davis', 26, 'sarah@example.com', '2222222222', 'Los Angeles'),
    (8, 'Michael', 'Wilson', 37, 'michael@example.com', '3333333333', 'Chicago'),
    (9, 'Olivia', 'Taylor', 42, 'olivia@example.com', '4444444444', 'Houston'),
    (10, 'William', 'Anderson', 29, 'william@example.com', '9999999999', 'San Francisco');

-- Create Project Table
CREATE TABLE Project (
    id INT PRIMARY KEY,
    EmployeeID INT,
    Name VARCHAR(100),
    StartDate DATE,
    ClientID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(id)
);

INSERT INTO Project (id, EmployeeID, Name, StartDate, ClientID) VALUES
    (1, 1, 'Project 1', '2024-01-01', 1),
    (2, 2, 'Project 2', '2024-02-15', 2),
    (3, 1, 'Project 3', '2024-03-10', 3),
    (4, 4, 'Project 4', '2024-04-05', 4),
    (5, 5, 'Project 5', '2024-05-20', 5);

-- Create Client Table
CREATE TABLE Client (
    id INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    EmailID VARCHAR(100),
    PhoneNo VARCHAR(20),
    City VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(id)
);

INSERT INTO Client (id, FirstName, LastName, Age, EmailID, PhoneNo, City, EmployeeID) VALUES
    (1, 'Michael', 'Johnson', 45, 'michael@example.com', '1111111111', 'San Francisco', 1),
    (2, 'Emma', 'Wilson', 38, 'emma@example.com', '2222222222', 'Los Angeles', 2),
    (3, 'William', 'Miller', 50, 'william@example.com', '3333333333', 'Chicago', 1),
    (4, 'Olivia', 'Davis', 42, 'olivia@example.com', '4444444444', 'Houston', 4),
    (5, 'James', 'Martinez', 55, 'james@example.com', '5555555555', 'San Francisco', 5);


-- INNER JOIN
-- Enlist all the employees ID's, names along with the Project Allocated with them
SELECT E.id, E.FirstName, E.LastName, P.Name
FROM Employee AS E
INNER JOIN Project AS P
ON E.id = P.EmployeeID;

-- Without using INNER JOIN (Same Previous Question)
SELECT E.id, E.FirstName, E.LastName, P.Name
FROM Employee AS E, Project AS P
WHERE E.id = P.EmployeeID;

-- Fetch out all the employee ID's and their contact detail who have been working
-- from New York with the Client name working in San Francisco
SELECT E.id, E.FirstName, E.LastName, E.PhoneNo, E.EmailID, C.FirstName, C.LastName
FROM Employee AS E
INNER JOIN Client AS C
ON E.id = C.EmployeeID
WHERE E.City = 'New York' AND C.City = 'San Francisco';

-- Without using INNER JOIN (Same Previous Question)
SELECT E.id, E.FirstName, E.LastName, E.PhoneNo, E.EmailID, C.FirstName, C.LastName
FROM Employee AS E, Client AS C
WHERE E.id = C.EmployeeID AND E.City = 'New York' AND C.City = 'San Francisco';

-- LEFT JOIN
-- Fetch out each project allocated to each employee
SELECT E.id, E.FirstName, E.LastName, P.Name
FROM Employee AS E
LEFT JOIN Project AS P
ON E.id = P.EmployeeID;

-- RIGHT JOIN
-- List out all the project along with the employee's name and their respective email id
SELECT E.FirstName, E.LastName, E.EmailID, P.Name
FROM Employee AS E
RIGHT JOIN Project AS P
ON E.id = P.EmployeeID;

-- CROSS JOIN
-- List out all the possible combinations possible of employees's name and projects that can exist
SELECT E.FirstName, E.LastName, P.Name
FROM Employee AS E
CROSS JOIN Project AS P;

-- SUB QUERIES

-- Employee with age > 30
SELECT * FROM Employee WHERE Age > 30; -- Normal Query
SELECT * FROM Employee WHERE Age IN (SELECT Age FROM Employee WHERE AGE > 30); -- Using Sub Query

-- Employee details working in more than 1 Project
SELECT * FROM Employee 
WHERE id IN 
(SELECT EmployeeID FROM Project GROUP BY EmployeeID HAVING COUNT(EmployeeID) > 1);

-- Employee details having age greater than the average age of all the employees
SELECT * FROM Employee 
WHERE Age > (SELECT AVG(Age) FROM Employee);

-- Select MAX age person whose first name contains 'a'
SELECT * FROM Employee WHERE Age = (SELECT MAX(Age) FROM Employee WHERE FirstName LIKE '%a%');
SELECT MAX(Age) FROM (SELECT * FROM Employee WHERE FirstName LIKE '%a%') AS TEMP_TABLE;
-- (SELECT * FROM Employee WHERE FirstName LIKE '%a%') => This is returning a Table which is considered as derived table
-- I have to fetch Max age from this table
-- So I have to give this table a Name
-- As Every derived table must have its own alias
-- TEMP_TABLE => This is the derived table name (alias)

-- Find the 3rd Oldest Employee
SELECT * FROM Employee E1
WHERE 3 = (SELECT COUNT(E2.Age) FROM Employee E2 WHERE E2.Age >= E1.Age);



-- DELETE TABLES
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Employee;
