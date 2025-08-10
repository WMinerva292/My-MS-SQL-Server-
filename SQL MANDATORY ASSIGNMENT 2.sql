
--SQL SERVER - MANDATORY ASSIGNMENT 2 - [MODULE 3 AND 4]

--Dataset: Jomato

--About the dataset:

--You work for a data analytics company, and your client is a food delivery platform similar to Jomato. 
--They have provided you with a dataset containing information about various restaurants in a city. 
--Your task is to analyze this dataset using SQL queries to extract valuable insights and generate reports for your client.

--Tasks to be performed:

--1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.
--2. Use the function to display the restaurant name and cuisine type which has themaximum number of rating.
--3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
--start rating, ‘Good’ if it has above 3.5 and below 4 star rating, ‘Average’ if it is above 3
--and below 3.5 and ‘Bad’ if it is below 3 star rating and
--4. Find the Ceil, floor and absolute values of the rating column and display the current
--date and separately display the year, month_name and day.
--5. Display the restaurant type and total average cost using rollup

--Answer:

--Lets create a database Fin_food and use it.

CREATE DATABASE Fin_food

USE Fin_food

--Let us import the dataset Jomato files.
--now,

SELECT * FROM Jomato

--Tasks as performed:

--1. To create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.

--Query:

CREATE FUNCTION QuickChickenBites(@CuisinesType NVARCHAR(100))
RETURNS NVARCHAR(100)
AS
BEGIN
    RETURN REPLACE(@CuisinesType, 'Quick Bites', 'Quick Chicken Bites')
END;

--2. To use the function to display the restaurant name and cuisine type which has the maximum number of rating.

--Query:

SELECT RestaurantName, dbo.QuickChickenBites(CuisinesType) as CuisinesType
FROM Jomato
WHERE rating = (
    SELECT MAX(Rating) FROM Jomato
);

SELECT TOP 3 RestaurantName, CuisinesType, Rating
FROM Jomato
ORDER BY rating DESC;

--3. To create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
--start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
--and below 3.5 and ‘Bad’ if it is below 3 star rating.

--Query:

SELECT
    RestaurantName,
    CuisinesType,
    Rating,
    CASE
        WHEN Rating > 4 THEN 'Excellent'
        WHEN Rating > 3.5 AND Rating <= 4 THEN 'Good'
        WHEN Rating > 3 AND Rating <= 3.5 THEN 'Average'
        ELSE 'Bad'
    END AS Rating_Status
FROM Jomato ORDER BY Rating DESC;

--OR

SELECT
    RestaurantName,
    CuisinesType,
    Rating,
    CASE
        WHEN Rating > 4 THEN 'Excellent'
        WHEN Rating > 3.5 AND Rating <= 4 THEN 'Good'
        WHEN Rating > 3 AND Rating <= 3.5 THEN 'Average'
        ELSE 'Bad'
    END AS Rating_Status
FROM Jomato;

--4. To find the Ceil, floor and absolute values of the rating column and display the current date
--and separately display the year, month_name and day.

--Query:

SELECT
    RestaurantName,
    CuisinesType,
    Rating,
    CEILING(Rating) AS Ceil_Rating,
    FLOOR(Rating) AS Floor_Rating,
    ABS(Rating) AS Absolute_Rating,
    GETDATE() AS CurrentDate,
    YEAR(GETDATE()) AS Year,
    DATENAME(MONTH, GETDATE()) AS Month_Name,
    DAY(GETDATE()) AS Day
FROM Jomato;

--5. To display the restaurant type and total average cost using rollup.

--Query:

SELECT
    RestaurantType,
    AVG(AverageCost) AS Total_Average_Cost
FROM Jomato
GROUP BY ROLLUP(RestaurantType);

-------------------------------------------------------------------------------------