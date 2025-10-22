
--CREATE DATABASE HOMETASK20;
--GO
--USE HOMETASK20;

--------------------------------------------------------------------------------
--DROP TABLE IF EXISTS #Sales;
--GO
--CREATE TABLE #Sales (
--    SaleID INT PRIMARY KEY IDENTITY(1,1),
--    CustomerName VARCHAR(100),
--    Product VARCHAR(100),
--    Quantity INT,
--    Price DECIMAL(10,2),
--    SaleDate DATE
--);


--INSERT INTO #Sales (CustomerName, Product, Quantity, Price, SaleDate) VALUES
--('Alice', 'Laptop', 1, 1200.00, '2024-01-15'),
--('Bob', 'Smartphone', 2, 800.00, '2024-02-10'),
--('Charlie', 'Tablet', 1, 500.00, '2024-02-20'),
--('David', 'Laptop', 1, 1300.00, '2024-03-05'),
--('Eve', 'Smartphone', 3, 750.00, '2024-03-12'),
--('Frank', 'Headphones', 2, 100.00, '2024-04-08'),
--('Grace', 'Smartwatch', 1, 300.00, '2024-04-25'),
--('Hannah', 'Tablet', 2, 480.00, '2024-05-05'),
--('Isaac', 'Laptop', 1, 1250.00, '2024-05-15'),
--('Jack', 'Smartphone', 1, 820.00, '2024-06-01');

--------------------------------------------------------------------------------
--1. Find customers who purchased at least one item in March 2024 using EXISTS

--SELECT * FROM #Sales;

-----------------------------------
--SELECT DISTINCT s1.CustomerName 
--FROM #Sales s1
--WHERE EXISTS (
--			SELECT 1
--			FROM #Sales s2
--			WHERE s2.CustomerName= s1.CustomerName
--			AND DATENAME(MONTH, SaleDate)= 'March' 
--			AND YEAR(SaleDate)= 2024
--			)

--------------------------------------------------------------------------------
--2. Find the product with the highest total sales revenue using a subquery.

--SELECT TOP 1 [Product], SUM(Quantity*Price) [total sales revenue] FROM #Sales
--GROUP BY [Product]
--ORDER BY [total sales revenue] DESC;

-----------------------------------
--SELECT [Product], SUM(Quantity * Price) [total sales revenue]
--FROM #Sales
--GROUP BY [Product]

-----------------------------------
--SELECT MAX([total sales revenue]) FROM (
--									SELECT [Product], SUM(Quantity * Price) [total sales revenue]
--									FROM #Sales
--									GROUP BY [Product]
--									) AS Sub1

-----------------------------------
--SELECT [Product], SUM(Quantity * Price) total_sales_revenue
--FROM #Sales
--GROUP BY [Product] 
--HAVING SUM(Quantity * Price)= (
--								SELECT MAX([total sales revenue]) 
--								FROM (
--									 SELECT [Product], SUM(Quantity * Price) [total sales revenue]
--									 FROM #Sales
--									 GROUP BY [Product]
--									 ) AS Sub1
--								);

--------------------------------------------------------------------------------
--3. Find the second highest sale amount using a subquery

--SELECT MAX(SaleAmount) AS SecondHighestSale
--FROM (
--    SELECT DISTINCT (Quantity * Price) AS SaleAmount
--    FROM #Sales
--) AS DistinctSales
--WHERE SaleAmount < (
--    SELECT MAX(SaleAmount)
--    FROM (
--        SELECT DISTINCT (Quantity * Price) AS SaleAmount
--        FROM #Sales
--    ) AS InnerDistinct
--);

--------------------------------------------------------------------------------
--4. Find the total quantity of products sold per month using a subquery

--SELECT DATENAME(MONTH, SaleDate) AS [Month],
--       (SELECT SUM(s2.Quantity)
--        FROM #Sales s2
--        WHERE MONTH(s2.SaleDate) = MONTH(s1.SaleDate)
--              AND YEAR(s2.SaleDate) = YEAR(s1.SaleDate)
--       ) AS TotalQuantity
--FROM #Sales s1
--GROUP BY DATENAME(MONTH, SaleDate), MONTH(SaleDate), YEAR(SaleDate)
--ORDER BY YEAR(SaleDate), MONTH(SaleDate);

