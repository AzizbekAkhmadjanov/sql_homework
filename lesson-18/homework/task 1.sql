
--CREATE DATABASE HOMETASK18;
--GO
--USE HOMETASK18;

--------------------------------------------------------------------------------
--CREATE TABLE Products (
--    ProductID INT PRIMARY KEY,
--    ProductName VARCHAR(100),
--    Category VARCHAR(50),
--    Price DECIMAL(10,2)
--);

--CREATE TABLE Sales (
--    SaleID INT PRIMARY KEY,
--    ProductID INT,
--    Quantity INT,
--    SaleDate DATE,
--    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
--);

--INSERT INTO Products (ProductID, ProductName, Category, Price)
--VALUES
--(1, 'Samsung Galaxy S23', 'Electronics', 899.99),
--(2, 'Apple iPhone 14', 'Electronics', 999.99),
--(3, 'Sony WH-1000XM5 Headphones', 'Electronics', 349.99),
--(4, 'Dell XPS 13 Laptop', 'Electronics', 1249.99),
--(5, 'Organic Eggs (12 pack)', 'Groceries', 3.49),
--(6, 'Whole Milk (1 gallon)', 'Groceries', 2.99),
--(7, 'Alpen Cereal (500g)', 'Groceries', 4.75),
--(8, 'Extra Virgin Olive Oil (1L)', 'Groceries', 8.99),
--(9, 'Mens Cotton T-Shirt', 'Clothing', 12.99),
--(10, 'Womens Jeans - Blue', 'Clothing', 39.99),
--(11, 'Unisex Hoodie - Grey', 'Clothing', 29.99),
--(12, 'Running Shoes - Black', 'Clothing', 59.95),
--(13, 'Ceramic Dinner Plate Set (6 pcs)', 'Home & Kitchen', 24.99),
--(14, 'Electric Kettle - 1.7L', 'Home & Kitchen', 34.90),
--(15, 'Non-stick Frying Pan - 28cm', 'Home & Kitchen', 18.50),
--(16, 'Atomic Habits - James Clear', 'Books', 15.20),
--(17, 'Deep Work - Cal Newport', 'Books', 14.35),
--(18, 'Rich Dad Poor Dad - Robert Kiyosaki', 'Books', 11.99),
--(19, 'LEGO City Police Set', 'Toys', 49.99),
--(20, 'Rubiks Cube 3x3', 'Toys', 7.99);

--INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate)
--VALUES
--(1, 1, 2, '2025-04-01'),
--(2, 1, 1, '2025-04-05'),
--(3, 2, 1, '2025-04-10'),
--(4, 2, 2, '2025-04-15'),
--(5, 3, 3, '2025-04-18'),
--(6, 3, 1, '2025-04-20'),
--(7, 4, 2, '2025-04-21'),
--(8, 5, 10, '2025-04-22'),
--(9, 6, 5, '2025-04-01'),
--(10, 6, 3, '2025-04-11'),
--(11, 10, 2, '2025-04-08'),
--(12, 12, 1, '2025-04-12'),
--(13, 12, 3, '2025-04-14'),
--(14, 19, 2, '2025-04-05'),
--(15, 20, 4, '2025-04-19'),
--(16, 1, 1, '2025-03-15'),
--(17, 2, 1, '2025-03-10'),
--(18, 5, 5, '2025-02-20'),
--(19, 6, 6, '2025-01-18'),
--(20, 10, 1, '2024-12-25'),
--(21, 1, 1, '2024-04-20');

--------------------------------------------------------------------------------
--1. Create a temporary table named MonthlySales to store the total quantity sold 
--	and total revenue for each product in the current month.
--		Return: ProductID, TotalQuantity, TotalRevenue

--DECLARE @CurrentDate DATE = '2025-04-15';
--DECLARE @CurrentMonth INT = MONTH(@CurrentDate);
--DECLARE @CurrentYear INT = YEAR(@CurrentDate);


---- 1. Create the temporary table structure
--DROP TABLE IF EXISTS #MonthlySales;

