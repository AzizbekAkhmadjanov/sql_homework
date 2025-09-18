
--CREATE DATABASE HOMETASK3;

---------------------------------------------------------------------------------
--USE HOMETASK3;

---------------------------------------------------------------------------------
-- LESSON 3: Importing and Exporting Data (SQL Server)

--EASY-LEVEL TASKS (10) 


--1. Define and explain the purpose of BULK INSERT in SQL Server
--   BULK INSERT is used to quickly load large amounts of data
--   from external files (CSV, TXT, etc.) into a SQL Server table. 

-----------------------------------------------------------------------------------------------------------------
--2. List four file formats that can be imported into SQL Server:
--   - CSV (Comma-Separated Values)
--   - TXT (Text files, fixed-width or delimited)
--   - Excel (.xls, .xlsx)
--   - XML / JSON 

-----------------------------------------------------------------------------------------------------------------
--3. Create a table Products with columns: ProductID (INT, PRIMARY KEY), 
-- ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
--DROP TABLE IF EXISTS Products;
--CREATE TABLE Products (
--	ProductID INT PRIMARY KEY,
--	ProductName VARCHAR(50),
--	Price DECIMAL(10,2)
--);
--SELECT * FROM Products;


-----------------------------------------------------------------------------------------------------------------
--4. Insert three records into the Products table using INSERT INTO.
--SELECT * FROM Products;
--INSERT INTO Products (ProductID, ProductName, Price) 
--VALUES  (1, 'Laptop', 1200.00),
--		(2, 'Phone', 800.00),
--		(3, 'Tablet', 450.00);
--SELECT * FROM Products;

-----------------------------------------------------------------------------------------------------------------
--5. Explain the difference between NULL and NOT NULL.
--   - NULL: Means the column can store unknown/empty values.
--   - NOT NULL: Forces every row to have a value in that column. 

-----------------------------------------------------------------------------------------------------------------
--6. Add a UNIQUE constraint to the ProductName column in the Products table.
--ALTER TABLE Products
--ADD CONSTRAINT UQ_ProductName UNIQUE(ProductName);


-----------------------------------------------------------------------------------------------------------------
--7. Write a comment in a SQL query explaining its purpose.
---- This query selects all products from the Products table.
--SELECT * FROM Products;

-----------------------------------------------------------------------------------------------------------------
--8. Add CategoryID column to Products 
--SELECT * FROM Products;
--ALTER TABLE Products
--ADD CategoryID INT;
--SELECT * FROM Products;

-----------------------------------------------------------------------------------------------------------------
--9. Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
--CREATE TABLE Categories (
--	CategoryID INT PRIMARY KEY,
--	CategoryName VARCHAR(50) UNIQUE
--);
--SELECT * FROM Categories;

-----------------------------------------------------------------------------------------------------------------
--10. Explain the purpose of the IDENTITY column in SQL Server.
--   - Automatically generates incremental numbers for primary keys.
--   - Useful when inserting rows without manually specifying IDs. 

-----------------------------------------------------------------------------------------------------------------

--MEDIUM-LEVEL TASKS (10) 

--11. Use BULK INSERT to import data from a text file into the Products table. 
--SELECT * FROM Products;
--BULK INSERT Products
--FROM 'D:\MAAB\products for homework 3.txt'
--WITH (
--    FIELDTERMINATOR = ',',
--    ROWTERMINATOR = '\n',
--    FIRSTROW = 2
--);
--SELECT * FROM Products;
-----------------------------------------------------------------------------------------------------------------

--12. Create a FOREIGN KEY in the Products table that references the Categories table.

--------------------------needed
--SELECT * FROM Products;
--UPDATE Products
--SET CategoryID= 2
--WHERE ProductID<4;
--SELECT * FROM Products;

--------------------------needed
--SELECT * FROM Categories;
--INSERT INTO Categories (CategoryID, CategoryName)
--VALUES  (1, 'Electronics'),
--		(2, 'Accessories');
--SELECT * FROM Categories;

--------------------------needed
--SELECT * FROM Products;
--SELECT * FROM Categories;
--ALTER TABLE Products
--ADD CONSTRAINT Fk FOREIGN KEY(CategoryID) REFERENCES Categories(CategoryID);

-----------------------------------------------------------------------------------------------------------------
--13. Explain the differences between PRIMARY KEY and UNIQUE KEY.
--   - PRIMARY KEY: Ensures uniqueness + NOT NULL. Only one per table.
--   - UNIQUE KEY: Ensures uniqueness but allows one NULL. Multiple per table. 

-----------------------------------------------------------------------------------------------------------------
--14. Add a CHECK constraint to the Products table ensuring Price > 0.
--SELECT * FROM Products;

--ALTER TABLE Products
--ADD CONSTRAINT CHK_Price CHECK(Price>0);

