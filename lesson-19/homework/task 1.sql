
--CREATE DATABASE HOMETASK19;
--GO
--USE HOMETASK19;

--------------------------------------------------------------------------------
--CREATE TABLE Employees (
--    EmployeeID INT PRIMARY KEY,
--    FirstName NVARCHAR(50),
--    LastName NVARCHAR(50),
--    Department NVARCHAR(50),
--    Salary DECIMAL(10,2)
--);

--CREATE TABLE DepartmentBonus (
--    Department NVARCHAR(50) PRIMARY KEY,
--    BonusPercentage DECIMAL(5,2)
--);

--INSERT INTO Employees VALUES
--(1, 'John', 'Doe', 'Sales', 5000),
--(2, 'Jane', 'Smith', 'Sales', 5200),
--(3, 'Mike', 'Brown', 'IT', 6000),
--(4, 'Anna', 'Taylor', 'HR', 4500);

--INSERT INTO DepartmentBonus VALUES
--('Sales', 10),
--('IT', 15),
--('HR', 8);
--------------------------------------------------------------------------------
--📄 Task 1:

--CREATE PROCEDURE CalculateEmployeeBonus
--AS
--BEGIN
--    -- 1. Create a temporary table #EmployeeBonus
--    CREATE TABLE #EmployeeBonus (
--        EmployeeID INT,
--        FullName NVARCHAR(101),
--        Department NVARCHAR(50),
--        Salary DECIMAL(10,2),
--        BonusAmount DECIMAL(10,2)
--    );

--    -- 2. Insert data into the temporary table
--    INSERT INTO #EmployeeBonus (EmployeeID, FullName, Department, Salary, BonusAmount)
--    SELECT
--        E.EmployeeID,
--        E.FirstName + ' ' + E.LastName AS FullName,
--        E.Department,
--        E.Salary,
--        -- Calculate BonusAmount: Salary * BonusPercentage / 100
--        E.Salary * DB.BonusPercentage / 100.00 AS BonusAmount
--    FROM
--        Employees E
--    INNER JOIN
--        DepartmentBonus DB ON E.Department = DB.Department;

--    -- 3. Select all data from the temporary table
--    SELECT
--        EmployeeID,
--        FullName,
--        Department,
--        Salary,
--        BonusAmount
--    FROM
--        #EmployeeBonus;

--    -- Clean up the temporary table (optional, as it is automatically dropped 
--    -- when the session ends, but good practice for clarity)
--    -- DROP TABLE #EmployeeBonus;
--END;
--GO

-- EXEC CalculateEmployeeBonus;
--------------------------------------------------------------------------------
--📄 Task 2:

--CREATE PROCEDURE UpdateDepartmentSalary
--    @DepartmentName NVARCHAR(50),
--    @IncreasePercentage DECIMAL(5, 2)
--AS
--BEGIN
--    -- Check if the department name is valid
--    IF NOT EXISTS (SELECT 1 FROM Employees WHERE Department = @DepartmentName)
--    BEGIN
--        -- Optionally raise an error or return a message if the department is not found
--        SELECT 'Error: Department not found.' AS Message;
--        RETURN;
--    END

--    -- 1. Update salary of all employees in the given department
--    UPDATE Employees
--    SET Salary = Salary * (1 + @IncreasePercentage / 100.00)
--    WHERE Department = @DepartmentName;

--    -- 2. Return the updated employees from that department
--    SELECT
--        EmployeeID,
--        FirstName,
--        LastName,
--        Department,
--        Salary -- The new, updated salary
--    FROM
--        Employees
--    WHERE
--        Department = @DepartmentName
--    ORDER BY
--        EmployeeID;
--END;
--GO

-- Example execution: Give the 'Sales' department a 5% raise
-- EXEC UpdateDepartmentSalary @DepartmentName = 'Sales', @IncreasePercentage = 5.00;

--------------------------------------------------------------------------------
--CREATE TABLE Products_Current (
--    ProductID INT PRIMARY KEY,
--    ProductName NVARCHAR(100),
--    Price DECIMAL(10,2)
--);

--CREATE TABLE Products_New (
--    ProductID INT PRIMARY KEY,
--    ProductName NVARCHAR(100),
--    Price DECIMAL(10,2)
--);

--INSERT INTO Products_Current VALUES
--(1, 'Laptop', 1200),
--(2, 'Tablet', 600),
--(3, 'Smartphone', 800);

