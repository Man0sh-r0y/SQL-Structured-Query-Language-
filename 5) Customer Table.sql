CREATE TABLE Customer (
    id INT PRIMARY KEY,
    Name VARCHAR(225),
    Address VARCHAR(225),
    Gender VARCHAR(2),
    City VARCHAR(225),
    Pincode INT
);

INSERT INTO Customer VALUES 
    (1, 'Manash Roy', 'Kolkata', 'M', 'Kolkata', 700081),
    (2, 'Rahul Kumar', 'Bangalore', 'M', 'Bangalore', 700091),
    (3, 'Priya Sukhla', 'Joypur', 'F', 'Joypur', 700061),
    (4, 'Niraj Shaw', 'Delhi', 'M', 'Delhi', 110001),
    (5, 'Neha Roy', 'Nagpur', 'F', 'Nagpur', 110001),
    (6, 'Smita Roy', 'Delhi', 'F', 'Delhi', 110001),
    (7, 'Mohit Roy', 'Kolkata', 'M', 'Kolkata', 700089),
    (8, 'Jitendra Singh', 'Kolkata', 'M', 'Kolkata', 700089),
    (9, 'Sujit Kumar', 'Kolkata', 'M', 'Kolkata', 700089),
    (10, 'Kaushik Roy', 'Kolkata', 'M', 'Kolkata', 700089);

INSERT INTO Customer (id, Name) VALUES(11, 'Bijoy Prasad Modi');

SELECT * FROM Customer WHERE id = 11;

UPDATE Customer SET Address = 'Kolkata', Gender = 'M', City = 'Kolkata', Pincode = 700001 WHERE id = 11;

REPLACE INTO Customer (id, Name, Address, Gender, City, Pincode) -- I have to give id otherwise it'll show error
    VALUES (1, 'Manash Roy', 'Bangalore', 'M', 'Bangalore', 700089);
    -- Replace the row with the given id (if exists) or insert a new row (if not exists
    -- if all details not passed through the VALUES() then those attribute will be set to NULL
REPLACE INTO Customer SET id = 1, Name = 'Manash Roy', Address = 'Kolkata', Gender = 'M', City = 'Kolkata', Pincode = 700089; -- Same as the previous query
REPLACE INTO Customer VALUES (7, 'Mohit Roy', 'Kolkata', 'M', 'Kolkata', 700089); -- a new row will be inserted as this id = 8 isn't present in the database

REPLACE INTO Customer (id, Name, City) -- I have to give id otherwise it'll show error
    SELECT id, Name, City FROM Customer WHERE id = 8; 
    -- Replace the row with id = 8 with the row with id = 8
    -- So, Other attributes (like gender, address ..etc) will be set to NULL as they are not selected

SELECT * FROM Customer;

SET SQL_SAFE_UPDATES = 0;
UPDATE Customer SET Pincode = 110000; -- Set all the pincode to 110000
UPDATE Customer SET Pincode = Pincode + 1; -- Increase all the pincode by 1
DELETE FROM Customer WHERE id = 7;

CREATE TABLE OrderDetails (
    OrderID INT PRIMARY KEY,
    DeliveryDate INT,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(id) ON DELETE SET NULL
);

INSERT INTO OrderDetails VALUES
    (1, 2020-01-01, 1),
    (2, 2020-01-02, 2),
    (3, 2020-01-03, 3),
    (4, 2020-01-04, 4),
    (5, 2020-01-05, 5),
    (6, 2020-01-06, 6);

DELETE FROM Customer WHERE id = 6; 
DELETE FROM Customer WHERE id = 1;

SELECT * FROM Customer;
SELECT * FROM OrderDetails;

SELECT C.*, O.* FROM Customer AS C 
INNER JOIN OrderDetails AS O 
ON C.id = O.CustomerID;

SELECT C.*, O.* FROM Customer AS C 
LEFT JOIN OrderDetails AS O 
ON C.id = O.CustomerID;

SELECT C.*, O.* FROM Customer AS C
RIGHT JOIN OrderDetails AS O 
ON C.id = O.CustomerID;

-- VIEW IN MYSQL
SELECT * FROM Customer;

-- Creating a View
CREATE VIEW CustomView AS SELECT id, Name FROM Customer;

SELECT * FROM CustomView;

-- Change the Custom View
ALTER VIEW CustomView AS SELECT id, Name, Address FROM Customer;

SELECT * FROM CustomView;

-- Dropping a View
DROP VIEW IS EXISTS CustomView;

DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Customer;