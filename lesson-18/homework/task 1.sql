
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
--1. Create a temporary table named MonthlySales to store the total quantity 
--		sold and total revenue for each product in the current month.
--Return: ProductID, TotalQuantity, TotalRevenue

--SELECT * FROM Sales;
--SELECT * FROM Products;

-----------------------------------
--SELECT ProductID, SUM(Quantity) TotalQuantity
--FROM Sales
--WHERE MONTH(SaleDate)= MONTH(GETDATE()) AND YEAR(SaleDate)= YEAR(GETDATE())
--GROUP BY ProductID

-----------------------------------
--WITH CTE AS
--		(
--		SELECT ProductID, SUM(Quantity) TotalQuantity
--		FROM Sales
--		WHERE MONTH(SaleDate)= MONTH(GETDATE()) AND YEAR(SaleDate)= YEAR(GETDATE())
--		GROUP BY ProductID
--		)
--SELECT CTE.*, CTE.TotalQuantity* Products.Price TotalRevenue FROM CTE
--INNER JOIN Products
--		ON CTE.ProductID= Products.ProductID

-----------------------------------
--WITH CTE AS
--		(
--		SELECT ProductID, SUM(Quantity) TotalQuantity
--		FROM Sales
--		WHERE MONTH(SaleDate)= MONTH(GETDATE()) AND YEAR(SaleDate)= YEAR(GETDATE())
--		GROUP BY ProductID
--		),
--CTE1 AS
--		(
--		SELECT CTE.*, CTE.TotalQuantity* Products.Price TotalRevenue FROM CTE
--		INNER JOIN Products
--				ON CTE.ProductID= Products.ProductID
--		)
--SELECT *
--INTO #MonthlySales
--FROM CTE1;

--SELECT * FROM #MonthlySales;

--------------------------------------------------------------------------------
--2. Create a view named vw_ProductSalesSummary that returns product info along 
--		with total sales quantity across all time.
--Return: ProductID, ProductName, Category, TotalQuantitySold


--SELECT * FROM Sales;
--SELECT * FROM Products;

-----------------------------------
--SELECT ProductID, SUM(Quantity) [total sales quantity]
--FROM Sales
--GROUP BY ProductID

-----------------------------------
--WITH CTE AS
--		(
--		SELECT ProductID, SUM(Quantity) [total sales quantity]
--		FROM Sales
--		GROUP BY ProductID
--		),
--CTE1 AS
--		(
--		SELECT p.ProductID, 
--				p.ProductName,
--				p.Category,
--				ISNULL(CTE.[total sales quantity], 0) [total sales quantity]
--		FROM Products p
--		LEFT JOIN CTE
--				ON CTE.ProductID= p.ProductID
--		)
--SELECT * FROM CTE1;

-----------------------------------
--CREATE VIEW vw_ProductSalesSummary
--AS
--WITH CTE AS
--		(
--		SELECT ProductID, SUM(Quantity) [total sales quantity]
--		FROM Sales
--		GROUP BY ProductID
--		),
--CTE1 AS
--		(
--		SELECT p.ProductID, 
--				p.ProductName,
--				p.Category,
--				ISNULL(CTE.[total sales quantity], 0) [total sales quantity]
--		FROM Products p
--		LEFT JOIN CTE
--				ON CTE.ProductID= p.ProductID
--		)
--SELECT * FROM CTE1;

-----------------------------------
--SELECT * FROM vw_ProductSalesSummary;

--------------------------------------------------------------------------------
--3. Create a function named fn_GetTotalRevenueForProduct(@ProductID INT)
--		Return: total revenue for the given product ID

--SELECT * FROM Sales;
--SELECT * FROM Products;

-----------------------------------
--DECLARE @ProductID INT= 1;
--WITH CTE AS 
--		(
--		SELECT ProductID, SUM(Quantity) [total quantity]
--		FROM Sales
--		GROUP BY ProductID
--		),
--CTE1 AS
--		(
--		SELECT p.ProductID,
--				ISNULL(p.Price*[total quantity], 0) [total revenue]
--		FROM Products p 
--		LEFT JOIN CTE
--				ON p.ProductID= CTE.ProductID
--		)
--SELECT [total revenue] FROM CTE1
--WHERE ProductID= @ProductID;

