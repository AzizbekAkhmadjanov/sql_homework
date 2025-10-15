

--CREATE DATABASE HOMETASK16;
--GO
--USE HOMETASK16;

--------------------------------------------------------------------------------
--CREATE TABLE Numbers1(Number INT)

--INSERT INTO Numbers1 VALUES (5),(9),(8),(6),(7)

--CREATE TABLE FindSameCharacters
--(
--     Id INT
--    ,Vals VARCHAR(10)
--)
 
--INSERT INTO FindSameCharacters VALUES
--(1,'aa'),
--(2,'cccc'),
--(3,'abc'),
--(4,'aabc'),
--(5,NULL),
--(6,'a'),
--(7,'zzz'),
--(8,'abc')



--CREATE TABLE RemoveDuplicateIntsFromNames
--(
--      PawanName INT
--    , Pawan_slug_name VARCHAR(1000)
--)
 
 
--INSERT INTO RemoveDuplicateIntsFromNames VALUES
--(1,  'PawanA-111'  ),
--(2, 'PawanB-123'   ),
--(3, 'PawanB-32'    ),
--(4, 'PawanC-4444' ),
--(5, 'PawanD-3'  )





--CREATE TABLE Example
--(
--Id       INTEGER IDENTITY(1,1) PRIMARY KEY,
--String VARCHAR(30) NOT NULL
--);


--INSERT INTO Example VALUES('123456789'),('abcdefghi');


--CREATE TABLE Employees (
--    EmployeeID INT PRIMARY KEY,
--    DepartmentID INT,
--    FirstName VARCHAR(50),
--    LastName VARCHAR(50),
--    Salary DECIMAL(10, 2)
--);

--INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
--(1, 1, 'John', 'Doe', 60000.00),
--(2, 1, 'Jane', 'Smith', 65000.00),
--(3, 2, 'James', 'Brown', 70000.00),
--(4, 3, 'Mary', 'Johnson', 75000.00),
--(5, 4, 'Linda', 'Williams', 80000.00),
--(6, 2, 'Michael', 'Jones', 85000.00),
--(7, 1, 'Robert', 'Miller', 55000.00),
--(8, 3, 'Patricia', 'Davis', 72000.00),
--(9, 4, 'Jennifer', 'García', 77000.00),
--(10, 1, 'William', 'Martínez', 69000.00);

--CREATE TABLE Departments (
--    DepartmentID INT PRIMARY KEY,
--    DepartmentName VARCHAR(50)
--);

--INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
--(1, 'HR'),
--(2, 'Sales'),
--(3, 'Marketing'),
--(4, 'Finance'),
--(5, 'IT'),
--(6, 'Operations'),
--(7, 'Customer Service'),
--(8, 'R&D'),
--(9, 'Legal'),
--(10, 'Logistics');

