 
--SQL SERVER - CASE STUDY 2

--Simple Queries:

--1. List all the employee details.
--2. List all the department details.
--3. List all job details.
--4. List all the locations.
--5. List out the First Name, Last Name, Salary, Commission for all Employees.
--6. List out the Employee ID, Last Name, Department ID for all employees and alias
--Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id".
--7. List out the annual salary of the employees with their names only.

--WHERE Condition:

--1. List the details about "Smith".
--2. List out the employees who are working in department 20.
--3. List out the employees who are earning salary between 2000 and 3000.
--4. List out the employees who are working in department 10 or 20.
--5. Find out the employees who are not working in department 10 or 30.
--6. List out the employees whose name starts with 'L'.
--7. List out the employees whose name starts with 'L' and ends with 'E'.
--8. List out the employees whose name length is 4 and start with 'J'.
--9. List out the employees who are working in department 30 and draw the salaries more than 2500.
--10. List out the employees who are not receiving commission.

--ORDER BY Clause:

--1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
--2. List out the Employee ID and Name in descending order based on salary.
--3. List out the employee details according to their Last Name in ascending-order.
--4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.

--GROUP BY and HAVING Clause:

--1. List out the department wise maximum salary, minimum salary and average salary of the employees.
--2. List out the job wise maximum salary, minimum salary and average salary of the employees.
--3. List out the number of employees who joined each month in ascending order.
--4. List out the number of employees for each month and year in ascending order based on the year and month.
--5. List out the Department ID having at least four employees.
--6. How many employees joined in February month.
--7. How many employees joined in May or June month.
--8. How many employees joined in 1985?
--9. How many employees joined each month in 1985?
--10. How many employees were joined in April 1985?
--11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?

--Joins:

--1. List out employees with their department names.
--2. Display employees with their designations.
--3. Display the employees with their department names and city.
--4. How many employees are working in different departments? Display with department names.
--5. How many employees are working in the sales department?
--6. Which is the department having greater than or equal to 3 employees and display the department names in
--ascending order.
--7. How many employees are working in 'Dallas'?
--8. Display all employees in sales or operation departments.

--CONDITIONAL STATEMENT

--1. Display the employee details with salary grades. Use conditional statement to create a grade column.
--2. List out the number of employees grade wise. Use conditional statement to create a grade column.
--3. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.

--Subqueries:

--1. Display the employees list who got the maximum salary.
--2. Display the employees who are working in the sales department.
--3. Display the employees who are working as 'Clerk'.
--4. Display the list of employees who are living in 'Boston'.
--5. Find out the number of employees working in the sales department.
--6. Update the salaries of employees who are working as clerks on the basis of 10%.
--7. Display the second highest salary drawing employee details.
--8. List out the employees who earn more than every employee in department 30.
--9. Find out which department has no employees.
--10. Find out the employees who earn greater than the average salary for their department

--Answer:

-- Lets create a database CaseStudy2 and use it.

CREATE DATABASE CaseStudy2;

USE CaseStudy2

--Lets create the following tables:

--1. LOCATION TABLE:

CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');

--2. DEPARTMENT TABLE:

  CREATE TABLE DEPARTMENT 
  (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);

INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

--3. JOB TABLE:

CREATE TABLE JOB 
(
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')

--4. EMPLOYEE TABLE:

CREATE TABLE EMPLOYEE
(
Employee_id INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID)
);

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)

--The Simple queries are:-

--1. To list all the employee details.
--Query:

SELECT * FROM Employee

--2. To list all the department details.
--Query:

SELECT * FROM Department;

--3. To list all job details.
--Query:

SELECT * FROM Job;

--4. To list all the locations.
--Query:

SELECT * FROM Location;

--5. To list out the First Name, Last Name, Salary, Commission for all Employees.
--Query:

SELECT First_name, Last_name, Salary, Comm FROM Employee;

--6. To list out the Employee ID, Last Name, Department ID for all employees and alias
--Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id".
--Query:

SELECT Employee_ID AS "ID of the Employee",
Last_name AS "Name of the Employee",
Department_ID AS "Dep_ID" FROM Employee;

--7. To list out the annual salary of the employees with their names only.
--Query:

SELECT CONCAT(First_name, '', Last_name) AS EmployeeName, Salary*12 AS AnnualSalary FROM Employee;

--or

SELECT First_name + Last_name AS EmployeeName, Salary*12 AS AnnualSalary FROM Employee;



--'WHERE' Condition queries are:

--1. To list the details about "Smith".
--Query:

SELECT * FROM Employee WHERE Last_name = 'Smith' or First_name = 'Smith';

--2. To list out the employees who are working in department 20.
--Query:

SELECT * FROM Employee WHERE Department_ID = 20;

--3. To list out the employees who are earning salary between 2000 and 3000.
--Query:

SELECT * FROM Employee WHERE Salary BETWEEN 2000 AND 3000;

--4. To list out the employees who are working in department 10 or 20.
--Query:

SELECT * FROM Employee WHERE Department_ID = 10 OR Department_ID = 20;

--or

SELECT * FROM Employee WHERE Department_ID IN (10,20);

--5. To find out the employees who are not working in department 10 or 30.
--Query:

SELECT * FROM Employee WHERE Department_ID NOT IN (10,30);

--6. To list out the employees whose name starts with 'L'.
--Query:

SELECT * FROM Employee WHERE First_name LIKE 'L%' OR Last_name LIKE 'L%';

--7. To list out the employees whose name starts with 'L' and ends with 'E'.
--Query:

SELECT * FROM Employee WHERE First_name LIKE 'L%E';

--OR

SELECT * FROM Employee WHERE First_name LIKE 'L%' AND First_name LIKE '%E';

--8. To list out the employees whose name length is 4 and start with 'J'.
--Query:

SELECT * FROM Employee WHERE First_name LIKE 'J___';

--OR

SELECT * FROM Employee WHERE LEN(First_name) = 4 AND First_name LIKE 'J%';

--9. To list out the employees who are working in department 30 and draw the salaries more than 2500.
--Query:

SELECT * FROM Employee WHERE Department_ID = 30 AND Salary > 2500;

--10. To list out the employees who are not receiving commission.
--Query:

SELECT * FROM Employee WHERE Comm IS NULL;



--The 'ORDER BY' Clause queries are:

--1. To list out the Employee ID and Last Name in ascending order based on the Employee ID.
--Query:

SELECT Employee_ID, Last_name FROM Employee ORDER BY Employee_ID

--2. To list out the Employee ID and Name in descending order based on salary.
--Query:

SELECT Employee_ID, Last_name FROM Employee ORDER BY Salary DESC;

--3. To list out the employee details according to their Last Name in ascending-order.
--Query:

SELECT * FROM Employee ORDER BY Last_name ASC;

--4. To list out the employee details according to their Last Name in ascending order and then Department ID in descending order.
--Query:

SELECT * FROM Employee ORDER BY Last_name ASC, Department_ID DESC;



--The 'GROUP BY' and 'HAVING' Clause queries are:

--1. To list out the department wise maximum salary, minimum salary and average salary of the employees.
--Query:

SELECT Department_ID, MAX(Salary)AS Max_salary, MIN(Salary)AS Min_salary, AVG(Salary)AS Avg_salary FROM Employee GROUP BY Department_ID

--2. To list out the job wise maximum salary, minimum salary and average salary of the employees.

SELECT Job_ID, MAX(Salary)AS Max_salary, MIN(Salary)AS Min_salary, AVG(Salary)AS Avg_salary FROM Employee GROUP BY Job_ID

--3. To list out the number of employees who joined each month in ascending order.
--Query:

SELECT COUNT(Employee_id)AS Number_of_employees, MONTH(Hire_date)AS Month_of_hiring FROM Employee
GROUP BY MONTH(Hire_date)
ORDER BY MONTH(Hire_date) ASC

--4. To list out the number of employees for each month and year in ascending order based on the year and month.
--Query:

SELECT YEAR(Hire_date) AS Year, MONTH(Hire_date) AS Month, COUNT(Employee_id) AS Num_employees 
FROM Employee 
GROUP BY YEAR(Hire_date), MONTH(Hire_date) 
ORDER BY Year ASC;

--5. To list out the Department ID having at least four employees.
--Query:

SELECT Department_id 
FROM Employee
GROUP BY Department_id 
HAVING COUNT(*) >= 4;