-----------------------------------
--CREATE FUNCTION fn_GetTotalRevenueForProduct(@ProductID INT)
--RETURNS TABLE
--AS
--RETURN
--		(
--		WITH CTE AS 
--				(
--				SELECT ProductID, SUM(Quantity) [total quantity]
--				FROM Sales
--				GROUP BY ProductID
--				),
--		CTE1 AS
--				(
--				SELECT p.ProductID,
--						ISNULL(p.Price*[total quantity], 0) [total revenue]
--				FROM Products p 
--				LEFT JOIN CTE
--						ON p.ProductID= CTE.ProductID
--				)
--		SELECT [total revenue] FROM CTE1
--		WHERE ProductID= @ProductID
--		)

-----------------------------------
--SELECT * FROM dbo.fn_GetTotalRevenueForProduct(1);
--SELECT * FROM dbo.fn_GetTotalRevenueForProduct(4);
--SELECT * FROM dbo.fn_GetTotalRevenueForProduct(10);

--------------------------------------------------------------------------------
--4. Create an function fn_GetSalesByCategory(@Category VARCHAR(50))
--Return: ProductName, TotalQuantity, TotalRevenue for all products in that category.

-----------------------------------
--SELECT * FROM Sales;
--SELECT * FROM Products;

-----------------------------------
--DECLARE @Category VARCHAR(50)= 'Electronics'

--SELECT p.ProductName, 
--		ISNULL(SUM(s.Quantity), 0) TotalQuantity,
--		ISNULL(SUM(s.Quantity * p.Price), 0) TotalRevenue
--FROM Products p
--INNER JOIN Sales s
--		ON p.ProductID= s.ProductID
--WHERE p.Category= @Category
--GROUP BY p.ProductID, p.ProductName

-----------------------------------
--WITH CTE AS
--		(
--		SELECT ProductID, 
--		SUM(Quantity) [total quantity]
--		FROM Sales
--		GROUP BY ProductID
--		)
--SELECT * FROM CTE;

-----------------------------------
--WITH CTE AS
--		(
--		SELECT ProductID, 
--		SUM(Quantity) [total quantity]
--		FROM Sales
--		GROUP BY ProductID
--		),
--CTE1 AS
--		(
--		SELECT p.*, CTE.[total quantity]
--		FROM Products p
--		LEFT JOIN CTE
--				ON p.ProductID= CTE.ProductID
--		)
--SELECT * FROM CTE1;

-----------------------------------
--DECLARE @Category VARCHAR(50)= 'Electronics';

--WITH CTE AS
--		(
--		SELECT ProductID, 
--		SUM(Quantity) [total quantity]
--		FROM Sales
--		GROUP BY ProductID
--		),
--CTE1 AS
--		(
--		SELECT p.*, CTE.[total quantity]
--		FROM Products p
--		LEFT JOIN CTE
--				ON p.ProductID= CTE.ProductID
--		)
--SELECT ProductName,
--		ISNULL(SUM([total quantity]), 0) TotalQuantity,
--		ISNULL(SUM(Price * [total quantity]), 0) TotalRevenue
--FROM CTE1
--WHERE Category= @Category
--GROUP BY ProductID, ProductName;

--------------------------------------------------------------------------------
--5. You have to create a function that get one argument as input from user and 
--	the function should return 'Yes' if the input number is a prime number and 
--		'No' otherwise. You can start it like this:

--DECLARE @input INT =8
--SELECT @input;

-----------------------------------
--DECLARE @input INT =8
--SELECT @input AS input, 1 AS divisor, 0 AS remainder

-----------------------------------
--DECLARE @input INT =8;
--WITH CTE AS
--			(
--			SELECT @input AS input, 1 AS divisor, 0 AS remainder
--			UNION ALL
--			SELECT @input, divisor+1, @input%(divisor+1) FROM CTE
--			WHERE divisor < @input
--			)
--SELECT * FROM CTE;