--CREATE TABLE Sales (
--    SalesID INT PRIMARY KEY,
--    EmployeeID INT,
--    ProductID INT,
--    SalesAmount DECIMAL(10, 2),
--    SaleDate DATE
--);
--INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
---- January 2025
--(1, 1, 1, 1550.00, '2025-01-02'),
--(2, 2, 2, 2050.00, '2025-01-04'),
--(3, 3, 3, 1250.00, '2025-01-06'),
--(4, 4, 4, 1850.00, '2025-01-08'),
--(5, 5, 5, 2250.00, '2025-01-10'),
--(6, 6, 6, 1450.00, '2025-01-12'),
--(7, 7, 1, 2550.00, '2025-01-14'),
--(8, 8, 2, 1750.00, '2025-01-16'),
--(9, 9, 3, 1650.00, '2025-01-18'),
--(10, 10, 4, 1950.00, '2025-01-20'),
--(11, 1, 5, 2150.00, '2025-02-01'),
--(12, 2, 6, 1350.00, '2025-02-03'),
--(13, 3, 1, 2050.00, '2025-02-05'),
--(14, 4, 2, 1850.00, '2025-02-07'),
--(15, 5, 3, 1550.00, '2025-02-09'),
--(16, 6, 4, 2250.00, '2025-02-11'),
--(17, 7, 5, 1750.00, '2025-02-13'),
--(18, 8, 6, 1650.00, '2025-02-15'),
--(19, 9, 1, 2550.00, '2025-02-17'),
--(20, 10, 2, 1850.00, '2025-02-19'),
--(21, 1, 3, 1450.00, '2025-03-02'),
--(22, 2, 4, 1950.00, '2025-03-05'),
--(23, 3, 5, 2150.00, '2025-03-08'),
--(24, 4, 6, 1700.00, '2025-03-11'),
--(25, 5, 1, 1600.00, '2025-03-14'),
--(26, 6, 2, 2050.00, '2025-03-17'),
--(27, 7, 3, 2250.00, '2025-03-20'),
--(28, 8, 4, 1350.00, '2025-03-23'),
--(29, 9, 5, 2550.00, '2025-03-26'),
--(30, 10, 6, 1850.00, '2025-03-29'),
--(31, 1, 1, 2150.00, '2025-04-02'),
--(32, 2, 2, 1750.00, '2025-04-05'),
--(33, 3, 3, 1650.00, '2025-04-08'),
--(34, 4, 4, 1950.00, '2025-04-11'),
--(35, 5, 5, 2050.00, '2025-04-14'),
--(36, 6, 6, 2250.00, '2025-04-17'),
--(37, 7, 1, 2350.00, '2025-04-20'),
--(38, 8, 2, 1800.00, '2025-04-23'),
--(39, 9, 3, 1700.00, '2025-04-26'),
--(40, 10, 4, 2000.00, '2025-04-29'),
--(41, 1, 5, 2200.00, '2025-05-03'),
--(42, 2, 6, 1650.00, '2025-05-07'),
--(43, 3, 1, 2250.00, '2025-05-11'),
--(44, 4, 2, 1800.00, '2025-05-15'),
--(45, 5, 3, 1900.00, '2025-05-19'),
--(46, 6, 4, 2000.00, '2025-05-23'),
--(47, 7, 5, 2400.00, '2025-05-27'),
--(48, 8, 6, 2450.00, '2025-05-31'),
--(49, 9, 1, 2600.00, '2025-06-04'),
--(50, 10, 2, 2050.00, '2025-06-08'),
--(51, 1, 3, 1550.00, '2025-06-12'),
--(52, 2, 4, 1850.00, '2025-06-16'),
--(53, 3, 5, 1950.00, '2025-06-20'),
--(54, 4, 6, 1900.00, '2025-06-24'),
--(55, 5, 1, 2000.00, '2025-07-01'),
--(56, 6, 2, 2100.00, '2025-07-05'),
--(57, 7, 3, 2200.00, '2025-07-09'),
--(58, 8, 4, 2300.00, '2025-07-13'),
--(59, 9, 5, 2350.00, '2025-07-17'),
--(60, 10, 6, 2450.00, '2025-08-01');

--CREATE TABLE Products (
--    ProductID INT PRIMARY KEY,
--    CategoryID INT,
--    ProductName VARCHAR(100),
--    Price DECIMAL(10, 2)
--);

--INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES
--(1, 1, 'Laptop', 1000.00),
--(2, 1, 'Smartphone', 800.00),
--(3, 2, 'Tablet', 500.00),
--(4, 2, 'Monitor', 300.00),
--(5, 3, 'Headphones', 150.00),
--(6, 3, 'Mouse', 25.00),
--(7, 4, 'Keyboard', 50.00),
--(8, 4, 'Speaker', 200.00),
--(9, 5, 'Smartwatch', 250.00),
--(10, 5, 'Camera', 700.00);

--------------------------------------------------------------------------------
----Easy Tasks
----1. Create a numbers table using a recursive query from 1 to 1000.
--WITH numbers AS
--		(
--		SELECT 1 AS NUM
--		UNION ALL
--		SELECT NUM+1 FROM numbers
--		WHERE NUM+1<=1000
--		)
--SELECT * FROM numbers OPTION (MAXRECURSION 0);

--------------------------------------------------------------------------------
--2. Write a query to find the total sales per employee using a derived table.
--	(Sales, Employees)