--6. The number of employees joined in February month.
--Query:

SELECT COUNT(*) AS Num_employees 
FROM Employee
WHERE MONTH(hire_date) = 2;

--7. The number of employees joined in May or June month.
--Query:

SELECT COUNT(*) AS Num_employees 
FROM Employee
WHERE MONTH(Hire_date) IN (5, 6);


--8. The number of employees joined in 1985.
--Query:

SELECT COUNT(*) AS Num_employees 
FROM Employee 
WHERE YEAR(Hire_date) = 1985;

--9. The number of employees joined each month in 1985.
--Query:

SELECT MONTH(hire_date) AS Month, COUNT(*) AS Num_employees 
FROM Employee 
WHERE YEAR(Hire_date) = 1985 
GROUP BY MONTH(Hire_date) 
ORDER BY Month ASC;

--10. The number of employees joined in April 1985.
--Query:

SELECT COUNT(*) AS Num_employees 
FROM Employee 
WHERE YEAR(Hire_date) = 1985 AND MONTH(Hire_date) = 4;

--11. The Department ID having greater than or equal to 3 employees joining in April 1985.
--Query:

SELECT Department_id 
FROM Employee 
WHERE YEAR(Hire_date) = 1985 AND MONTH(Hire_date) = 4 
GROUP BY Department_id 
HAVING COUNT(*) >= 3;

SELECT * FROM Employee
SELECT * FROM Department
SELECT * FROM Job
SELECT * FROM Location

--Joins:

--1. To list out employees with their department names.
--Query:

SELECT e.First_name, e.Last_name, d.Name 
FROM Employee e JOIN Department d 
ON e.Department_id = d.Department_id;

--2. To display employees with their designations.
--Query:

SELECT e.First_name, e.Last_name, j.Designation 
FROM Employee e JOIN Job j
ON e.Job_id = j.Job_id;

--3. To isplay the employees with their department names and city.
--Query:

SELECT e.First_name, e.Last_name, d.Name, l.City 
FROM Employee e JOIN Department d
ON e.Department_id = d.Department_id 
JOIN Location l 
ON d.Location_id = l.Location_id;

--4. The number of employees working in different departments and to display with department names.
--Query:

SELECT d.Name, COUNT(e.Employee_id) AS Num_employees 
FROM Employee e 
JOIN Department d ON e.Department_id = d.Department_id 
GROUP BY d.Name;

--5. The number of employees working in the sales department
--Query:

SELECT COUNT(*) AS Num_employees 
FROM Employee e 
JOIN Department d ON e.Department_id = d.Department_id 
WHERE d.Name = 'Sales';

--6. To display the department having greater than or equal to 3 employees and the department names in ascending order.
--Query:

SELECT d.Name 
FROM Employee e 
JOIN Department d 
ON e.Department_id = d.Department_id 
GROUP BY d.Name 
HAVING COUNT(e.Employee_id) >= 3 
ORDER BY d.Name ASC;

--7. The number of employees working in 'Dallas'.
--Query:

SELECT COUNT(e.Employee_id) AS Num_employees 
FROM Employee e 
JOIN Department d 
ON e.Department_id = d.Department_id 
JOIN location l ON d.Location_id = l.Location_id 
WHERE l.City = 'Dallas';

--8. To display all employees in sales or operation departments.

SELECT e.First_name, e.Last_name 
FROM Employee e 
JOIN Department d 
ON e.Department_id = d.Department_id
WHERE d.Name IN ('Sales', 'Operations')

--OR

SELECT e.First_name, e.Last_name 
FROM Employee e 
JOIN Department d 
ON e.Department_id = d.Department_id
WHERE d.Name = 'Sales'
OR d.Name = 'Operations'

--CONDITIONAL STATEMENT

--1. To display the employee details with salary grades. Use conditional statement to create a grade column.
--Query:

SELECT Employee_id, Last_name, First_name, Salary, Department_id,
CASE
WHEN Salary >= 2500 THEN 'Grade A'
WHEN Salary >= 2000 THEN 'Grade B'
WHEN Salary >= 1500 THEN 'Grade C'
WHEN Salary >= 1000 THEN 'Grade D'
ELSE 'Grade E'
END AS Salary_Grade
FROM Employee;