--INSERT INTO Products_New VALUES
--(2, 'Tablet Pro', 700),
--(3, 'Smartphone', 850),
--(4, 'Smartwatch', 300);

--------------------------------------------------------------------------------
--📄 Task 3:
	
--MERGE INTO Products_Current AS T
--USING Products_New AS S
--ON (T.ProductID = S.ProductID)

---- 1. WHEN MATCHED: Update ProductName and Price if ProductID exists
--WHEN MATCHED THEN
--    UPDATE SET
--        T.ProductName = S.ProductName,
--        T.Price = S.Price

---- 2. WHEN NOT MATCHED BY TARGET: Insert new products
--WHEN NOT MATCHED BY TARGET THEN
--    INSERT (ProductID, ProductName, Price)
--    VALUES (S.ProductID, S.ProductName, S.Price)

---- 3. WHEN NOT MATCHED BY SOURCE: Delete products missing in the new data
--WHEN NOT MATCHED BY SOURCE THEN
--    DELETE

---- The semicolon is mandatory to terminate the MERGE statement
--OUTPUT $action, inserted.*, deleted.*;

--------------------------------------------------------------------------------
--📄 Task 4:

--CREATE TABLE Tree (id INT, p_id INT);

--INSERT INTO Tree (id, p_id) VALUES (1, NULL);
--INSERT INTO Tree (id, p_id) VALUES (2, 1);
--INSERT INTO Tree (id, p_id) VALUES (3, 1);
--INSERT INTO Tree (id, p_id) VALUES (4, 2);
--INSERT INTO Tree (id, p_id) VALUES (5, 2);

--SELECT
--    id,
--    CASE
--        -- 1. ROOT: A node is the Root if its parent ID (p_id) is NULL.
--        WHEN p_id IS NULL THEN 'Root'

--        -- 2. LEAF: A node is a Leaf if its ID does NOT appear in the p_id column (it has no children).
--        WHEN id NOT IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Leaf'

--        -- 3. INNER: If a node is neither Root nor Leaf, it must be Inner.
--        ELSE 'Inner'
--    END AS Type
--FROM
--    Tree
--ORDER BY
--    id;

--------------------------------------------------------------------------------
--📄 Task 5:
--CREATE TABLE Signups (user_id INT, time_stamp DATETIME);
--CREATE TABLE Confirmations (user_id INT, time_stamp DATETIME, action ENUM('confirmed','timeout'));

--INSERT INTO Signups (user_id, time_stamp) VALUES 
--(3, '2020-03-21 10:16:13'),
--(7, '2020-01-04 13:57:59'),
--(2, '2020-07-29 23:09:44'),
--(6, '2020-12-09 10:39:37');

--INSERT INTO Confirmations (user_id, time_stamp, action) VALUES 
--(3, '2021-01-06 03:30:46', 'timeout'),
--(3, '2021-07-14 14:00:00', 'timeout'),
--(7, '2021-06-12 11:57:29', 'confirmed'),
--(7, '2021-06-13 12:58:28', 'confirmed'),
--(7, '2021-06-14 13:59:27', 'confirmed'),
--(2, '2021-01-22 00:00:00', 'confirmed'),
--(2, '2021-02-28 23:59:59', 'timeout');

--SELECT
--    S.user_id,
--    -- Calculate the confirmation rate: (Confirmed requests) / (Total requests)
--    -- COALESCE is used to return 0.00 if a user has no entries in the Confirmations table.
--    COALESCE(
--        ROUND(
--            CAST(SUM(CASE WHEN C.action = 'confirmed' THEN 1 ELSE 0 END) AS DECIMAL) /
--            CAST(COUNT(C.user_id) AS DECIMAL),
--        2),
--    0.00) AS confirmation_rate
--FROM
--    Signups S
---- LEFT JOIN is essential to include users who have 0 confirmation requests
--LEFT JOIN
--    Confirmations C ON S.user_id = C.user_id
--GROUP BY
--    S.user_id
--ORDER BY
--    S.user_id;

--------------------------------------------------------------------------------
--📄 Task 6:

--DROP TABLE IF EXISTS employee;
--GO
--CREATE TABLE employees (
--    id INT PRIMARY KEY,
--    name VARCHAR(100),
--    salary DECIMAL(10,2)
--);