--SELECT * FROM Sales;
--SELECT * FROM Employees;

-----------------------------------
--SELECT emps.*, 
--		DS.[total sales per employee] 
--FROM Employees emps
--INNER JOIN 
--		(SELECT EmployeeID, 
--				SUM(SalesAmount) AS [total sales per employee]
--		FROM Sales
--		GROUP BY EmployeeID
--		) AS DS											--'Derived Sales' table
--		ON emps.EmployeeID = DS.EmployeeID;

--------------------------------------------------------------------------------
----3. Create a CTE to find the average salary of employees.(Employees)

----SELECT * FROM Employees;

-------------------------------------
--WITH AverageSalary AS
--(
--SELECT AVG(Salary) [average salary] 
--FROM Employees
--)
--SELECT * FROM AverageSalary;

--------------------------------------------------------------------------------
--4. Write a query using a derived table to find the highest sales for 
--		each product.(Sales, Products)

--SELECT * FROM Sales;
--SELECT * FROM Products;

-----------------------------------
--SELECT pr.*, DS.[highest sales]
--FROM Products pr
--INNER JOIN
--		(SELECT ProductID, MAX(SalesAmount) [highest sales]
--		FROM Sales
--		GROUP BY ProductID) DS 
--		ON pr.ProductID= DS.ProductID

--------------------------------------------------------------------------------
--5. Beginning at 1, write a statement to double the number for each record, 
--		the max value you get should be less than 1000000.

--WITH output AS 
--			(
--			SELECT 1 AS number
--			UNION ALL
--			SELECT number*2 FROM output
--			WHERE number*2< 1000000
--			)
--SELECT * FROM output OPTION (MAXRECURSION 0);

--------------------------------------------------------------------------------
--6. Use a CTE to get the names of employees who have made more than 5 sales.
--		(Sales, Employees)

--SELECT * FROM Sales;
--SELECT * FROM Employees;

-----------------------------------
--WITH [Sales over than 5] AS
--				(
--				SELECT EmployeeID, COUNT(SalesID) number_of_sales 
--				FROM Sales 
--				GROUP BY EmployeeID
--				HAVING COUNT(SalesID)> 5)				
--SELECT CONCAT(emps.FirstName, ' ', emps.LastName) [FullName], Sot5.number_of_sales
--FROM [Sales over than 5] Sot5
--INNER JOIN Employees emps
--		ON Sot5.EmployeeID= emps.EmployeeID;

--------------------------------------------------------------------------------
--7. Write a query using a CTE to find all products with sales greater than $500.
--			(Sales, Products)

--SELECT * FROM Sales;
--SELECT * FROM Products;

-----------------------------------1st view: for total Sales Amount, ProductIDs will not be dublicate
--WITH TotalSalesOver500 AS 
				--(
				--SELECT ProductID, 
				--		SUM(SalesAmount) [total amount] 
				--FROM Sales
				--GROUP BY ProductID
				--HAVING SUM(SalesAmount)> 500
				--)
--SELECT tso500.ProductID, 
--			pr.ProductName, 
--			tso500.[total amount] 
--FROM TotalSalesOver500 tso500 
--INNER JOIN Products pr 
--			ON tso500.ProductID= pr.ProductID;

-----------------------------------2nd view: Individual SalesAmount is over than 500, ProductID could be dublicate
--WITH SalesOver500 AS 
--								(
--								SELECT ProductID, 
--										SalesAmount  
--								FROM Sales
--								WHERE SalesAmount> 500
--								)
--SELECT so500.ProductID, 
--			pr.ProductName, 
--			so500.SalesAmount 
--FROM SalesOver500 so500 
--INNER JOIN Products pr 
--			ON so500.ProductID= pr.ProductID;

--------------------------------------------------------------------------------
--8. Create a CTE to find employees with salaries above the average salary.
--		(Employees)

--SELECT * FROM Employees;

