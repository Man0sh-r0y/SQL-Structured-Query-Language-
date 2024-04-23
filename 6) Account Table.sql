CREATE TABLE Account (
    id INT PRIMARY KEY,
    Name VARCHAR(225) UNIQUE,
    Balance INT,
    CONSTRAINT ACCOUNT_BALANCE_CHECK CHECK(Balance > 1000)
);

INSERT INTO Account (id, Name, Balance) VALUES
    (1, 'Manash', 10000),
    (2, 'Neha', 3000),
    (3, 'Smita', 4000),
    (4, 'Rahul', 5000),
    (5, 'Priya', 6000),
    (6, 'Niraj', 7000);

SELECT * FROM Account;

ALTER TABLE Account ADD Interest INT NOT NULL DEFAULT 4; -- Add a new column to the table
ALTER TABLE Account MODIFY Interest FLOAT NOT NULL DEFAULT 4.0; -- Modify the data type of the column
ALTER TABLE Account CHANGE COLUMN Interest SAVING_ACCOUNT_INTEREST FLOAT NOT NULL DEFAULT 4.0;

SELECT * FROM Account;
DESC Account; -- Describe the account table

ALTER TABLE Account DROP SAVING_ACCOUNT_INTEREST; -- Drop the column

ALTER TABLE Account DROP CONSTRAINT ACCOUNT_BALANCE_CHECK;
ALTER TABLE Account ADD CONSTRAINT ACCOUNT_BALANCE_CHECK CHECK(Balance >= 0);
ALTER TABLE Account MODIFY Balance INT NOT NULL DEFAULT 0;

INSERT INTO Account (id, Name) VALUES
    (7, 'Bijoy'),
    (8, 'Sujit'),
    (9, 'Kaushik');

SELECT * FROM Account;

ALTER TABLE Account RENAME TO AccountDetails; -- Rename the table

SELECT * FROM AccountDetails;

DROP TABLE IF EXISTS AccountDetails;