--------------------------------------------------------------------------------
--5. Find customers who bought same products as another customer using EXISTS

--SELECT DISTINCT s1.CustomerName
--FROM #Sales s1
--WHERE EXISTS (
--    SELECT 1
--    FROM #Sales s2
--    WHERE s2.Product = s1.Product
--      AND s2.CustomerName <> s1.CustomerName
--);

--------------------------------------------------------------------------------
--6. Return how many fruits does each person have in individual fruit level

--create table Fruits(Name varchar(50), Fruit varchar(50))
--insert into Fruits values ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Orange'),
--							('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), 
--							('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), ('Mario', 'Apple'), 
--							('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), 
--							('Mario', 'Orange')

--SELECT Name, [Apple], [Orange], [Banana]
--FROM (
--    SELECT Name, Fruit
--    FROM Fruits
--) AS SourceTable
--PIVOT (
--    COUNT(Fruit)
--    FOR Fruit IN ([Apple], [Orange], [Banana])
--) AS PivotTable
--ORDER BY Name;

--------------------------------------------------------------------------------
--7. Return older people in the family with younger ones

--create table Family(ParentId int, ChildID int)
--insert into Family values (1, 2), (2, 3), (3, 4)

--WITH FamilyCTE AS (
--    -- Base case: direct parent-child
--    SELECT ParentID, ChildID
--    FROM Family

--    UNION ALL

--    -- Recursive case: link a parent to the child's child
--    SELECT f.ParentID, c.ChildID
--    FROM Family f
--    INNER JOIN FamilyCTE c
--        ON f.ChildID = c.ParentID
--)
--SELECT DISTINCT ParentID AS PID, ChildID AS CHID
--FROM FamilyCTE
--ORDER BY PID, CHID;

--------------------------------------------------------------------------------
--8. Write an SQL statement given the following requirements. For every customer 
--that had a delivery to California, provide a result set of the customer orders 
--that were delivered to Texas

--CREATE TABLE #Orders
--(
--CustomerID     INTEGER,
--OrderID        INTEGER,
--DeliveryState  VARCHAR(100) NOT NULL,
--Amount         MONEY NOT NULL,
--PRIMARY KEY (CustomerID, OrderID)
--);


--INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
--(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
--(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
--(3003,7,'CA',830),(4004,8,'TX',120);

--SELECT *
--FROM #Orders o1
--WHERE o1.DeliveryState = 'TX'
--  AND EXISTS (
--      SELECT 1
--      FROM #Orders o2
--      WHERE o2.CustomerID = o1.CustomerID
--        AND o2.DeliveryState = 'CA'
--  );

--------------------------------------------------------------------------------
--9. Insert the names of residents if they are missing

--create table #residents(resid int identity, fullname varchar(50), address varchar(100))

--insert into #residents values 
--('Dragan', 'city=Bratislava country=Slovakia name=Dragan age=45'),
--('Diogo', 'city=Lisboa country=Portugal age=26'),
--('Celine', 'city=Marseille country=France name=Celine age=21'),
--('Theo', 'city=Milan country=Italy age=28'),
--('Rajabboy', 'city=Tashkent country=Uzbekistan age=22')

--UPDATE #residents
--SET fullname = SUBSTRING(address,
--                         CHARINDEX('name=', address) + 5,
--                         CHARINDEX(' ', address + ' ', CHARINDEX('name=', address) + 5)
--                           - (CHARINDEX('name=', address) + 5))
--WHERE fullname IS NULL
--   OR fullname = '';

--------------------------------------------------------------------------------
--10. Write a query to return the route to reach from Tashkent to Khorezm. 
--The result should include the cheapest and the most expensive routes

--CREATE TABLE #Routes
--(
--RouteID        INTEGER NOT NULL,
--DepartureCity  VARCHAR(30) NOT NULL,
--ArrivalCity    VARCHAR(30) NOT NULL,
--Cost           MONEY NOT NULL,
--PRIMARY KEY (DepartureCity, ArrivalCity)
--);

--INSERT INTO #Routes (RouteID, DepartureCity, ArrivalCity, Cost) VALUES
--(1,'Tashkent','Samarkand',100),
--(2,'Samarkand','Bukhoro',200),
--(3,'Bukhoro','Khorezm',300),
--(4,'Samarkand','Khorezm',400),
--(5,'Tashkent','Jizzakh',100),
--(6,'Jizzakh','Samarkand',50);

--;WITH RoutePaths AS (
--    -- start routes from Tashkent
--    SELECT 
--        DepartureCity,
--        ArrivalCity,
--        CAST(DepartureCity + ' - ' + ArrivalCity AS VARCHAR(MAX)) AS Route,
--        Cost
--    FROM #Routes
--    WHERE DepartureCity = 'Tashkent'

--    UNION ALL

--    -- recursively append following routes
--    SELECT 
--        rp.DepartureCity,
--        r.ArrivalCity,
--        CAST(rp.Route + ' - ' + r.ArrivalCity AS VARCHAR(MAX)) AS Route,
--        rp.Cost + r.Cost
--    FROM RoutePaths rp
--    JOIN #Routes r
--      ON rp.ArrivalCity = r.DepartureCity
--)
--, FinalRoutes AS (
--    SELECT Route, Cost
--    FROM RoutePaths
--    WHERE ArrivalCity = 'Khorezm'
--)
---- select cheapest and most expensive routes using derived tables
--SELECT Route, Cost
--FROM (
--    SELECT TOP (1) Route, Cost
--    FROM FinalRoutes
--    ORDER BY Cost ASC
--) AS Cheapest
--UNION ALL
--SELECT Route, Cost
--FROM (
--    SELECT TOP (1) Route, Cost
--    FROM FinalRoutes
--    ORDER BY Cost DESC
--) AS MostExpensive
--OPTION (MAXRECURSION 0);  -- allow arbitrary recursion depth (use carefully)


--------------------------------------------------------------------------------
--11. Rank products based on their order of insertion.

--CREATE TABLE #RankingPuzzle
--(
--     ID INT
--    ,Vals VARCHAR(10)
--)

 
--INSERT INTO #RankingPuzzle VALUES
--(1,'Product'),
--(2,'a'),
--(3,'a'),
--(4,'a'),
--(5,'a'),
--(6,'Product'),
--(7,'b'),
--(8,'b'),
--(9,'Product'),
--(10,'c')

--;WITH ProductGroups AS (
--    SELECT 
--        ID,
--        Vals,
--        -- Count how many times 'Product' appeared up to this row
--        SUM(CASE WHEN Vals = 'Product' THEN 1 ELSE 0 END)
--            OVER (ORDER BY ID ROWS UNBOUNDED PRECEDING) AS ProductRank
--    FROM #RankingPuzzle
--)
--SELECT * 
--FROM ProductGroups
--ORDER BY ID;

--------------------------------------------------------------------------------
--12. Find employees whose sales were higher than the average sales in 
--		their department

--DROP TABLE IF EXISTS #EmployeeSales;
--GO
--CREATE TABLE #EmployeeSales (
--    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
--    EmployeeName VARCHAR(100),
--    Department VARCHAR(50),
--    SalesAmount DECIMAL(10,2),
--    SalesMonth INT,
--    SalesYear INT
--);

--INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
--('Alice', 'Electronics', 5000, 1, 2024),
--('Bob', 'Electronics', 7000, 1, 2024),
--('Charlie', 'Furniture', 3000, 1, 2024),
--('David', 'Furniture', 4500, 1, 2024),
--('Eve', 'Clothing', 6000, 1, 2024),
--('Frank', 'Electronics', 8000, 2, 2024),
--('Grace', 'Furniture', 3200, 2, 2024),
--('Hannah', 'Clothing', 7200, 2, 2024),
--('Isaac', 'Electronics', 9100, 3, 2024),
--('Jack', 'Furniture', 5300, 3, 2024),
--('Kevin', 'Clothing', 6800, 3, 2024),
--('Laura', 'Electronics', 6500, 4, 2024),
--('Mia', 'Furniture', 4000, 4, 2024),
--('Nathan', 'Clothing', 7800, 4, 2024);

-----------------------------------
--SELECT * FROM #EmployeeSales

-----------------------------------
--SELECT Department, AVG(SalesAmount) avg_sales_by_dep
--FROM #EmployeeSales
--GROUP BY Department;

-----------------------------------
--SELECT * FROM #EmployeeSales emps1
--WHERE emps1.SalesAmount>(SELECT AVG(SalesAmount) 
--						 FROM #EmployeeSales emps2
--						 WHERE emps1.Department= emps2.Department
--						)


--------------------------------------------------------------------------------
--13. Find employees who had the highest sales in any given month using EXISTS

--CREATE TABLE #EmployeeSales (
--    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
--    EmployeeName VARCHAR(100),
--    Department VARCHAR(50),
--    SalesAmount DECIMAL(10,2),
--    SalesMonth INT,
--    SalesYear INT
--);

--INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
--('Alice', 'Electronics', 5000, 1, 2024),
--('Bob', 'Electronics', 7000, 1, 2024),
--('Charlie', 'Furniture', 3000, 1, 2024),
--('David', 'Furniture', 4500, 1, 2024),
--('Eve', 'Clothing', 6000, 1, 2024),
--('Frank', 'Electronics', 8000, 2, 2024),
--('Grace', 'Furniture', 3200, 2, 2024),
--('Hannah', 'Clothing', 7200, 2, 2024),
--('Isaac', 'Electronics', 9100, 3, 2024),
--('Jack', 'Furniture', 5300, 3, 2024),
--('Kevin', 'Clothing', 6800, 3, 2024),
--('Laura', 'Electronics', 6500, 4, 2024),
--('Mia', 'Furniture', 4000, 4, 2024),
--('Nathan', 'Clothing', 7800, 4, 2024);

--SELECT e1.EmployeeName,
--       e1.Department,
--       e1.SalesAmount,
--       e1.SalesMonth,
--       e1.SalesYear
--FROM #EmployeeSales e1
--WHERE NOT EXISTS (
--    SELECT 1
--    FROM #EmployeeSales e2
--    WHERE e2.SalesMonth = e1.SalesMonth
--      AND e2.SalesYear = e1.SalesYear
--      AND e2.SalesAmount > e1.SalesAmount
--);

--------------------------------------------------------------------------------
--14. Find employees who made sales in every month using NOT EXISTS

--SELECT e1.EmployeeName
--FROM #EmployeeSales e1
--GROUP BY e1.EmployeeName
--HAVING NOT EXISTS (
--    SELECT 1
--    FROM (
--        SELECT DISTINCT SalesMonth, SalesYear
--        FROM #EmployeeSales
--    ) AS all_months
--    WHERE NOT EXISTS (
--        SELECT 1
--        FROM #EmployeeSales e2
--        WHERE e2.EmployeeName = e1.EmployeeName
--          AND e2.SalesMonth = all_months.SalesMonth
--          AND e2.SalesYear = all_months.SalesYear
--    )
--);

--------------------------------------------------------------------------------
--15. Retrieve the names of products that are more expensive than the average 
--			price of all products.

--DROP TABLE IF EXISTS Products;
--GO
--CREATE TABLE Products (
--    ProductID   INT PRIMARY KEY,
--    Name        VARCHAR(50),
--    Category    VARCHAR(50),
--    Price       DECIMAL(10,2),
--    Stock       INT
--);

--INSERT INTO Products (ProductID, Name, Category, Price, Stock) VALUES
--(1, 'Laptop', 'Electronics', 1200.00, 15),
--(2, 'Smartphone', 'Electronics', 800.00, 30),
--(3, 'Tablet', 'Electronics', 500.00, 25),
--(4, 'Headphones', 'Accessories', 150.00, 50),
--(5, 'Keyboard', 'Accessories', 100.00, 40),
--(6, 'Monitor', 'Electronics', 300.00, 20),
--(7, 'Mouse', 'Accessories', 50.00, 60),
--(8, 'Chair', 'Furniture', 200.00, 10),
--(9, 'Desk', 'Furniture', 400.00, 5),
--(10, 'Printer', 'Office Supplies', 250.00, 12),
--(11, 'Scanner', 'Office Supplies', 180.00, 8),
--(12, 'Notebook', 'Stationery', 10.00, 100),
--(13, 'Pen', 'Stationery', 2.00, 500),
--(14, 'Backpack', 'Accessories', 80.00, 30),
--(15, 'Lamp', 'Furniture', 60.00, 25);

-----------------------------------
--SELECT * FROM Products;

-----------------------------------
--SELECT [Name] FROM Products
--WHERE Price> (SELECT AVG(Price) FROM Products)

--------------------------------------------------------------------------------
--16. Find the products that have a stock count lower than the highest stock count.

--SELECT * FROM Products;

-----------------------------------
--SELECT * FROM Products
--WHERE Stock < (SELECT MAX(Stock) FROM Products)

--------------------------------------------------------------------------------
--17. Get the names of products that belong to the same category as 'Laptop'.

--SELECT [Name] FROM Products
--WHERE Category= (SELECT Category FROM Products WHERE [Name]= 'Laptop')

--------------------------------------------------------------------------------
--18. Retrieve products whose price is greater than the lowest price in the 
--		Electronics category.

--SELECT * FROM Products;

-----------------------------------
--SELECT * FROM Products
--WHERE Price > (SELECT MIN(Price) FROM Products WHERE Category= 'Electronics');

--------------------------------------------------------------------------------
--19. Find the products that have a higher price than the average price of their 
--		respective category.

--SELECT * FROM Products;

-----------------------------------
--SELECT * FROM Products p1
--WHERE p1.Price> (SELECT AVG(Price) FROM Products p2 WHERE p2.Category= p1.Category)

--------------------------------------------------------------------------------
--20. Find the products that have been ordered at least once.

--DROP TABLE IF EXISTS Orders;
--GO
--CREATE TABLE Orders (
--    OrderID    INT PRIMARY KEY,
--    ProductID  INT,
--    Quantity   INT,
--    OrderDate  DATE,
--    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
--);

--INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate) VALUES
--(1, 1, 2, '2024-03-01'),
--(2, 3, 5, '2024-03-05'),
--(3, 2, 3, '2024-03-07'),
--(4, 5, 4, '2024-03-10'),
--(5, 8, 1, '2024-03-12'),
--(6, 10, 2, '2024-03-15'),
--(7, 12, 10, '2024-03-18'),
--(8, 7, 6, '2024-03-20'),
--(9, 6, 2, '2024-03-22'),
--(10, 4, 3, '2024-03-25'),
--(11, 9, 2, '2024-03-28'),
--(12, 11, 1, '2024-03-30'),
--(13, 14, 4, '2024-04-02'),
--(14, 15, 5, '2024-04-05'),
--(15, 13, 20, '2024-04-08');

-----------------------------------
--SELECT * FROM Orders;
--SELECT * FROM Products;

-----------------------------------
--SELECT * FROM Products
--WHERE ProductID IN (SELECT ProductID FROM Orders);

--------------------------------------------------------------------------------
--21. Retrieve the names of products that have been ordered more than the average 
--			quantity ordered.

--SELECT * FROM Orders;
--SELECT * FROM Products;

-----------------------------------
--WITH CTE AS
--		(
--		SELECT AVG(Quantity) avg_quan FROM Orders
--		),
--CTE1 AS
--		(
--		SELECT Products.[Name], Orders.Quantity 
--		FROM Products
--		INNER JOIN Orders
--				ON Products.ProductID= Orders.ProductID
--		),
--CTE2 AS
--		(
--		SELECT [Name], SUM(Quantity) total_quan FROM CTE1
--		GROUP BY [Name]
--		)
--SELECT [Name] FROM CTE2
--WHERE total_quan> (SELECT avg_quan FROM CTE)

--------------------------------------------------------------------------------
--22. Find the products that have never been ordered.

--SELECT * FROM Products;
--SELECT * FROM Orders;

-----------------------------------
--SELECT * FROM Products 
--WHERE ProductID NOT IN (SELECT ProductID FROM Orders)

--------------------------------------------------------------------------------
--23. Retrieve the product with the highest total quantity ordered.

--SELECT * FROM Products;
--SELECT * FROM Orders;

-----------------------------------
--WITH CTE AS
--			(
--			SELECT ProductID, SUM(Quantity) total_quan 
--			FROM Orders
--			GROUP BY ProductID
--			),
--CTE1 AS
--			(
--			SELECT ProductID FROM CTE
--			WHERE total_quan= (SELECT MAX(total_quan) FROM CTE)
--			)
--SELECT * FROM Products
--WHERE ProductID= (SELECT ProductID FROM CTE1)