-----------------------------------
--WITH AverageSalary AS
--				(
--				SELECT AVG(Salary) AS avg_salary FROM Employees
--				),
--EmpsAboveAverageSalary AS
--				(
--				SELECT * FROM Employees
--				WHERE Salary> (SELECT avg_salary FROM AverageSalary)
--				)
--SELECT * FROM EmpsAboveAverageSalary;

--------------------------------------------------------------------------------
--Medium Tasks
--1. Write a query using a derived table to find the top 5 employees by the 
--		number of orders made.(Employees, Sales)

--SELECT * FROM Employees;
--SELECT * FROM Sales;

-----------------------------------
--SELECT CONCAT(emps.FirstName, ' ', emps.LastName) AS FullName,
--			top5sales.*
--FROM 
--			(
--			SELECT TOP 5 EmployeeID, COUNT(SalesID) [number of orders]
--			FROM Sales 
--			GROUP BY EmployeeID
--			ORDER BY [number of orders] DESC
--			) AS top5sales
--INNER JOIN Employees emps 
--	ON top5sales.EmployeeID= emps.EmployeeID

--------------------------------------------------------------------------------
--2. Write a query using a derived table to find the sales per product category.
--		(Sales, Products)

--SELECT * FROM Sales;
--SELECT * FROM Products;

-----------------------------------
--SELECT CategoryID, 
--		COUNT(joinedtable.SalesID) [number of sales] 
--FROM 
--				(
--				SELECT ProdProdIDCatID.CategoryID, Sales.* FROM 
--							(
--							SELECT ProductID, CategoryID FROM Products
--							) ProdProdIDCatID
--				INNER JOIN Sales 
--						ON ProdProdIDCatID.ProductID= Sales.ProductID
--				) AS joinedtable
--GROUP BY CategoryID;

-----------------------------------
--SELECT CategoryID, 
--		COUNT(SalesID) [number of sales] 
--FROM
--	(
--	SELECT Sales.SalesID, 
--			Sales.ProductID, 
--			Products.CategoryID
--	FROM Sales 
--	INNER JOIN Products
--			ON Sales.ProductID= Products.ProductID
--	) DT
--GROUP BY CategoryID

--------------------------------------------------------------------------------
--3. Write a script to return the factorial of each value next to it.(Numbers1)

--SELECT * FROM Numbers1;

-----------------------------------
--WITH 
--highest_num AS
--			(
--			SELECT MAX(Number) max_num FROM Numbers1
--			),
--fac AS
--			(
--			SELECT 1 AS [order], 1 AS factorial
--			UNION ALL
--			SELECT [order]+1, factorial*([order]+1) FROM fac
--			WHERE [order]< (SELECT max_num FROM highest_num)
--			)

--SELECT Numbers1.Number, fac.factorial FROM fac
--INNER JOIN Numbers1
--		ON fac.[order]= Numbers1.Number;

--------------------------------------------------------------------------------
--4. This script uses recursion to split a string into rows of substrings for 
--		each character in the string.(Example)

--SELECT * FROM Example;

-----------------------------------
--WITH RecursiveSplit AS
--(
--    -- **ANCHOR MEMBER (Base Case)**: Selects the first character of the string
--    SELECT
--        Id,
--        SUBSTRING(String, 1, 1) AS Character,  -- The first character
--        SUBSTRING(String, 2, LEN(String)) AS RemainingString -- The rest of the string
--    FROM
--        Example
--    WHERE
--        LEN(String) > 0  -- Only process strings that aren't empty

--    UNION ALL

--    -- **RECURSIVE MEMBER**: Processes the remaining string
--    SELECT
--        RS.Id,
--        SUBSTRING(RS.RemainingString, 1, 1) AS Character, -- Gets the next character
--        SUBSTRING(RS.RemainingString, 2, LEN(RS.RemainingString)) AS RemainingString -- Gets the new remainder
--    FROM
--        RecursiveSplit AS RS
--    WHERE
--        LEN(RS.RemainingString) > 0  -- Stops when the string is fully processed
--)
---- **FINAL SELECT**: Retrieves the Id and the extracted character
--SELECT
--    Id,
--    Character
--FROM
--    RecursiveSplit;

