
--SQL SERVER - MANDATORY ASSIGNMENT 3 - [MODULE - 5 & 6]

--Dataset: Jomato

--About the dataset:

--You work for a data analytics company, and your client is a food delivery platform similar to
--Jomato. They have provided you with a dataset containing information about various
--restaurants in a city. Your task is to analyze this dataset using SQL queries to extract valuable
--insights and generate reports for your client.

--Tasks to be performed:

--1. Create a stored procedure to display the restaurant name, type and cuisine where the
--table booking is not zero.
--2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
--and rollback it.
--3. Generate a row number column and find the top 5 areas with the highest rating of
--restaurants.
--4. Use the while loop to display the 1 to 50.
--5. Write a query to Create a Top rating view to store the generated top 5 highest rating of
--restaurants.
--6. Create a trigger that give an message whenever a new record is inserted.

--Answer:

--Lets create a database Serve and use it.

CREATE DATABASE Serve

USE Serve

--Let us import the dataset Jomato files.
--now,

SELECT * FROM Jomato

--Tasks as performed:

--1. To create a stored procedure to display the restaurant name, type and cuisine where the
--table booking is not zero.

--Query:

CREATE PROCEDURE Jomato_details

AS
    SELECT RestaurantName, RestaurantType, CuisinesType
    FROM Jomato
    WHERE TableBooking != 0
GO

EXEC Jomato_details

--2. To create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. 

--Query:

BEGIN TRANSACTION;

UPDATE Jomato
SET CuisinesType = 'Cafeteria'
WHERE CuisinesType = 'Cafe'

--To check the result with a SELECT query and rollback it.

SELECT * FROM Jomato WHERE CuisinesType = 'Cafeteria';

ROLLBACK TRANSACTION;

--3. To generate a row number column and find the top 5 areas with the highest rating of restaurants.

--Query:

WITH RankedAreas AS (
    SELECT area, rating,
           ROW_NUMBER() OVER(PARTITION BY area ORDER BY rating DESC) AS row_num
    FROM Jomato
)
SELECT area, rating
FROM RankedAreas
WHERE row_num <= 5
ORDER BY rating DESC;

--4. To use the while loop to display the 1 to 50.

--Query:

DECLARE @counter INT = 1;

WHILE @counter <= 50
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END;

--5. To write a query to create a Top rating view to store the generated top 5 highest rating of restaurants.

--Query:

CREATE VIEW Top5Ratings AS
SELECT RestaurantName, area, rating
FROM (
    SELECT RestaurantName, area, rating,
           ROW_NUMBER() OVER (ORDER BY rating DESC) AS row_num
    FROM Jomato
) AS RankedRestaurants
WHERE row_num <= 5;

SELECT * From Top5Ratings

--6. To create a trigger that give an message whenever a new record is inserted.

--Query:

CREATE TRIGGER New_Record ON Jomato
AFTER INSERT 
AS BEGIN
    PRINT 'A new record has been inserted.';
END;

--To view the trigger activation

INSERT INTO Jomato VALUES (7105, 'Likla', 'Bakery', NULL, 40, 200, 1, 0, 'Fast Food', 'Imphal', 'Imphal West', 50)