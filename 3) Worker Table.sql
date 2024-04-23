CREATE TABLE Worker ( 
  Worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,  
  First_Name CHAR(25),
  Last_Name CHAR(25),
  Salary INT(15),
  Joining_Date DATETIME,
  Department CHAR(25)
);  

Insert INTO Worker 
    (Worker_id, First_Name, Last_Name, Salary, Joining_Date, Department) 
    VALUES
    (001, 'Monika' , 'Arora', 100000, '14-02-20 09:00:00'  , 'HR'),
    (002, 'Niharika' , 'Verma', 80000, '14-06-11 09:00:00' , 'Admin'),
    (003, 'Vishal' , 'Singhal', 300000, '14-02-20 09:00:00' , 'HR'),
    (004, 'Amitabh' , 'Singh', 500000, '14-02-20 09:00:00' , 'Admin'),
    (005, 'Vivek' , 'Bhati', 500000, '14-06-11 09:00:00' , 'Admin'), 
    (006, 'Vipul' , 'Diwan' , 200000 , '14-06-11 09:00:00' , 'Account'),
    (007, 'Satish' , 'Kumar' , 75000, '14-01-20 09:00:00' , 'Account'),
    (008, 'Geetika' , 'Chauhan' , 90000, '14-04-11 09:00:00' , 'Admin'); 

Insert INTO Worker (Worker_id, First_Name, Last_Name, Salary, Joining_Date) 
    VALUES (009, 'Manish' , 'Chauhan' , 90000, '14-04-11 09:00:00');
        
SELECT * FROM Worker;

-- References from the Main Table 'Worker'
-- Stores the Amount of Bonus being given to some Worker Corresponding to their 'Worker_id'
CREATE TABLE Bonus (
	WORKER_REF_ID INT, -- An integer column that will store the reference ID of the worker.
	BONUS_AMOUNT INT(10), -- An integer column that will store the amount of the bonus
	BONUS_DATE DATETIME, -- A datetime column that will store the date when the bonus was given.
	FOREIGN KEY (WORKER_REF_ID) -- This line establishes a relationship between the "Bonus" table and another table named "Worker".
    -- The "WORKER_REF_ID" column in the "Bonus" table is a foreign key, meaning it refers to the primary key of another table.
    -- It references the "WORKER_ID" column in the "Worker" table.
		REFERENCES Worker(WORKER_ID) -- This ensures that every "WORKER_REF_ID" in the "Bonus" table must correspond to an existing "WORKER_ID" in the "Worker" table.
        ON DELETE CASCADE -- This is a constraint that specifies what happens when a referenced row in the "Worker" table is deleted.
        -- In this case, it's set to "CASCADE", which means if a row in the "Worker" table is deleted, 
        -- all associated rows in the "Bonus" table with the same "WORKER_REF_ID" will also be deleted automatically.
);

INSERT INTO Bonus
       (WORKER_REF_ID , BONUS_AMOUNT , BONUS_DATE)
       VALUES 
       (001, 5000, '16-02-20'),
       (002, 3000, '16-06-11'),
       (003, 4000, '16-02-20'),
       (001, 4500, '16-02-20'),
       (002, 3500, '16-06-11');
		   
SELECT * FROM Bonus;

-- References the Main Table 'Worker'
-- Stores the Title assigned to a worker Corresponding to their 'Worker_id'
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title
         (WORKER_REF_ID , WORKER_TITLE , AFFECTED_FROM)
         VALUES
          (001, 'Manager', '2016-02-20 00:00:00'),
          (002, 'Executive', '2016-06-11 00:00:00'),
          (008, 'Executive', '2016-06-11 00:00:00'),
          (005, 'Manager', '2016-06-11 00:00:00'),
          (004, 'Asst. Manager', '2016-06-11 00:00:00'),
          (007, 'Executive', '2016-06-11 00:00:00'),
          (006, 'Lead', '2016-06-11 00:00:00'),
          (003, 'Lead', '2016-06-11 00:00:00');
    
SELECT * FROM Title;

SELECT * FROM Worker WHERE Salary > 80000;
SELECT * FROM Worker WHERE Department = 'HR';
SELECT * FROM Worker WHERE Salary BETWEEN 80000 AND 300000;
SELECT * FROM Worker WHERE Department = 'HR' OR Department = 'Admin';
SELECT * FROM Worker WHERE Department IN ('HR', 'Admin'); -- better way to do the previous query
SELECT * FROM Worker WHERE Department NOT IN ('HR', 'Admin'); 
SELECT * FROM Worker WHERE Department IS NULL;
SELECT * FROM Worker WHERE Department IS NOT NULL;
SELECT * FROM Worker WHERE First_Name LIKE '%i%';
SELECT * FROM Worker WHERE First_Name LIKE '_i'; -- i at the 2nd place of the first name
SELECT * FROM Worker ORDER BY Salary; -- in the oder of increasing order of salary
SELECT * FROM Worker ORDER BY Salary DESC; -- in the order of decreasing order of salary
SELECT DISTINCT Department FROM Worker; -- get the unique values of the department
SELECT Department FROM Worker GROUP BY Department; -- get the unique/distinct values of the department => (ans: HR, Admin, Account)
SELECT Department, COUNT(Department) FROM Worker GROUP BY Department; -- how many employees are there in every department
SELECT Department, AVG(Salary) FROM Worker GROUP BY Department; -- department wise average salary
SELECT Department, MAX(Salary) FROM Worker GROUP BY Department; -- department wise max salary
SELECT Department, MIN(Salary) FROM Worker GROUP BY Department; -- department wise min salary
SELECT Department, SUM(Salary) FROM Worker GROUP BY Department; -- department wise sum salary
SELECT Department, COUNT(Department) FROM Worker GROUP BY Department HAVING COUNT(Department) > 2; -- List all the  departments where are more than 2 employees working

DROP TABLE IF EXISTS Bonus;
DROP TABLE IF EXISTS Title;
DROP TABLE IF EXISTS Worker;