--------------------------------------------------------------------------------
--5. Use a CTE to calculate the sales difference between the current month and 
--		the previous month.(Sales)

--SELECT * FROM Sales;

-----------------------------------
--WITH CurrentMonth AS
--(
--    -- Calculates the start of the current month and uses it for filtering
--    SELECT
--        SUM(SalesAmount) AS [total sales amount CM]
--    FROM
--        Sales
--    WHERE
--        SaleDate >= DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0)
--        AND SaleDate < DATEADD(month, DATEDIFF(month, 0, GETDATE()) + 1, 0)
--),
--PreviousMonth AS
--(
--    -- Calculates the sales for the month that ended on the first day of the current month
--    SELECT
--        SUM(SalesAmount) AS [total sales amount PM]
--    FROM
--        Sales
--    WHERE
--        SaleDate >= DATEADD(month, DATEDIFF(month, 0, GETDATE()) - 1, 0) -- Start of last month
--        AND SaleDate < DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0)   -- End of last month
--)

---- Final step: Calculate the difference
--SELECT
--    CM.[total sales amount CM] - PM.[total sales amount PM] AS SalesDifference
--FROM
--    CurrentMonth AS CM,
--    PreviousMonth AS PM; -- Using a cross-join (or comma-separated FROM) to join the two single-row CTEs

--------------------------------------------------------------------------------
--6. Create a derived table to find employees with sales over $45000 in each 
--		quarter.(Sales, Employees)
--SELECT
--    E.FirstName,
--    E.LastName,
--    E.EmployeeID
--FROM
--    Employees AS E
--INNER JOIN
--    (
--        -- Derived Table (QuarterlyPerformance): Aggregates sales by Employee, Year, and Quarter
--        SELECT
--            EmployeeID,
--            -- Grouping by Year and Quarter
--            YEAR(SaleDate) AS SaleYear,
--            DATEPART(qq, SaleDate) AS SaleQuarter,
--            SUM(SalesAmount) AS QuarterlySalesAmount
--        FROM
--            Sales
--        GROUP BY
--            EmployeeID,
--            YEAR(SaleDate),
--            DATEPART(qq, SaleDate)
--    ) AS QuarterlyPerformance
--    ON E.EmployeeID = QuarterlyPerformance.EmployeeID
--GROUP BY
--    E.EmployeeID, E.FirstName, E.LastName
--HAVING
--    -- 1. COUNT the number of quarters the employee *met* the target ($45000)
--    SUM(CASE WHEN QuarterlyPerformance.QuarterlySalesAmount > 45000 THEN 1 ELSE 0 END)
--    =
--    -- 2. Must be equal to the total number of *distinct quarters* the employee had sales
--    COUNT(DISTINCT (QuarterlyPerformance.SaleYear * 10) + QuarterlyPerformance.SaleQuarter);

--------------------------------------------------------------------------------
--Difficult Tasks
--1. This script uses recursion to calculate Fibonacci numbers
--DECLARE @up_to INT = 15;

--			WITH Fibonacci AS 
--			(
--			SELECT 2 AS [order], 1 AS [fibonacci number], 1 [next fibonaci number]
--			UNION ALL
--			SELECT [order]+1, [next fibonaci number], [fibonacci number] + [next fibonaci number] FROM Fibonacci
--			WHERE [order]< @up_to
--			)
--SELECT * FROM Fibonacci;

--------------------------------------------------------------------------------
--2. Find a string where all characters are the same and the length is greater 
--		than 1.(FindSameCharacters)

--SELECT * FROM FindSameCharacters;

-----------------------------------
--SELECT
--    Id,
--    Vals
--FROM
--    FindSameCharacters
--WHERE
    
--    LEN(Vals) > 1

--    AND REPLACE(Vals, SUBSTRING(Vals, 1, 1), '') = '';

--------------------------------------------------------------------------------
--3. Create a numbers table that shows all numbers 1 through n and their order
--	gradually increasing by the next number in the sequence.
--	(Example:n=5 | 1, 12, 123, 1234, 12345)

