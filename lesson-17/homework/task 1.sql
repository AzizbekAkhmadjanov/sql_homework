
--CREATE DATABASE HOMETASK17;
--GO
--USE HOMETASK17;

--------------------------------------------------------------------------------
--1. You must provide a report of all distributors and their sales by region. 
--	If a distributor did not have any sales for a region, rovide a zero-dollar 
--		value for that day. Assume there is at least one sale for each region

--DROP TABLE IF EXISTS RegionSales;
--GO
--CREATE TABLE RegionSales (
--  Region      VARCHAR(100),
--  Distributor VARCHAR(100),
--  Sales       INTEGER NOT NULL,
--  PRIMARY KEY (Region, Distributor)
--);
--GO
--INSERT INTO RegionSales (Region, Distributor, Sales) VALUES
--('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
--('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
--('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);	

-----------------------------------
--SELECT * FROM RegionSales;

-----------------------------------
--SELECT DISTINCT Region FROM RegionSales;
--SELECT DISTINCT Distributor FROM RegionSales;

-----------------------------------
--WITH CTE1 AS 
--			(
--			SELECT DISTINCT Region FROM RegionSales
--			),
--CTE2 AS
--			(
--			SELECT DISTINCT Distributor FROM RegionSales
--			)
----SELECT * FROM CTE1;
--SELECT * FROM CTE2;

-----------------------------------
--WITH CTE1 AS 
--			(
--			SELECT DISTINCT Region FROM RegionSales
--			),
--CTE2 AS
--			(
--			SELECT DISTINCT Distributor FROM RegionSales
--			),
--CTE3 AS
--			(
--			SELECT * 
--			FROM CTE1 CROSS JOIN CTE2
--			)
--SELECT * FROM CTE3;
-----------------------------------
--WITH CTE1 AS 
--			(
--			SELECT DISTINCT Region FROM RegionSales
--			),
--CTE2 AS
--			(
--			SELECT DISTINCT Distributor FROM RegionSales
--			),
--CTE3 AS
--			(
--			SELECT * 
--			FROM CTE1 CROSS JOIN CTE2
--			)
--SELECT * 
--FROM CTE3 LEFT JOIN RegionSales
--		ON CTE3.Region= RegionSales.Region AND CTE3.Distributor= RegionSales.Distributor;

-----------------------------------
--WITH CTE1 AS 
--			(
--			SELECT DISTINCT Region FROM RegionSales
--			),
--CTE2 AS
--			(
--			SELECT DISTINCT Distributor FROM RegionSales
--			),
--CTE3 AS
--			(
--			SELECT * 
--			FROM CTE1 CROSS JOIN CTE2
--			)
--SELECT CTE3.*, ISNULL(RegionSales.Sales, 0) Sales
--FROM CTE3 LEFT JOIN RegionSales
--		ON CTE3.Region= RegionSales.Region AND CTE3.Distributor= RegionSales.Distributor;

--------------------------------------------------------------------------------
--2. Find managers with at least five direct reports

--DROP TABLE IF EXISTS Employee;
--CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);
--TRUNCATE TABLE Employee;
--INSERT INTO Employee VALUES
--(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
--(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);

-----------------------------------
--SELECT * FROM Employee;

-----------------------------------
--SELECT * FROM Employee emps
--INNER JOIN Employee mangs
--		ON emps.managerId= mangs.id

-----------------------------------
--WITH CTE AS
--			(
--			SELECT mangs.id manager_id,
--					mangs.[name] manager_name,
--					emps.[name] employee_name,
--					emps.id employee_id
--			FROM Employee emps
--			INNER JOIN Employee mangs
--					ON emps.managerId= mangs.id
--			)
--SELECT * FROM CTE;

-----------------------------------
--WITH CTE AS
--			(
--			SELECT mangs.id manager_id,
--					mangs.[name] manager_name,
--					emps.[name] employee_name,
--					emps.id employee_id
--			FROM Employee emps
--			INNER JOIN Employee mangs
--					ON emps.managerId= mangs.id
--			)
--SELECT manager_id, 
--		manager_name, 
--		COUNT(employee_id) [number of employees]
--FROM CTE
--GROUP BY manager_id, manager_name
--HAVING COUNT(employee_id)>=5;

--------------------------------------------------------------------------------
--3. Write a solution to get the names of products that have at least 100 
--		units ordered in February 2020 and their amount.

--DROP TABLE IF EXISTS Products;
--DROP TABLE IF EXISTS Orders;

--CREATE TABLE Products (product_id INT, product_name VARCHAR(40), product_category VARCHAR(40));
--CREATE TABLE Orders (product_id INT, order_date DATE, unit INT);
--TRUNCATE TABLE Products;
--INSERT INTO Products VALUES
--(1, 'Leetcode Solutions', 'Book'),
--(2, 'Jewels of Stringology', 'Book'),
--(3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');
--TRUNCATE TABLE Orders;
--INSERT INTO Orders VALUES
--(1,'2020-02-05',60),(1,'2020-02-10',70),
--(2,'2020-01-18',30),(2,'2020-02-11',80),
--(3,'2020-02-17',2),(3,'2020-02-24',3),
--(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
--(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);

-----------------------------------
--SELECT * FROM Products;
--SELECT * FROM Orders;

-----------------------------------
--SELECT * FROM Orders
--WHERE YEAR(order_date)= 2020 AND MONTH(order_date)= 2;

-----------------------------------
--SELECT product_id, 
--		SUM(unit) total_units 
--FROM Orders
--WHERE YEAR(order_date)= 2020 AND MONTH(order_date)= 2
--GROUP BY product_id
--HAVING SUM(unit)>= 100;

-----------------------------------
--WITH CTE AS
--			(
--			SELECT product_id, 
--					SUM(unit) total_units 
--			FROM Orders
--			WHERE YEAR(order_date)= 2020 AND MONTH(order_date)= 2
--			GROUP BY product_id
--			HAVING SUM(unit)>= 100
--			)
--SELECT * FROM CTE;

-----------------------------------
--WITH CTE AS
--			(
--			SELECT product_id, 
--					SUM(unit) total_units 
--			FROM Orders
--			WHERE YEAR(order_date)= 2020 AND MONTH(order_date)= 2
--			GROUP BY product_id
--			HAVING SUM(unit)>= 100
--			)
--SELECT pr.product_name,
--		CTE.total_units
--FROM CTE
--INNER JOIN Products pr
--		ON CTE.product_id= pr.product_id;

--------------------------------------------------------------------------------
--4. Write an SQL statement that returns the vendor from which each customer 
--		has placed the most orders

--DROP TABLE IF EXISTS Orders;
--GO
--CREATE TABLE Orders (
--  OrderID    INTEGER PRIMARY KEY,
--  CustomerID INTEGER NOT NULL,
--  [Count]    MONEY NOT NULL,
--  Vendor     VARCHAR(100) NOT NULL
--);
--INSERT INTO Orders VALUES
--(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
--(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');

-----------------------------------
--SELECT * FROM Orders;

-----------------------------------
--SELECT CustomerID, 
--		Vendor, 
--		SUM([Count]) total
--FROM Orders
--GROUP BY CustomerID, Vendor;

-----------------------------------
--WITH CTE AS
--			(
--			SELECT CustomerID, 
--					Vendor, 
--					SUM([Count]) total
--			FROM Orders
--			GROUP BY CustomerID, Vendor
--			)
--SELECT * FROM CTE;

-----------------------------------
--WITH CTE AS
--			(
--			SELECT CustomerID, 
--					Vendor, 
--					SUM([Count]) total
--			FROM Orders
--			GROUP BY CustomerID, Vendor
--			),
--CTE1 AS
--			(
--			SELECT CustomerID, MAX(total) max_total
--			FROM CTE
--			GROUP BY CustomerID
--			),
--CTE2 AS
--			(
--			SELECT CTE1.CustomerID, 
--					CTE.VENDOR 
--			FROM CTE1 
--			INNER JOIN CTE 
--					ON CTE1.CustomerID= CTE.CustomerID AND CTE1.max_total= CTE.total
--			)		
--SELECT * FROM CTE2
--ORDER BY CustomerID;

--------------------------------------------------------------------------------
--5. You will be given a number as a variable called @Check_Prime check if this 
--		number is prime then return 'This number is prime' 
--			else eturn 'This number is not prime'

--DECLARE @Check_Prime INT = 24;
--SELECT @Check_Prime;

-----------------------------------
--DECLARE @Check_Prime INT = 24;

--SELECT 1 AS ord, @Check_Prime AS INPUT, 1 AS num, @Check_Prime%1 AS qoldiq

-----------------------------------
--DECLARE @Check_Prime INT = 24;
--DECLARE @check_upto INT = SQRT(@Check_Prime)+1;
--DECLARE @n INT =5

--SELECT IIF(@Check_Prime % @n!=0, 1, 0)

-----------------------------------
--DECLARE @Check_Prime INT = 24;
--DECLARE @check_upto INT = SQRT(@Check_Prime)+1;
--DECLARE @n INT =9;

--WITH CTE AS
--			(
--			SELECT @Check_Prime AS input, @n num, IIF(@Check_Prime % @n!=0, 0, 1) [statement]
--			)
--SELECT * FROM CTE;

-----------------------------------
--DECLARE @Check_Prime INT = 24;
--DECLARE @check_upto INT = SQRT(@Check_Prime)+1;
--DECLARE @n INT =1;

--WITH CTE AS
--			(
--			SELECT @Check_Prime AS input, @n num, IIF(@Check_Prime % @n!=0, 0, 1) [statement]
--			UNION ALL
--			SELECT @Check_Prime, num+1, IIF(@Check_Prime % (num+1)!=0, 0, 1) FROM CTE
--			WHERE num< @check_upto
--			)
--SELECT * FROM CTE;

-----------------------------------
--DECLARE @Check_Prime INT = 21;
--DECLARE @n INT =1;

--WITH CTE AS
--			(
--			SELECT @Check_Prime AS input, @n num, IIF(@Check_Prime % @n!=0, 0, 1) [statement]
--			UNION ALL
--			SELECT @Check_Prime, num+1, IIF(@Check_Prime % (num+1)!=0, 0, 1) FROM CTE
--			WHERE num< @Check_Prime
--			),
--CTE1 AS
--(
--SELECT IIF(SUM([Statement])= 2, 'This number is prime', 'This number is not prime') AS [output] FROM CTE
--)
--SELECT * FROM CTE1;

-----------------------------------
--DECLARE @Check_Prime INT = 2;
--DECLARE @n INT =2;
--DECLARE @check_upto INT = FLOOR(SQRT(@Check_Prime));

--WITH CTE AS
--			(
--			SELECT @Check_Prime AS input, @n num, IIF(@Check_Prime % @n!=0, 0, 1) [statement]
--			UNION ALL
--			SELECT @Check_Prime, num+1, IIF(@Check_Prime % (num+1)!=0, 0, 1) FROM CTE
--			WHERE num< @check_upto
--			),
--CTE1 AS
--			(
--			SELECT IIF(SUM([Statement])= 0, 'This number is prime', 'This number is not prime') AS [output] FROM CTE
--			)
--SELECT CASE WHEN @Check_Prime<=1 THEN 'This number is not prime'
--			WHEN @Check_Prime=2 THEN 'This number is prime'
--			WHEN @Check_Prime>2 THEN (SELECT * FROM CTE1)
--			ELSE 'This is not a number'
--			END AS [statement]

--------------------------------------------------------------------------------
--6. Write an SQL query to return the number of locations,in which location 
--	most signals sent, and total number of signal for each device from the 
--		given table.

--DROP TABLE IF EXISTS Device;
--GO
--CREATE TABLE Device(
--  Device_id INT,
--  Locations VARCHAR(25)
--);
--INSERT INTO Device VALUES
--(12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'),
--(12,'Hosur'), (12,'Hosur'),
--(13,'Hyderabad'), (13,'Hyderabad'), (13,'Secunderabad'),
--(13,'Secunderabad'), (13,'Secunderabad');

-----------------------------------
-- Write an SQL query to return the number of locations, the location with the
-- most signals, and the total number of signals for each device.
-- Note: All metrics are calculated PER DEVICE, as implied by the expected output.

--WITH DeviceTotals AS (
--    -- CTE 1: Calculates two final metrics (Total Signals and Total Unique Locations) for each device.
--    SELECT
--        Device_id,
--        COUNT(*) AS TotalSignals,
--        COUNT(DISTINCT Locations) AS TotalUniqueLocations
--    FROM
--        Device
--    GROUP BY
--        Device_id
--),
--LocationCounts AS (
--    -- CTE 2: Calculates the signal count for every (Device, Location) pair.
--    SELECT
--        Device_id,
--        Locations,
--        COUNT(*) AS SignalCount,
--        -- Ranks the locations within each device group based on signal count (descending).
--        ROW_NUMBER() OVER (
--            PARTITION BY Device_id
--            ORDER BY COUNT(*) DESC, Locations ASC -- Order by count descending, then by location name for tie-breaking
--        ) AS LocationRank
--    FROM
--        Device
--    GROUP BY
--        Device_id,
--        Locations
--)
---- Final Select: Join the device totals (metrics 1 and 3) with the top location (metric 2).
--SELECT
--    DT.Device_id,
--    DT.TotalUniqueLocations AS no_of_location,
--    LC.Locations AS max_signal_location,
--    DT.TotalSignals AS no_of_signals
--FROM
--    DeviceTotals DT
--INNER JOIN
--    LocationCounts LC
--    ON DT.Device_id = LC.Device_id
--WHERE
--    -- Filter to include only the location with the highest signal count (Rank 1)
--    LC.LocationRank = 1
--ORDER BY
--    DT.Device_id;


--------------------------------------------------------------------------------
--7. Write a SQL to find all Employees who earn more than the average salary in 
--	their corresponding department. Return EmpID, EmpName,Salary in your output

--DROP TABLE IF EXISTS Employee;
--GO
--CREATE TABLE Employee (
--  EmpID INT,
--  EmpName VARCHAR(30),
--  Salary FLOAT,
--  DeptID INT
--);
--INSERT INTO Employee VALUES
--(1001,'Mark',60000,2), (1002,'Antony',40000,2), (1003,'Andrew',15000,1),
--(1004,'Peter',35000,1), (1005,'John',55000,1), (1006,'Albert',25000,3), (1007,'Donald',35000,3);

-----------------------------------
--SELECT * FROM Employee;

-----------------------------------
--SELECT DeptID, AVG(Salary) average_salary_per_dep
--FROM Employee
--GROUP BY DeptID;

-----------------------------------
--WITH CTE AS
--			(
--			SELECT DeptID, AVG(Salary) average_salary_per_dep
--			FROM Employee
--			GROUP BY DeptID
--			)
--SELECT * FROM CTE;

-----------------------------------
--WITH CTE AS
--			(
--			SELECT DeptID, AVG(Salary) average_salary_per_dep
--			FROM Employee
--			GROUP BY DeptID
--			)
--SELECT * FROM CTE 
--INNER JOIN Employee emps
--		ON CTE.DeptID= emps.DeptID

-----------------------------------
--WITH CTE AS
--			(
--			SELECT DeptID, AVG(Salary) average_salary_per_dep
--			FROM Employee
--			GROUP BY DeptID
--			),
--CTE1 AS
--			(
--			SELECT emps.*, CTE.average_salary_per_dep FROM CTE 
--			INNER JOIN Employee emps
--					ON CTE.DeptID= emps.DeptID
--			)
--SELECT * FROM CTE1;

-----------------------------------
--WITH CTE AS
--			(
--			SELECT DeptID, AVG(Salary) average_salary_per_dep
--			FROM Employee
--			GROUP BY DeptID
--			),
--CTE1 AS
--			(
--			SELECT emps.*, CTE.average_salary_per_dep FROM CTE 
--			INNER JOIN Employee emps
--					ON CTE.DeptID= emps.DeptID
--			)
--SELECT CTE1.EmpID, CTE1.EmpName, CTE1.Salary FROM CTE1
--WHERE Salary>average_salary_per_dep;

--------------------------------------------------------------------------------
--8. You are part of an office lottery pool where you keep a table of the winning 
--lottery numbers along with a table of each ticket’s chosen numbers. If a ticket 
--has some but not all the winning numbers, you win $10. If a ticket has all the 
--winning numbers, you win $100. Calculate the total winnings for today’s drawing.

---- Step 1: Create the table
--DROP TABLE IF EXISTS Numbers;
--GO
--CREATE TABLE Numbers (
--    Number INT
--);

---- Step 2: Insert values into the table
--INSERT INTO Numbers (Number)
--VALUES
--(25),
--(45),
--(78);


---- Step 1: Create the Tickets table
--CREATE TABLE Tickets (
--    TicketID VARCHAR(10),
--    Number INT
--);

---- Step 2: Insert the data into the table
--INSERT INTO Tickets (TicketID, Number)
--VALUES
--('A23423', 25),
--('A23423', 45),
--('A23423', 78),
--('B35643', 25),
--('B35643', 45),
--('B35643', 98),
--('C98787', 67),
--('C98787', 86),
--('C98787', 91);
-----------------------------------
-- Calculate the total winnings based on the following rules:
-- $100 for tickets with ALL winning numbers.
-- $10 for tickets with SOME (but not all) winning numbers.
-- $0 for tickets with NO winning numbers.

--WITH MatchedTickets AS (
--    -- 1. Determine the number of matches and the total winning numbers count (T_WIN)
--    SELECT
--        T.TicketID,
--        -- Count the number of matches between the ticket and the winning numbers
--        COUNT(N.Number) AS MatchedCount,
--        -- Scalar subquery to get the total count of winning numbers (T_WIN = 3)
--        (SELECT COUNT(Number) FROM Numbers) AS TotalWinningNumbers
--    FROM
--        Tickets T
--    -- INNER JOIN ensures we only consider numbers that are actually winners
--    INNER JOIN
--        Numbers N ON T.Number = N.Number
--    GROUP BY
--        T.TicketID
--),
--TicketPrizes AS (
--    -- 2. Assign the prize money to each ticket based on the match count
--    SELECT
--        TicketID,
--        MatchedCount,
--        CASE
--            -- Case 1: All winning numbers match (3 out of 3)
--            WHEN MatchedCount = TotalWinningNumbers THEN 100
--            -- Case 2: Some winning numbers match (1 or 2 out of 3).
--            -- Since the base query uses INNER JOIN, MatchedCount must be > 0 here.
--            WHEN MatchedCount > 0 THEN 10
--            -- Tickets with 0 matches are excluded by the INNER JOIN, 
--            -- but the SUM() later must account for them (implicitly 0).
--            ELSE 0 
--        END AS Prize
--    FROM
--        MatchedTickets
--)
---- 3. Calculate the total winnings for all tickets.
---- We use LEFT JOIN to include tickets with 0 matches (which were filtered out by the INNER JOIN)
---- or we can simply initialize the sum and add the prizes from TicketPrizes.
--SELECT
--    -- We sum the prizes and use COALESCE(SUM(Prize), 0) to ensure a total of 0 if no tickets won anything.
--    COALESCE(SUM(TP.Prize), 0) + 
--    -- We must also account for tickets that had ZERO matches, which are excluded from the CTE. 
--    -- Since they win $0, we can simply sum the prizes of the winning tickets.
--    0 AS TotalWinnings
--FROM 
--    TicketPrizes TP;

--------------------------------------------------------------------------------
--9. The Spending table keeps the logs of the spendings history of users that 
--make purchases from an online shopping website which has a desktop and a mobile 
--devices.
--Write an SQL query to find the total number of users and the total amount spent 
--using mobile only, desktop only and both mobile and desktop together for each date.

--DROP TABLE IF EXISTS Spending;
--GO
--CREATE TABLE Spending (
--  User_id INT,
--  Spend_date DATE,
--  Platform VARCHAR(10),
--  Amount INT
--);
--INSERT INTO Spending VALUES
--(1,'2019-07-01','Mobile',100),
--(1,'2019-07-01','Desktop',100),
--(2,'2019-07-01','Mobile',100),
--(2,'2019-07-02','Mobile',100),
--(3,'2019-07-01','Desktop',100),
--(3,'2019-07-02','Desktop',100);

-----------------------------------
--SELECT 
--    Spend_date,
--    Platform,
--    Total_Amount,
--    Total_users
--FROM 
--(
--    -- 1. Query for Mobile and Desktop Platforms: 
--    SELECT
--        Spend_date,
--        Platform,
--        SUM(Amount) AS Total_Amount,
--        COUNT(DISTINCT User_id) AS Total_users,
--        -- Helper column for custom sorting (Mobile=1, Desktop=2)
--        CASE Platform WHEN 'Mobile' THEN 1 WHEN 'Desktop' THEN 2 END AS Platform_Order
--    FROM
--        Spending
--    WHERE 
--        Platform IN ('Mobile', 'Desktop')
--    GROUP BY
--        Spend_date,
--        Platform

--    UNION ALL

--    -- 2. Query for the 'Both' Platform (Total Daily Aggregation): 
--    SELECT
--        Spend_date,
--        'Both' AS Platform,
--        SUM(Amount) AS Total_Amount,
--        COUNT(DISTINCT User_id) AS Total_users,
--        -- Helper column for custom sorting (Both=3)
--        3 AS Platform_Order
--    FROM
--        Spending
--    GROUP BY
--        Spend_date
--) AS CombinedResults
--ORDER BY
--    Spend_date,
--    Platform_Order; -- Now ordering by the helper column, which is explicitly in the inner SELECT list.

--------------------------------------------------------------------------------
--10. Write an SQL Statement to de-group the following data.

--DROP TABLE IF EXISTS Grouped;
--CREATE TABLE Grouped
--(
--  Product  VARCHAR(100) PRIMARY KEY,
--  Quantity INTEGER NOT NULL
--);
--INSERT INTO Grouped (Product, Quantity) VALUES
--('Pencil', 3), ('Eraser', 4), ('Notebook', 2);

-----------------------------------
--WITH RecursiveDeGrouping AS (
--    -- 1. ANCHOR MEMBER: Start the counter (n=1)
--    SELECT
--        Product,
--        Quantity,
--        1 AS n  -- Current count/iteration number
--    FROM
--        Grouped
    
--    UNION ALL
    
--    -- 2. RECURSIVE MEMBER: Generate the next row for the same product
--    SELECT
--        Product,
--        Quantity,
--        n + 1   -- Increment the counter
--    FROM
--        RecursiveDeGrouping
--    -- 3. TERMINATION: Stop when the counter reaches the original Quantity
--    WHERE
--        n < Quantity
--)
---- 4. FINAL SELECTION: Output the Product and the constant value 1 for Quantity
--SELECT
--    Product,
--    1 AS Quantity -- Set Quantity to 1 for every generated row
--FROM
--    RecursiveDeGrouping
--ORDER BY
--    Product;

--------------------------------------------------------------------------------