-----------------------------------------------------------------------------------------------------------------
--15. Modify the Products table to add a column Stock (INT, NOT NULL).
--SELECT * FROM Products;

--ALTER TABLE Products
--ADD Stock INT NOT NULL DEFAULT 0;
--SELECT * FROM Products;

-----------------------------------------------------------------------------------------------------------------
--16. Use the ISNULL function to replace NULL values in Price column with a 0.
--SELECT * FROM Products;

--SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price, CategoryID, Stock
--FROM Products;

-----------------------------------------------------------------------------------------------------------------
--17. Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
--   - Maintains referential integrity.
--   - Ensures values in child table exist in parent table. 
-----------------------------------------------------------------------------------------------------------------

--🔴 HARD-LEVEL TASKS (10) 

--18. Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.
--CREATE TABLE Customers (
--	CustomerID INT,
--	CustomerName VARCHAR(50),
--	Age INT CHECK (Age>=18) 
--);
--SELECT * FROM Customers;

---------------------------------------------------------------------------------------
--19. Create a table with an IDENTITY column starting at 100 and incrementing by 10.
--CREATE TABLE Orders (
--	OrderID INT IDENTITY(100, 10) PRIMARY KEY,
--	OrderName VARCHAR(50) NOT NULL
--);
--SELECT * FROM Orders;

---- Insert sample data
--INSERT INTO Orders (OrderName) VALUES ('First Order');
--INSERT INTO Orders (OrderName) VALUES ('Second Order');
--INSERT INTO Orders (OrderName) VALUES ('Third Order');

---- View results
--SELECT * FROM Orders;

-------------------------------------------------------------------------
--20. Composite PRIMARY KEY in OrderDetails 
--DROP TABLE IF EXISTS OrderDetails;

--CREATE TABLE OrderDetails (
--	OrderID INT NOT NULL,
--	ProductID INT NOT NULL, 
--	Quantity INT CHECK (Quantity>0),
--	PRIMARY KEY(OrderID, ProductID) -- Composite Primary Key
--);
--SELECT * FROM OrderDetails;

--INSERT INTO OrderDetails (OrderID, ProductID, Quantity) 
--VALUES (1, 101, 2), 
--       (1, 102, 5), 
--       (2, 101, 1);

--SELECT * FROM OrderDetails;

-----------------------------------------------------------------------------------------------------------------
 --21. Explain the use of COALESCE and ISNULL functions for handling NULL values.
 --  - ISNULL(expr, replacement): Returns replacement if expr is NULL (SQL Server specific).
 --  - COALESCE(expr1, expr2, ...): Returns first non-NULL value (ANSI standard). 

-----------------------------------------------------------------------------------------------------------------
--22. Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
--CREATE TABLE Employees(
--	EmpID INT PRIMARY KEY,
--	EmpName VARCHAR(50) NOT NULL, 
--	Email VARCHAR(50) UNIQUE,
--	Age INT CHECK (Age>=18)
--);
--SELECT * FROM Employees;


--INSERT INTO Employees (EmpID, EmpName, Email, Age)
--VALUES (1, 'Azizbek', 'azizbek@example.com', 23),
--       (2, 'John', 'john@example.com', 30);

---- This will fail because Email must be unique
--INSERT INTO Employees (EmpID, EmpName, Email, Age)
--VALUES (3, 'Ali', 'john@example.com', 25);

-----------------------------------------------------------------------------------------------------------------
--23. Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
-- Drop tables if they exist (child first, then parent)
--DROP TABLE IF EXISTS OrderDetails;
--DROP TABLE IF EXISTS Orders;
-----------------------------

-- Parent table
--CREATE TABLE Orders (
--	OrderID INT PRIMARY KEY,
--	OrderDate DATE
--);

-- Child table with FOREIGN KEY
--CREATE TABLE OrderDetails (
--	OrderDetailID INT PRIMARY KEY,
--	OrderID INT, 
--	ProductName VARCHAR(50),
--	Quantity INT CHECK(Quantity>0),
--	CONSTRAINT FK_Order_OrderDetails
--		FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
--		ON DELETE CASCADE
--		ON UPDATE CASCADE
--);


---- Insert into Orders
--SELECT * FROM Orders;
--INSERT INTO Orders (OrderID, OrderDate) VALUES (1, '2025-09-18');
--SELECT * FROM Orders;

---- Insert into OrderDetails
--SELECT * FROM OrderDetails;
--INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductName, Quantity)
--VALUES (101, 1, 'Laptop', 2),
--       (102, 1, 'Phone', 3);
--SELECT * FROM OrderDetails;

---- Delete from Orders (cascades to OrderDetails)
--DELETE FROM Orders WHERE OrderID = 1;

--SELECT * FROM Orders;
--SELECT * FROM OrderDetails;  -- will be empty