--DECLARE @n INT =7;
--WITH numbers AS
--			(
--			SELECT 1 AS id, 1 AS num 
--			UNION ALL
--			SELECT id+1, num*10+id+1 FROM numbers
--			WHERE id<@n			
--			)
--SELECT * FROM numbers;

--------------------------------------------------------------------------------
--4. Write a query using a derived table to find the employees who have made the 
--		most sales in the last 6 months.(Employees,Sales)

--WITH RankedHighAchievers AS
--(
--    SELECT
--        RecentSales.EmployeeID,
--        RecentSales.TotalRecentSales,
--        -- Use DENSE_RANK to assign rank, ensuring ties for 1st place are included
--        DENSE_RANK() OVER (ORDER BY RecentSales.TotalRecentSales DESC) AS SalesRank
--    FROM
--        (
--            -- Derived Table: Calculates Total Sales per employee in the last 6 months
--            SELECT
--                EmployeeID,
--                SUM(SalesAmount) AS TotalRecentSales
--            FROM
--                Sales
--            WHERE
--                -- Filter sales records that occurred in the last 6 months
--                SaleDate >= DATEADD(month, -6, GETDATE())
--            GROUP BY
--                EmployeeID
--        ) AS RecentSales -- Alias for the derived table
--)
---- Final Select: Join back to Employees table and filter for the top rank
--SELECT
--    E.FirstName,
--    E.LastName,
--    RHA.TotalRecentSales
--FROM
--    Employees AS E
--INNER JOIN
--    RankedHighAchievers AS RHA
--    ON E.EmployeeID = RHA.EmployeeID
--WHERE
--    RHA.SalesRank = 1; -- Select only the employee(s) who achieved the highest sales

--------------------------------------------------------------------------------
--5. Write a T-SQL query to remove the duplicate integer values present in the 
--string column. Additionally, remove the single integer character that appears
--	in the string.(RemoveDuplicateIntsFromNames)

--WITH SplitData AS
--(
--    SELECT
--        PawanName,
--        Pawan_slug_name,
--        SUBSTRING(Pawan_slug_name, 1, CHARINDEX('-', Pawan_slug_name)) AS TextPart,
--        SUBSTRING(Pawan_slug_name, CHARINDEX('-', Pawan_slug_name) + 1, 1000) AS NumberPart
--    FROM
--        RemoveDuplicateIntsFromNames
--),
--CleanedNumbers AS
--(
--    SELECT
--        PawanName,
--        TextPart,
--        SUBSTRING(NumberPart, 2, 1000) AS RemainingNumber,
--        -- FIX APPLIED HERE: Explicitly cast to VARCHAR(MAX)
--        CAST(SUBSTRING(NumberPart, 1, 1) AS VARCHAR(MAX)) AS CleanedDigits
--    FROM
--        SplitData
--    WHERE
--        LEN(NumberPart) > 0

--    UNION ALL

--    SELECT
--        CN.PawanName,
--        CN.TextPart,
--        SUBSTRING(CN.RemainingNumber, 2, 1000) AS RemainingNumber,
--        CN.CleanedDigits +
--            CASE
--                WHEN SUBSTRING(CN.RemainingNumber, 1, 1) = SUBSTRING(CN.CleanedDigits, LEN(CN.CleanedDigits), 1)
--                THEN ''
--                ELSE SUBSTRING(CN.RemainingNumber, 1, 1)
--            END
--    FROM
--        CleanedNumbers AS CN
--    WHERE
--        LEN(CN.RemainingNumber) > 0
--)
--SELECT
--    SD.PawanName,
--    SD.Pawan_slug_name AS Original_Name,
--    SD.TextPart +
--    CASE
--        WHEN LEN(CN_Final.CleanedDigits) <= 1
--        THEN ''
--        ELSE CN_Final.CleanedDigits
--    END AS Cleaned_Slug_Name
--FROM
--    SplitData AS SD
--INNER JOIN
--    CleanedNumbers AS CN_Final
--    ON SD.PawanName = CN_Final.PawanName
--WHERE
--    LEN(CN_Final.RemainingNumber) = 0
--ORDER BY
--    SD.PawanName
--OPTION (MAXRECURSION 0); 

