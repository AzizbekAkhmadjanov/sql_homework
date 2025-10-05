
--CREATE DATABASE HOMETASK14;
--GO
--USE HOMETASK14;
--------------------------------------------------------------------------------
--Easy Tasks
--1. Write a SQL query to split the Name column by a comma into two separate 
--	columns: Name and Surname.(TestMultipleColumns)

--SELECT * FROM TestMultipleColumns;

-----------------------------------
--SELECT Id,
--    PARSENAME(REPLACE([Name], ',', '.'), 2) AS [Name],
--    PARSENAME(REPLACE([Name], ',', '.'), 1) AS Surname
--FROM TestMultipleColumns;

--------------------------------------------------------------------------------
--2. Write a SQL query to find strings from a table where the string itself 
--	contains the % character.(TestPercent)

--SELECT * FROM TestPercent;

-----------------------------------1st way: using []
--SELECT * FROM TestPercent
--WHERE Strs LIKE '%[%]%';

-----------------------------------2nd way: using ESCAPE
--SELECT *
--FROM TestPercent
--WHERE Strs LIKE '%!%%' ESCAPE '!';

--------------------------------------------------------------------------------
--3. Split a string based on dot(.).(Splitter)

--SELECT * FROM Splitter;

-----------------------------------
--SELECT Id, [value] FROM Splitter
--CROSS APPLY string_split(Vals, '.');

--------------------------------------------------------------------------------
--4. Write a SQL query to return all rows where the value in the Vals column 
--	contains more than two dots (.).(testDots)

--SELECT * FROM testDots;

-----------------------------------
--SELECT * FROM testDots
--WHERE Vals LIKE '%[.]%[.]%[.]%';

--------------------------------------------------------------------------------
--5. Write a SQL query to count the spaces present in the string.(CountSpaces)

--SELECT * FROM CountSpaces;

-----------------------------------
--SELECT texts,
--	LEN(texts) - LEN(REPLACE(texts, ' ', '')) SpaceCount
--FROM CountSpaces;

--------------------------------------------------------------------------------
--6. Write a SQL query that finds out employees who earn more than their 
--		managers.(Employee)

--SELECT * FROM Employee;

-----------------------------------
--SELECT emps.Id, 
--		emps.[Name] EmployeeName, 
--		emps.Salary EmployeeSalary,
--		mangs.[Name] ManagerName, 
--		mangs.Salary ManagerSalary
--FROM Employee emps
--INNER JOIN Employee mangs
--	ON emps.ManagerId= mangs.Id
--WHERE emps.Salary> mangs.Salary;

--------------------------------------------------------------------------------
----7. Find the employees who have been with the company for more than 10 years, 
--but less than 15 years. Display their Employee ID, First Name, Last Name, 
--Hire Date, and the Years of Service (calculated as the number of years between 
--the current date and the hire date).(Employees)

--SELECT * FROM Employees;

-----------------------------------
--SELECT 
--    EMPLOYEE_ID AS [Employee ID],
--    FIRST_NAME AS [First Name],
--    LAST_NAME AS [Last Name],
--    HIRE_DATE AS [Hire Date],
--    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS [Years of Service]
--FROM Employees
--WHERE DATEDIFF(YEAR, HIRE_DATE, GETDATE()) > 10
--  AND DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 15;