--CREATE TABLE #MonthlySales (
--    ProductID INT PRIMARY KEY,
--    TotalQuantity INT NOT NULL,
--    TotalRevenue DECIMAL(18, 2) NOT NULL
--);


---- 2. Calculate the aggregated metrics and insert them into the temporary table
--INSERT INTO #MonthlySales (ProductID, TotalQuantity, TotalRevenue)
--SELECT
--    S.ProductID,
--    SUM(S.Quantity) AS TotalQuantity,
--    SUM(S.Quantity * P.Price) AS TotalRevenue
--FROM
--    Sales S
--INNER JOIN
--    Products P ON S.ProductID = P.ProductID
--WHERE
--    -- Filter sales to include only those within the current year and current month
--    YEAR(S.SaleDate) = @CurrentYear
--    AND MONTH(S.SaleDate) = @CurrentMonth
--GROUP BY
--    S.ProductID;


---- 3. Return the contents of the temporary table as the final result
--SELECT
--    ProductID,
--    TotalQuantity,
--    TotalRevenue
--FROM
--    #MonthlySales
--ORDER BY
--    ProductID;

--------------------------------------------------------------------------------
----2. Create a view named vw_ProductSalesSummary that returns product info along 
----		with total sales quantity across all time.

---- Use IF EXISTS and DROP VIEW for clean execution in multiple environments
--IF OBJECT_ID('vw_ProductSalesSummary', 'V') IS NOT NULL
--    DROP VIEW vw_ProductSalesSummary;
--GO

--CREATE VIEW vw_ProductSalesSummary AS
--SELECT
--    P.ProductID,
--    P.ProductName,
--    P.Category,
--    -- P.Price has been removed as requested
--    -- Use LEFT JOIN and COALESCE to ensure all products are listed,
--    -- even those with zero sales, showing TotalQuantitySold as 0.
--    COALESCE(SUM(S.Quantity), 0) AS TotalQuantitySold
--FROM
--    Products P
--LEFT JOIN
--    Sales S ON P.ProductID = S.ProductID
--GROUP BY
--    P.ProductID,
--    P.ProductName,
--    P.Category
--    -- P.Price has been removed from GROUP BY as well
--;
--GO

---- Optional: Select from the newly created view to demonstrate its contents
--SELECT * FROM vw_ProductSalesSummary;
--------------------------------------------------------------------------------
--3. Create a function named fn_GetTotalRevenueForProduct(@ProductID INT)
--Return: total revenue for the given product ID

--IF OBJECT_ID('fn_GetTotalRevenueForProduct', 'FN') IS NOT NULL
--    DROP FUNCTION fn_GetTotalRevenueForProduct;
--GO

--CREATE FUNCTION fn_GetTotalRevenueForProduct(@ProductID INT)
--RETURNS DECIMAL(18, 2)
--AS
--BEGIN
--    DECLARE @TotalRevenue DECIMAL(18, 2);

--    -- Calculate total revenue across all sales history for the given ProductID
--    SELECT
--        @TotalRevenue = COALESCE(SUM(S.Quantity * P.Price), 0.00)
--    FROM
--        Sales S
--    INNER JOIN
--        Products P ON S.ProductID = P.ProductID
--    WHERE
--        S.ProductID = @ProductID;

--    RETURN @TotalRevenue;
--END;
--GO

---- Optional: Test the new function for ProductID 1 (Samsung Galaxy S23) and ProductID 7 (Alpen Cereal)
--SELECT
--    'Test Product 1' AS Description,
--    dbo.fn_GetTotalRevenueForProduct(1) AS TotalRevenue
--UNION ALL
--SELECT
--    'Test Product 7' AS Description,
--    dbo.fn_GetTotalRevenueForProduct(7) AS TotalRevenue;

--------------------------------------------------------------------------------
--4. Create an function fn_GetSalesByCategory(@Category VARCHAR(50))
--Return: ProductName, TotalQuantity, TotalRevenue for all products in that category.

