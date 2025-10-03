

--CREATE DATABASE HOMETASK13;
--GO
--USE HOMETASK13;
--------------------------------------------------------------------------------
--Easy Tasks
--1. You need to write a query that outputs "100-Steven King", meaning emp_id + 
--first_name + last_name in that format using employees table.

--SELECT * FROM Employees;

-----------------------------------
--SELECT CONCAT(e.EMPLOYEE_ID, '-', e.FIRST_NAME, ' ', e.LAST_NAME) EmployeeInfo
--FROM Employees e;

--------------------------------------------------------------------------------
--2. Update the portion of the phone_number in the employees table, within the phone
--	number the substring '124' will be replaced by '999'

--SELECT * FROM Employees;

--UPDATE Employees
--SET phone_number = REPLACE(phone_number, '124', '999');

--SELECT * FROM Employees;

--------------------------------------------------------------------------------
--3.Display the first name and the length of the first name for all employees 
--whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate 
--	label. Sort the results by the employees' first names.(Employees)

--SELECT 
--    FIRST_NAME AS EmployeeFirstName,
--    LEN(FIRST_NAME) AS NameLength   -- use LENGTH(FIRST_NAME) in MySQL/Oracle/Postgres
--FROM Employees
--WHERE FIRST_NAME LIKE 'A%' 
--   OR FIRST_NAME LIKE 'J%' 
--   OR FIRST_NAME LIKE 'M%'
--ORDER BY FIRST_NAME;

--------------------------------------------------------------------------------
--4. Write an SQL query to find the total salary for each manager ID.(Employees table)

--SELECT 
--    MANAGER_ID,
--    SUM(SALARY) AS TotalSalary
--FROM Employees
--GROUP BY MANAGER_ID;

--------------------------------------------------------------------------------
--5. Write a query to retrieve the year and the highest value from the columns 
--Max1, Max2, and Max3 for each row in the TestMax table

--SELECT 
--    Year1,
--    CASE 
--        WHEN Max1 >= Max2 AND Max1 >= Max3 THEN Max1
--        WHEN Max2 >= Max1 AND Max2 >= Max3 THEN Max2
--        ELSE Max3
--    END AS HighestValue
--FROM TestMax;

--------------------------------------------------------------------------------
--6. Find me odd numbered movies and description is not boring.(cinema)

--SELECT id, movie, description, rating
--FROM cinema
--WHERE id % 2 = 1          -- odd numbered movies
--  AND description <> 'boring';   -- not boring

--------------------------------------------------------------------------------
--7. You have to sort data based on the Id but Id with 0 should always be the last 
--row. Now the question is can you do that with a single order by column.(SingleOrder)

--SELECT Id, Vals
--FROM SingleOrder
--ORDER BY (CASE WHEN Id = 0 THEN 999999 ELSE Id END);

--------------------------------------------------------------------------------
--8. Write an SQL query to select the first non-null value from a set of columns. 
--If the first column is null, move to the next, and so on. If all columns are null, 
--return null.(person)

--SELECT 
--    id,
--    COALESCE(ssn, passportid, itin) AS FirstNonNull
--FROM person;

--------------------------------------------------------------------------------
--Medium Tasks
--1. Split column FullName into 3 part ( Firstname, Middlename, and Lastname).(Students Table)

--SELECT 
--    StudentID,
--    FullName,
--    PARSENAME(REPLACE(FullName, ' ', '.'), 3) AS FirstName,
--    PARSENAME(REPLACE(FullName, ' ', '.'), 2) AS MiddleName,
--    PARSENAME(REPLACE(FullName, ' ', '.'), 1) AS LastName,
--    Grade
--FROM Students;

--------------------------------------------------------------------------------
--2. For every customer that had a delivery to California, provide a result set of 
--the customer orders that were delivered to Texas. (Orders Table)

--SELECT o.CustomerID, o.OrderID, o.DeliveryState, o.Amount
--FROM Orders o
--WHERE o.DeliveryState = 'Texas'
--  AND o.CustomerID IN (
--        SELECT CustomerID
--        FROM Orders
--        WHERE DeliveryState = 'California'
--      );