--------------------------------------------------------------------------------
--Medium Tasks
--1. write a SQL query to find all dates' Ids with higher temperature compared to 
--its previous (yesterday's) dates.(weather)

--SELECT * FROM weather;

-----------------------------------
--SELECT 
--    w1.Id AS PrevDayId,
--    w1.RecordDate AS PrevDate,
--    w1.Temperature AS PrevTemperature,
--    w2.Id AS CurrDayId,
--    w2.RecordDate AS CurrDate,
--    w2.Temperature AS CurrTemperature
--FROM weather w1
--INNER JOIN weather w2
--    ON w2.RecordDate = DATEADD(DAY, 1, w1.RecordDate)
--WHERE w2.Temperature > w1.Temperature;

--------------------------------------------------------------------------------
--2. Write an SQL query that reports the first login date for each player.(Activity)

--SELECT * FROM Activity;

-----------------------------------
--SELECT player_id,
--		MIN(event_date) first_login_date
--FROM Activity
--GROUP BY player_id;

--------------------------------------------------------------------------------
--3. Your task is to return the third item from that list.(fruits)

--SELECT * FROM fruits;

-----------------------------------
--SELECT 
--	PARSENAME(REPLACE(fruit_list, ',', '.'), 2) third_item 
--FROM fruits;

--------------------------------------------------------------------------------
--4. Write an SQL query to determine the Employment Stage for each employee 
--	based on their HIRE_DATE. The stages are defined as follows:
	--If the employee has worked for less than 1 year → 'New Hire'
	--If the employee has worked for 1 to 5 years → 'Junior'
	--If the employee has worked for 5 to 10 years → 'Mid-Level'
	--If the employee has worked for 10 to 20 years → 'Senior'
	--If the employee has worked for more than 20 years → 'Veteran'(Employees)

--SELECT * FROM Employees;

-----------------------------------
--SELECT 
--    *,
--    CASE 
--        WHEN YEAR(GETDATE()) - YEAR(HIRE_DATE) < 1 THEN 'New Hire'
--        WHEN YEAR(GETDATE()) - YEAR(HIRE_DATE) BETWEEN 1 AND 4 THEN 'Junior'
--        WHEN YEAR(GETDATE()) - YEAR(HIRE_DATE) BETWEEN 5 AND 9 THEN 'Mid-Level'
--        WHEN YEAR(GETDATE()) - YEAR(HIRE_DATE) BETWEEN 10 AND 20 THEN 'Senior'
--        WHEN YEAR(GETDATE()) - YEAR(HIRE_DATE) > 20 THEN 'Veteran'
--    END AS [Employment Stage]
--FROM Employees;

--------------------------------------------------------------------------------
--5. Write a SQL query to extract the integer value that appears at the start of 
--	the string in a column named Vals.(GetIntegers)

--SELECT * FROM GetIntegers;

-----------------------------------
--SELECT 
--    VALS,
--    LEFT(VALS, PATINDEX('%[^0-9]%', VALS + 'X') - 1) AS ExtractedInteger
--FROM GetIntegers
--WHERE VALS LIKE '[0-9]%';

--------------------------------------------------------------------------------
--Difficult Tasks
--1. In this puzzle you have to swap the first two letters of the comma separated 
--	string.(MultipleVals)

--SELECT * FROM MultipleVals;

-----------------------------------
--SELECT 
--    Id,
--    Vals,
--    CONCAT(
--        PARSENAME(REPLACE(Vals, ',', '.'), 2), ',',  -- 2nd element
--        PARSENAME(REPLACE(Vals, ',', '.'), 3), ',',  -- 1st element
--        PARSENAME(REPLACE(Vals, ',', '.'), 1)        -- remaining element(s)
--    ) AS SwappedVals
--FROM MultipleVals;

--------------------------------------------------------------------------------
--2. Write a SQL query to create a table where each character from the string 
--		will be converted into a row.(sdgfhsdgfhs@121313131)

--DROP TABLE IF EXISTS Chars;

--DECLARE @input VARCHAR(50) = 'sdgfhsdgfhs@121313131';
--DECLARE @t INT = 1;

--CREATE TABLE Chars (Character CHAR(1));

--WHILE @t <= LEN(@input)
--BEGIN 
--    INSERT INTO Chars (Character)
--    VALUES (SUBSTRING(@input, @t, 1));
--    SET @t += 1;
--END;

--SELECT * FROM Chars;

--------------------------------------------------------------------------------
--3. Write a SQL query that reports the device that is first logged in for 
--		each player.(Activity)

--SELECT * FROM Activity;

-----------------------------------
--SELECT a.player_id,
--       a.device_id
--FROM Activity a
--WHERE a.event_date = (
--    SELECT MIN(b.event_date)
--    FROM Activity b
--    WHERE b.player_id = a.player_id
--);

--------------------------------------------------------------------------------
--4.Write a SQL query to separate the integer values and the character values 
--		into two different columns.(rtcfvty34redt)

--DECLARE @input VARCHAR(100) = 'rtcfvty34redt'
--DECLARE @Characters VARCHAR(100)= '',
--		@Numbers VARCHAR(100)= ''

--DECLARE @t INT = 0
--WHILE @t< LEN(@input)
--BEGIN
--	IF ASCII(SUBSTRING(@input, @t+1, 1)) BETWEEN 48 AND 57
--	SET @Numbers += SUBSTRING(@input, @t+1, 1)
--	ELSE 
--	SET @Characters += SUBSTRING(@input, @t+1, 1)
--	SET @t+= 1
--END

--SELECT @input [input]
--SELECT @Numbers Numbers;
--SELECT @Characters Characters;