--IF OBJECT_ID('fn_GetSalesByCategory', 'IF') IS NOT NULL
--    DROP FUNCTION fn_GetSalesByCategory;
--GO

--CREATE FUNCTION fn_GetSalesByCategory(@Category VARCHAR(50))
--RETURNS TABLE
--AS
--RETURN
--(
--    -- Select the required fields by joining Products and Sales
--    SELECT
--        P.ProductName,
--        -- TotalQuantity: Sum of sales quantity, 0 if no sales (due to LEFT JOIN)
--        COALESCE(SUM(S.Quantity), 0) AS TotalQuantity,
--        -- TotalRevenue: Sum of Quantity * Price, 0.00 if no sales
--        COALESCE(SUM(S.Quantity * P.Price), 0.00) AS TotalRevenue
--    FROM
--        Products P
--    LEFT JOIN
--        Sales S ON P.ProductID = S.ProductID
--    WHERE
--        P.Category = @Category -- Filter by the input category parameter
--    GROUP BY
--        P.ProductName -- Group by product name to aggregate sales
--);
--GO

---- Optional: Test the new function for the 'Electronics' category
--SELECT * FROM dbo.fn_GetSalesByCategory('Electronics');

--------------------------------------------------------------------------------
--5.
--CREATE FUNCTION dbo.fn_IsPrime (@Number INT)
--RETURNS VARCHAR(3)
--AS
--BEGIN
--    -- Lateral-thinking step 1: Handle non-positive or 1 (not prime)
--    IF @Number <= 1
--        RETURN 'No';

--    -- Lateral-thinking step 2: Handle 2 (the only even prime)
--    IF @Number = 2
--        RETURN 'Yes';

--    -- Lateral-thinking step 3: Handle all other even numbers (not prime)
--    IF @Number % 2 = 0
--        RETURN 'No';

--    -- The core logic: Check for divisors from 3 up to sqrt(@Number), 
--    -- only checking odd numbers (since we eliminated all even numbers above).

--    -- Declare a variable to iterate as the potential divisor
--    DECLARE @Divisor INT = 3;
--    DECLARE @MaxCheck INT = CAST(SQRT(@Number) AS INT);

--    WHILE @Divisor <= @MaxCheck
--    BEGIN
--        IF @Number % @Divisor = 0
--            RETURN 'No'; -- Found a divisor, so it's not prime

--        SET @Divisor = @Divisor + 2; -- Only need to check odd numbers
--    END

--    -- If the loop completes without finding a divisor, the number is prime.
--    RETURN 'Yes';
--END
--GO

--SELECT dbo.fn_IsPrime(13) AS Is13Prime; -- Returns 'Yes'
--SELECT dbo.fn_IsPrime(9) AS Is9Prime;   -- Returns 'No'
--SELECT dbo.fn_IsPrime(1) AS Is1Prime;   -- Returns 'No'
--SELECT dbo.fn_IsPrime(101) AS Is101Prime; -- Returns 'Yes'

--------------------------------------------------------------------------------
--6
--CREATE FUNCTION dbo.fn_GetNumbersBetween (@Start INT, @End INT)
--RETURNS TABLE
--AS
--RETURN
--(
--    WITH NumberSequence (Number)
--    AS
--    (
--        -- Anchor Member: The starting point of the recursion
--        SELECT @Start

--        UNION ALL

--        -- Recursive Member: Adds 1 to the previous number
--        -- and continues as long as the new number is less than or equal to @End
--        SELECT Number + 1
--        FROM NumberSequence
--        WHERE Number < @End
--    )
--    -- Final SELECT statement returns the generated sequence
--    SELECT Number
--    FROM NumberSequence
--);
--GO