--INSERT INTO employees (id, name, salary) VALUES
--(1, 'Alice', 50000),
--(2, 'Bob', 60000),
--(3, 'Charlie', 50000);

--SELECT
--    id,
--    name,
--    salary
--FROM
--    employees
--WHERE
--    salary = (SELECT MIN(salary) FROM employees);

--------------------------------------------------------------------------------
--📄 Task 7:

-- Products Table
--CREATE TABLE Products (
--    ProductID INT PRIMARY KEY,
--    ProductName NVARCHAR(100),
--    Category NVARCHAR(50),
--    Price DECIMAL(10,2)
--);

---- Sales Table
--CREATE TABLE Sales (
--    SaleID INT PRIMARY KEY,
--    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
--    Quantity INT,
--    SaleDate DATE
--);

--INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
--(1, 'Laptop Model A', 'Electronics', 1200),
--(2, 'Laptop Model B', 'Electronics', 1500),
--(3, 'Tablet Model X', 'Electronics', 600),
--(4, 'Tablet Model Y', 'Electronics', 700),
--(5, 'Smartphone Alpha', 'Electronics', 800),
--(6, 'Smartphone Beta', 'Electronics', 850),
--(7, 'Smartwatch Series 1', 'Wearables', 300),
--(8, 'Smartwatch Series 2', 'Wearables', 350),
--(9, 'Headphones Basic', 'Accessories', 150),
--(10, 'Headphones Pro', 'Accessories', 250),
--(11, 'Wireless Mouse', 'Accessories', 50),
--(12, 'Wireless Keyboard', 'Accessories', 80),
--(13, 'Desktop PC Standard', 'Computers', 1000),
--(14, 'Desktop PC Gaming', 'Computers', 2000),
--(15, 'Monitor 24 inch', 'Displays', 200),
--(16, 'Monitor 27 inch', 'Displays', 300),
--(17, 'Printer Basic', 'Office', 120),
--(18, 'Printer Pro', 'Office', 400),
--(19, 'Router Basic', 'Networking', 70),
--(20, 'Router Pro', 'Networking', 150);

--INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate) VALUES
--(1, 1, 2, '2024-01-15'),
--(2, 1, 1, '2024-02-10'),
--(3, 1, 3, '2024-03-08'),
--(4, 2, 1, '2024-01-22'),
--(5, 3, 5, '2024-01-20'),
--(6, 5, 2, '2024-02-18'),
--(7, 5, 1, '2024-03-25'),
--(8, 6, 4, '2024-04-02'),
--(9, 7, 2, '2024-01-30'),
--(10, 7, 1, '2024-02-25'),
--(11, 7, 1, '2024-03-15'),
--(12, 9, 8, '2024-01-18'),
--(13, 9, 5, '2024-02-20'),
--(14, 10, 3, '2024-03-22'),
--(15, 11, 2, '2024-02-14'),
--(16, 13, 1, '2024-03-10'),
--(17, 14, 2, '2024-03-22'),
--(18, 15, 5, '2024-02-01'),
--(19, 15, 3, '2024-03-11'),
--(20, 19, 4, '2024-04-01');

--CREATE PROCEDURE GetProductSalesSummary
--    @ProductID INT
--AS
--BEGIN
--    SELECT
--        P.ProductName,
--        -- Total Quantity Sold (NULL if no sales)
--        SUM(S.Quantity) AS [Total Quantity Sold],
--        -- Total Sales Amount (NULL if no sales)
--        SUM(S.Quantity * P.Price) AS [Total Sales Amount],
--        -- First Sale Date (NULL if no sales)
--        MIN(S.SaleDate) AS [First Sale Date],
--        -- Last Sale Date (NULL if no sales)
--        MAX(S.SaleDate) AS [Last Sale Date]
--    FROM
--        Products P
--    -- LEFT JOIN ensures the product name is returned even if there are no sales
--    LEFT JOIN
--        Sales S ON P.ProductID = S.ProductID
--    WHERE
--        P.ProductID = @ProductID
--    GROUP BY
--        P.ProductID, P.ProductName;
--END
--GO

-- Example execution for a product with sales (e.g., ProductID 1)
-- EXEC GetProductSalesSummary @ProductID = 1;

-- Example execution for a product with no sales (e.g., ProductID 4)
-- EXEC GetProductSalesSummary @ProductID = 4;