--------------------------------------------------------------------------------
--3. Write an SQL statement that can group concatenate the following values.(DMLTable)

--SELECT STRING_AGG(String, ', ') AS ConcatenatedValues
--FROM DMLTable;

--------------------------------------------------------------------------------
--4. Find all employees whose names (concatenated first and last) contain the 
--	letter "a" at least 3 times.

--SELECT 
--    EMPLOYEE_ID,
--    FIRST_NAME,
--    LAST_NAME,
--    FIRST_NAME + ' ' + LAST_NAME AS FullName
--FROM Employees
--WHERE (LEN(FIRST_NAME + LAST_NAME) 
--     - LEN(REPLACE(LOWER(FIRST_NAME + LAST_NAME), 'a', ''))) >= 3;

--------------------------------------------------------------------------------
--5. The total number of employees in each department and the percentage of those 
--	employees who have been with the company for more than 3 years(Employees)

--SELECT 
--    DEPARTMENT_ID,
--    COUNT(*) AS TotalEmployees,
--    CAST(100.0 * SUM(CASE WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) > 3 THEN 1 ELSE 0 END) 
--        / COUNT(*) AS DECIMAL(5,2)) AS PercentageOver3Years
--FROM Employees
--GROUP BY DEPARTMENT_ID;

--------------------------------------------------------------------------------
--Difficult Tasks
--1. Write an SQL query that replaces each row with the sum of its value and the 
--	previous rows' value. (Students table)

--SELECT 
--    StudentID,
--    FullName,
--    Grade,
--    SUM(Grade) OVER (ORDER BY StudentID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS CumulativeGrade
--FROM Students;

--------------------------------------------------------------------------------
--2. Given the following dataset, find the students that share the same 
--	birthday.(Student Table)

--SELECT s1.StudentName, s1.Birthday
--FROM Student s1
--JOIN (
--    SELECT Birthday
--    FROM Student
--    GROUP BY Birthday
--    HAVING COUNT(*) > 1
--) s2
--    ON s1.Birthday = s2.Birthday
--ORDER BY s1.Birthday, s1.StudentName;

--------------------------------------------------------------------------------
--3. You have a table with two players (Player A and Player B) and their scores. 
--If a pair of players have multiple entries, aggregate their scores into a single 
--row for each unique pair of players. Write an SQL query to calculate the total 
--	score for each unique player pair(PlayerScores)

--SELECT 
--    CASE WHEN PlayerA < PlayerB THEN PlayerA ELSE PlayerB END AS Player1,
--    CASE WHEN PlayerA < PlayerB THEN PlayerB ELSE PlayerA END AS Player2,
--    SUM(Score) AS TotalScore
--FROM PlayerScores
--GROUP BY 
--    CASE WHEN PlayerA < PlayerB THEN PlayerA ELSE PlayerB END,
--    CASE WHEN PlayerA < PlayerB THEN PlayerB ELSE PlayerA END;

--------------------------------------------------------------------------------
--4. Write an SQL query that separates the uppercase letters, lowercase letters, 
--	numbers, and other characters from the given string 'tf56sd#%OqH' into 
--		separate columns.

--WITH Tally AS (
--    SELECT TOP (LEN('tf56sd#%OqH')) 
--           ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
--    FROM sys.objects
--),
--SplitChars AS (
--    SELECT SUBSTRING(s.val, t.n, 1) AS ch
--    FROM (SELECT 'tf56sd#%OqH' AS val) s
--    CROSS JOIN Tally t
--)
--SELECT
--    STRING_AGG(CASE WHEN ch COLLATE Latin1_General_CS_AS LIKE '[A-Z]' THEN ch END, '') AS UppercaseLetters,
--    STRING_AGG(CASE WHEN ch COLLATE Latin1_General_CS_AS LIKE '[a-z]' THEN ch END, '') AS LowercaseLetters,
--    STRING_AGG(CASE WHEN ch LIKE '[0-9]' THEN ch END, '') AS Numbers,
--    STRING_AGG(CASE WHEN ch COLLATE Latin1_General_CS_AS LIKE '[^A-Za-z0-9]' THEN ch END, '') AS OtherCharacters
--FROM SplitChars;