-----------------------------------
--DECLARE @input INT =8;
--WITH CTE AS
--			(
--			SELECT @input AS input, 1 AS divisor, 1 AS [statement]
--			UNION ALL
--			SELECT @input, divisor+1, IIF(@input%(divisor+1)!=0, 0, 1) FROM CTE
--			WHERE divisor < @input
--			)
--SELECT * FROM CTE;

-----------------------------------
--DECLARE @input INT =4;
--WITH CTE AS
--			(
--			SELECT @input AS input, 1 AS divisor, 1 AS [statement]
--			UNION ALL
--			SELECT @input, divisor+1, IIF(@input%(divisor+1)!=0, 0, 1) FROM CTE
--			WHERE divisor < @input
--			)
--SELECT IIF(SUM([statement])=2, 'Yes', 'No') [output] FROM CTE
--GROUP BY input;

-----------------------------------
--DROP FUNCTION IF EXISTS dbo.fn_IsPrime;

-----------------------------------
--CREATE FUNCTION fn_IsPrime(@input INT)
--RETURNS TABLE
--AS
--RETURN
--(
--		WITH CTE AS
--					(
--					SELECT @input AS input, 1 AS divisor, 1 AS [statement]
--					UNION ALL
--					SELECT @input, divisor+1, IIF(@input%(divisor+1)!=0, 0, 1) FROM CTE
--					WHERE divisor < @input
--					)
--		SELECT IIF(SUM([statement])=2, 'Yes', 'No') [output] FROM CTE
--		GROUP BY input
--);

-----------------------------------
--SELECT * FROM fn_IsPrime(13);
--SELECT * FROM fn_IsPrime(72);
--SELECT * FROM fn_IsPrime(19);
--SELECT * FROM fn_IsPrime(21);
--SELECT * FROM fn_IsPrime(35);
--SELECT * FROM fn_IsPrime(90);

--------------------------------------------------------------------------------
--6. Create a table-valued function named fn_GetNumbersBetween that accepts 
--		two integers as input: @Start INT @End INT


--DROP FUNCTION IF EXISTS dbo.fn_GetNumbersBetween;

-----------------------------------
--DECLARE @Start INT= 11, 
--		@End INT= 24;
--WITH CTE AS
--		(
--		SELECT @Start AS Number
--		UNION ALL
--		SELECT Number+1 FROM CTE
--		WHERE Number<@End
--		)
--SELECT * FROM CTE;

-----------------------------------
--CREATE FUNCTION fn_GetNumbersBetween(@Start INT, @End INT)
--RETURNS TABLE
--AS
--RETURN
--	(
--	WITH CTE AS
--			(
--			SELECT @Start AS Number
--			UNION ALL
--			SELECT Number+1 FROM CTE
--			WHERE Number<@End
--			)
--	SELECT * FROM CTE
--	);

-----------------------------------
--SELECT * FROM fn_GetNumbersBetween(7, 19);
--SELECT * FROM fn_GetNumbersBetween(3, 24);
--SELECT * FROM fn_GetNumbersBetween(15, 42);

--------------------------------------------------------------------------------
--7. Write a SQL query to return the Nth highest distinct salary from the Employee
--		table. If there are fewer than N distinct salaries, return NULL.

-----------------------------------
--DROP TABLE IF EXISTS Employee;

-----------------------------------
--CREATE TABLE Employee(id INT PRIMARY KEY, salary INT);
--INSERT INTO Employee VALUES (1, 100), (2, 200), (3, 300)

--SELECT * FROM Employee

-----------------------------------
--SELECT COUNT(DISTINCT salary) distinct_data FROM Employee;

-----------------------------------
--DECLARE @n INT = 2

--IF (SELECT COUNT(DISTINCT salary) distinct_data FROM Employee) >= @n
--BEGIN
--	SELECT salary [getNthHighestSalary] 
--	FROM Employee
--	ORDER BY salary DESC 
--	OFFSET @n-1 ROWS 
--	FETCH NEXT 1 ROW ONLY
--END
--ELSE
--BEGIN 
--	SELECT 'null' AS [getNthHighestSalary]
--END;