--SELECT
--    N.Number
--FROM
--    dbo.fn_GetNumbersBetween(5, 12) AS N;
--------------------------------------------------------------------------------
--7.
--CREATE FUNCTION getNthHighestSalary (@N INT)
--RETURNS TABLE
--AS
--RETURN
--(
--    WITH RankedSalaries AS
--    (
--        SELECT
--            salary,
--            DENSE_RANK() OVER (ORDER BY salary DESC) as salary_rank
--        FROM
--            Employee
--    )
--    SELECT
--        -- Use MAX(salary) to return a single value, and handle the NULL case
--        MAX(CASE WHEN salary_rank = @N THEN salary ELSE NULL END) AS HighestNSalary
--    FROM
--        RankedSalaries
--);
--GO

--------------------------------------------------------------------------------
--8.
--WITH AllFriends AS (
--    -- Get the list of all users who initiated a friendship
--    SELECT
--        requester_id AS user_id
--    FROM
--        RequestAccepted

--    UNION ALL

--    -- Get the list of all users who accepted a friendship
--    SELECT
--        accepter_id AS user_id
--    FROM
--        RequestAccepted
--),

---- 2. Count the total number of times each unique user_id appears in the combined list.
--FriendCounts AS (
--    SELECT
--        user_id,
--        COUNT(user_id) AS num
--    FROM
--        AllFriends
--    GROUP BY
--        user_id
--)

---- 3. Find the user with the maximum count using TOP and ORDER BY (T-SQL standard).
--SELECT TOP 1
--    user_id AS id,
--    num
--FROM
--    FriendCounts
---- Use an ordering clause to get the top result.
--ORDER BY
--    num DESC;
--------------------------------------------------------------------------------
--9.
--CREATE TABLE Customers (
--    customer_id INT PRIMARY KEY,
--    name VARCHAR(100),
--    city VARCHAR(50)
--);

--CREATE TABLE Orders (
--    order_id INT PRIMARY KEY,
--    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
--    order_date DATE,
--    amount DECIMAL(10,2)
--);

---- Customers
--INSERT INTO Customers (customer_id, name, city)
--VALUES
--(1, 'Alice Smith', 'New York'),
--(2, 'Bob Jones', 'Chicago'),
--(3, 'Carol White', 'Los Angeles');

---- Orders
--INSERT INTO Orders (order_id, customer_id, order_date, amount)
--VALUES
--(101, 1, '2024-12-10', 120.00),
--(102, 1, '2024-12-20', 200.00),
--(103, 1, '2024-12-30', 220.00),
--(104, 2, '2025-01-12', 120.00),
--(105, 2, '2025-01-20', 180.00);


--CREATE VIEW vw_CustomerOrderSummary AS
--SELECT
--    C.customer_id,
--    C.name,
--    COUNT(O.order_id) AS total_orders,        -- Counts the number of orders
--    SUM(O.amount) AS total_amount,            -- Sums the total amount spent
--    MAX(O.order_date) AS last_order_date      -- Finds the most recent order date
--FROM
--    Customers C
--INNER JOIN
--    Orders O ON C.customer_id = O.customer_id -- Links customer details to their orders
--GROUP BY
--    C.customer_id,
--    C.name;
--GO

--SELECT * FROM vw_CustomerOrderSummary;
--------------------------------------------------------------------------------
--10.
--DROP TABLE IF EXISTS Gaps;

--CREATE TABLE Gaps
--(
--RowNumber   INTEGER PRIMARY KEY,
--TestCase    VARCHAR(100) NULL
--);

--INSERT INTO Gaps (RowNumber, TestCase) VALUES
--(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
--(5,'Bravo'),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,'Charlie'), (11, NULL), (12, NULL)

--;WITH Grouping AS (
--    SELECT
--        RowNumber,
--        TestCase,
--        MAX(CASE WHEN TestCase IS NOT NULL THEN RowNumber END)
--            OVER (ORDER BY RowNumber ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS GroupStartRow
--    FROM
--        Gaps
--)
--SELECT
--    G1.RowNumber,
--    G2.TestCase AS Workflow
--FROM
--    Grouping G1
--INNER JOIN
--    Grouping G2 ON G1.GroupStartRow = G2.RowNumber
--ORDER BY
--    G1.RowNumber;
