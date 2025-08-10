
-- SQL SERVER - MANDATORY ASSIGNMENT 1 - [MODULE 1 and 2]

--Problem Statement:

--ABC Fashion is a leading retailer with a vast customer base and a team of dedicated sales
--representatives. They have a Sales Order Processing System that helps manage customer
--orders and interactions.

CREATE DATABASE ABC_Fashion

USE ABC_Fashion

--Salesman table creation

CREATE TABLE Salesman (
    SalesmanId INT,
    Name VARCHAR(255),
    Commission DECIMAL(10, 2),
    City VARCHAR(255),
    Age INT
);

--Salesman table record insertion 

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
    (101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey', 30);

	SELECT * FROM Salesman

--Customer table creation

CREATE TABLE Customer (
    SalesmanId INT,
    CustomerId INT,
    CustomerName VARCHAR(255),
    PurchaseAmount INT,
    );

--Customer table record insertion 

INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
    (101, 2345, 'Andrew', 550),
    (103, 1575, 'Lucky', 4500),
    (104, 2345, 'Andrew', 4000),
    (107, 3747, 'Remona', 2700),
    (110, 4004, 'Julia', 4545);

	SELECT * FROM Customer

	SELECT * FROM Salesman
	SELECT * FROM Customer

--Orders table Creation

CREATE TABLE Orders 
(
OrderId int, 
CustomerId int, 
SalesmanId int, 
Orderdate Date, 
Amount money
);

--Orders table record insertion 

INSERT INTO Orders Values 
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)

SELECT * FROM Orders

SELECT * FROM Salesman
SELECT * FROM Customer
SELECT * FROM Orders

--Tasks to be Performed:

--1. Insert a new record in your Orders table.

--Answer:

INSERT INTO Orders Values
(5005, 4567, 107, '2023-05-23', 2500);

SELECT * FROM Orders

--2. Add Primary key constraint for SalesmanId column in Salesman table. Add default
--constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
--column in Customer table. Add not null constraint in Customer_name column for the
--Customer table

--Answer: 

-- To add primary key constraint for SalesmanId column in Salesman Table

ALTER TABLE Salesman
ALTER COLUMN SalesmanId int not null

ALTER TABLE Salesman
ADD CONSTRAINT pk_Id
PRIMARY KEY (SalesmanId)

--To add default constraint for City column in Salesman table.

ALTER TABLE Salesman
ADD CONSTRAINT df_city
DEFAULT 'California' FOR city

--To add Foreign key constraint for SalesmanId column in Customer table.

ALTER TABLE Customer WITH NOCHECK
ADD CONSTRAINT fk_sales 
FOREIGN KEY(Salesmanid) REFERENCES Salesman(SalesmanId)

--To add not null constraint in Customer_name column for the Customer table.

ALTER TABLE Customer
ALTER COLUMN CustomerName VARCHAR(255) NOT NULL

--3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
--amount value greater than 500.

--Answer:

--To fetch the data where the Customer's name is ending with 'N'.

SELECT * FROM Customer where CustomerName like '%N' 

--To fetch the data where the purchase amount value is greater than 500

SELECT * FROM Customer where PurchaseAmount>500

--To fetch the data where the Customer’s name is ending with ‘N’ and the purchase
--amount value greater than 500.

SELECT * FROM Customer where CustomerName like '%N' and PurchaseAmount>500

--4. Using SET operators, retrieve the first result with unique SalesmanId values from two
--tables, and the other result containing SalesmanId with duplicates from two tables.

--Answer:

--Using SET operators, to retrieve the first result with unique SalesmanId values from two tables.

SELECT (SalesmanId) FROM Salesman
UNION
SELECT (SalesmanId) FROM Customer

--Using SET operators, TO retrieve the other result containing SalesmanId with duplicates from two tables.

SELECT (SalesmanId) FROM Salesman
UNION ALL
SELECT (SalesmanId) FROM Customer
ORDER BY (SalesmanId)

--5. Display the below columns which has the matching data.
--Orderdate, Salesman Name, Customer Name, Commission, and City which has the
--range of Purchase Amount between 500 to 1500.
--AnswerSELECT O.OrderDate, S.Name, C.CustomerName, S.Commission, S.City
FROM Salesman S JOIN Customer C
ON S.SalesmanId=C.SalesmanId
JOIN Orders O
ON C.CustomerId=O.CustomerId
WHERE PurchaseAmount BETWEEN 500 AND 1500
--6. Using right join fetch all the results from Salesman and Orders table.--Answer: SELECT * FROM Salesman S RIGHT JOIN Orders O 
ON S.SalesmanId=O.SalesmanId 

--------------------------------------------------------------------------------
 