--------------------------------------------------------------------------------
--8. Write a SQL query to find the person who has the most friends.

-----------------------------------
--DROP TABLE IF EXISTS RequestAccepted;

-----------------------------------
--CREATE TABLE RequestAccepted (requester_id INT, accepter_id INT, accept_date DATE);

--INSERT INTO RequestAccepted VALUES (1, 2, '2016-06-03'),
--									(1, 3, '2016-06-08'),
--									(2, 3, '2016-06-08'),
--									(3, 4, '2016-06-09')	
--SELECT * FROM RequestAccepted;

-----------------------------------
--WITH CTE AS
--			(
--			SELECT requester_id AS allRA FROM RequestAccepted
--			UNION ALL
--			SELECT accepter_id FROM RequestAccepted
--			),
--CTE1 AS
--			(
--			SELECT allRA, COUNT(allRA) connections FROM CTE
--			GROUP BY allRA
--			)
--SELECT TOP 1 allRA id, connections num FROM CTE1
--ORDER BY connections DESC;

--------------------------------------------------------------------------------
--9. Create a View for Customer Order Summary.

--DROP TABLE IF EXISTS Customers;
--GO
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

-----------------------------------
--SELECT * FROM Customers;
--SELECT * FROM Orders;

-----------------------------------

--SELECT * FROM Customers c
--INNER JOIN Orders o
--		ON c.customer_id= o.customer_id


-----------------------------------
--CREATE VIEW vw_CustomerOrderSummary
--AS
--SELECT c.customer_id,
--		c.[name],
--		COUNT(order_id) total_orders,
--		SUM(amount) total_amount,
--		MAX(order_date) last_order_date
--FROM Customers c
--INNER JOIN Orders o
--		ON c.customer_id= o.customer_id
--GROUP BY c.customer_id, c.[name];

--SELECT * FROM vw_CustomerOrderSummary;

-----------------------------------
--DROP VIEW IF EXISTS vw_CustomerOrderSummary;
--GO
--CREATE VIEW vw_CustomerOrderSummary
--AS
--SELECT c.customer_id,
--		c.[name],
--		COUNT(order_id) total_orders,
--		ISNULL(SUM(amount), 0.00) total_amount,
--		ISNULL(CAST(MAX(order_date) AS VARCHAR(50)), '-') last_order_date
--FROM Customers c
--LEFT JOIN Orders o
--		ON c.customer_id= o.customer_id
--GROUP BY c.customer_id, c.[name];

--SELECT * FROM vw_CustomerOrderSummary;

-----------------------------------


-----------------------------------

--------------------------------------------------------------------------------
--10. Write an SQL statement to fill in the missing gaps. You have to write only 
--		select statement, no need to modify the table.

--DROP TABLE IF EXISTS Gaps;

--CREATE TABLE Gaps
--(
--RowNumber   INTEGER PRIMARY KEY,
--TestCase    VARCHAR(100) NULL
--);

--INSERT INTO Gaps (RowNumber, TestCase) VALUES
--(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
--(5,'Bravo'),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,'Charlie'), (11, NULL), (12, NULL)

-----------------------------------
--SELECT * FROM Gaps;

-----------------------------------
--SELECT
--    RowNumber,
--    -- 2. Use FIRST_VALUE() or MAX() on the original TestCase, 
--    --    partitioned by the GroupID, to retrieve the non-NULL value.
--    FIRST_VALUE(TestCase) OVER (
--        PARTITION BY GroupID 
--        ORDER BY RowNumber
--    ) AS TestCase
--FROM
--    (
--        -- 1. Create a GroupID: a running count that only increments 
--        --    when a non-NULL value (the start of a new group) is encountered.
--        SELECT
--            RowNumber,
--            TestCase,
--            SUM(CASE WHEN TestCase IS NOT NULL THEN 1 ELSE 0 END) OVER (ORDER BY RowNumber) AS GroupID
--        FROM
--            Gaps
--    ) AS T;