--2. To list out the number of employees grade wise. Use conditional statement to create a grade column.

SELECT 
    CASE 
        WHEN salary BETWEEN 0 AND 1000 THEN 'Grade 1'
        WHEN salary BETWEEN 1001 AND 1500 THEN 'Grade 2'
        WHEN salary BETWEEN 1501 AND 2000 THEN 'Grade 3'
        WHEN salary BETWEEN 2001 AND 2500 THEN 'Grade 4'
        ELSE 'Grade 5'
    END AS Salary_grade,
    COUNT(employee_id) AS number_of_employees
FROM Employee
GROUP BY 
    CASE 
        WHEN salary BETWEEN 0 AND 1000 THEN 'Grade 1'
        WHEN salary BETWEEN 1001 AND 1500 THEN 'Grade 2'
        WHEN salary BETWEEN 1501 AND 2000 THEN 'Grade 3'
        WHEN salary BETWEEN 2001 AND 2500 THEN 'Grade 4'
        ELSE 'Grade 5'
    END 

--3. To display the employee salary grades and the number of employees between 2000 to 5000 range of salary.
--Query:

SELECT 
	CASE
		WHEN Salary >= 2500 THEN 'Grade A'
		WHEN Salary >= 2000 THEN 'Grade B'
		WHEN Salary >= 1500 THEN 'Grade C'
		WHEN Salary >= 1000 THEN 'Grade D'
		ELSE 'Grade E'
		END AS Salary_Grade, 
    COUNT(Employee_id) AS Number_of_employees
FROM Employee
WHERE 
    salary BETWEEN 2000 AND 5000
GROUP BY 
	CASE
		WHEN Salary >= 2500 THEN 'Grade A'
		WHEN Salary >= 2000 THEN 'Grade B'
		WHEN Salary >= 1500 THEN 'Grade C'
		WHEN Salary >= 1000 THEN 'Grade D'
		ELSE 'Grade E'
		END;
    


--Subqueries:

--1. To display the employees list who got the maximum salary.
--Query:

SELECT * FROM Employee 
WHERE salary = (SELECT MAX(salary) FROM Employee);

--2. To display the employees who are working in the sales department.
--Query:

SELECT * FROM Employee 
WHERE Department_id = (SELECT Department_id FROM Department WHERE Name = 'Sales');

--3. To display the employees who are working as 'Clerk'.
--Query:

SELECT * FROM Employee 
WHERE Job_id = (SELECT Job_id FROM Job WHERE Designation = 'Clerk');

--4. To display the list of employees who are living in 'Boston'.
--Query:

SELECT e.first_name, e.last_name FROM Employee e JOIN Department d ON e.Department_id = d.department_id
JOIN Location L ON d.location_id = l.location_id
WHERE City = 'Boston';

Select * from employee
Select * from department
Select * from job
Select * from location

--5. To find out the number of employees working in the sales department.
--Query:

SELECT COUNT(*) AS number_of_employees 
FROM Employee
WHERE Department_id = (SELECT department_id FROM Department WHERE Name = 'Sales');

--6. To update the salaries of employees who are working as clerks on the basis of 10%.
--Query:

UPDATE Employee
SET Salary = Salary * 1.10 
WHERE Job_id = (SELECT Job_id FROM Job WHERE Designation = 'Clerk');


--7. To display the second highest salary drawing employee details.
--Query:

SELECT * FROM Employee
WHERE Salary = (SELECT MAX(salary) 
                FROM Employee 
                WHERE Salary < (SELECT MAX(Salary) FROM Employee));

--8. To list out the employees who earn more than every employee in department 30.
--Query:

SELECT * FROM Employee
WHERE Salary > (SELECT MAX(Salary) 
                FROM Employee
                WHERE Department_id = 30);

--9. To find out which department has no employees.
--Query:

SELECT Name FROM Department
WHERE Department_id NOT IN (SELECT DISTINCT Department_id FROM Employee);

--10. To find out the employees who earn greater than the average salary for their department
--Query:

SELECT * FROM Employee e
WHERE Salary > (SELECT AVG(Salary) 
                FROM Employee 
                WHERE Department_id = e.Department_id);

----------------------------------------------------------------------