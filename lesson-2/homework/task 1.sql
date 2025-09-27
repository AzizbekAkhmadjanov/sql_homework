
--CREATE DATABASE HOMETASK2;
--GO
--USE HOMETASK2;

----------------------------------------------------------------------------
-- Basic-Level Tasks (10)
-- 1. Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), 
--	and Salary (DECIMAL(10,2)).

--DROP TABLE IF EXISTS Employees 
--CREATE TABLE Employees	(
--	EmpID INT,
--	[Name] VARCHAR(50),
--	Salary DECIMAL(10, 2));
--SELECT * FROM Employees;

----------------------------------------------------------------------------
-- 2. Insert three records into the Employees table using different INSERT 
--	INTO approaches (single-row insert and multiple-row insert).

-----------------------------Single row insert
--SELECT * FROM Employees;

--INSERT INTO Employees (EmpID, Name, Salary)
--VALUES  (1, 'Akbar', 32.43);
--SELECT * FROM Employees;

-----------------------------Another single row insert
--SELECT * FROM Employees;

--INSERT INTO Employees
--VALUES (2, 'Barno', 30.48);
--SELECT * FROM Employees;

-----------------------------Multiple rows in one query
--SELECT * FROM Employees;

--INSERT INTO Employees (EmpID, Name, Salary)
--VALUES  (3, 'Azamat', 12.57),
--		(4, 'Dilnoza', 5500.00),
--		(5, 'Javohir', 4800.00),
--		(6, 'Malika', 7200.00);
--SELECT * FROM Employees;

----------------------------------------------------------------------------
--3. Update the Salary of an employee to 7000 where EmpID = 1.

--SELECT * FROM Employees;

--UPDATE Employees
--SET Salary= 7000
--WHERE EmpID=1
--SELECT * FROM Employees;

----------------------------------------------------------------------------
--4. Delete a record from the Employees table where EmpID = 2.

--SELECT * FROM Employees;

--DELETE Employees
--WHERE EmpID=2
--SELECT * FROM Employees;

----------------------------------------------------------------------------
--5. Give a brief definition for difference between DELETE, TRUNCATE, and DROP.

-- DELETE: Removes specific rows from a table using a condition (WHERE). 
--	Table structure remains. Can be rolled back.

-----------------------------
-- TRUNCATE: Removes all rows from a table (faster than DELETE). 
--	Table structure remains. Cannot use WHERE. 
--	Can be rolled back if inside a transaction.

-----------------------------
-- DROP: Completely deletes the table structure and data from the database. Cannot be rolled back.

----------------------------------------------------------------------------
--6. Modify the Name column in the Employees table to VARCHAR(100).

--SELECT * FROM Employees;

--ALTER TABLE Employees
--ALTER COLUMN [Name] VARCHAR(100);
--SELECT * FROM Employees;

----------------------------------------------------------------------------
--7. Add a new column Department (VARCHAR(50)) to the Employees table.

--SELECT * FROM Employees;

--ALTER TABLE Employees
--ADD Department VARCHAR(50)
--SELECT * FROM Employees;

----------------------------------------------------------------------------
--8. Change the data type of the Salary column to FLOAT.

--ALTER TABLE Employees
--ALTER COLUMN Salary FLOAT;

----------------------------------------------------------------------------
--9. Create another table Departments with columns DepartmentID (INT, PRIMARY KEY)
--	and DepartmentName (VARCHAR(50)).

--DROP TABLE IF EXISTS Departments;

--CREATE TABLE Departments (
--	DepartmentID INT PRIMARY KEY,
--	DepartmentName VARCHAR(50)
--);
--SELECT * FROM Departments;

----------------------------------------------------------------------------
--10. Remove all records from the Employees table without deleting its structure.

--SELECT * FROM Employees;

--TRUNCATE TABLE Employees;

--SELECT * FROM Employees;

----------------------------------------------------------------------------
-- Intermediate-Level Tasks (6)
--11. Insert five records into the Departments table using INSERT INTO SELECT
--	method(you can write anything you want as data).

--SELECT * FROM Departments;

--INSERT INTO Departments (DepartmentID, DepartmentName)
--SELECT 1, 'HR' 
--UNION ALL
--SELECT 2, 'Finance' 
--UNION ALL 
--SELECT 3, 'IT' 
--UNION ALL
--SELECT 4, 'Sales' 
--UNION ALL
--SELECT 5, 'Marketing';

--SELECT * FROM Departments;

----------------------------------------------------------------------------
--12. Update the Department of all employees where Salary > 5000 to 'Management'.

--SELECT * FROM Employees;
--INSERT INTO Employees (EmpID, Name, Salary, Department)
--SELECT 1001, 'Alice Johnson', 75000.00, 'Sales & Marketing'
--UNION ALL
--SELECT 1002, 'Bob Williams', 85000.00, 'Research & Development'
--UNION ALL
--SELECT 1003, 'Charlie Brown', 62000.00, 'Human Resources'
--UNION ALL
--SELECT 1004, 'Diana Prince', 95000.00, 'Finance & Accounting'
--UNION ALL
--SELECT 1005, 'Evan Smith', 55000.00, 'Customer Support'
--UNION ALL
--SELECT 1006, 'Fiona Glen', 82000.00, 'Sales & Marketing'
--UNION ALL
--SELECT 1007, 'George King', 110000.00, 'Research & Development'
--UNION ALL
--SELECT 1008, 'Hannah Lee', 65000.00, 'Human Resources'
--UNION ALL
--SELECT 1009, 'Ivy Chen', 98000.00, 'Finance & Accounting'
--UNION ALL
--SELECT 1010, 'Jack Miller', 58000.00, 'Customer Support';

--SELECT * FROM Employees;
-----------------------------
--SELECT * FROM Employees;

--UPDATE Employees
--SET Department = 'Management'
--WHERE Salary > 5000;

--SELECT * FROM Employees;

----------------------------------------------------------------------------
--13. Write a query that removes all employees but keeps the table structure intact.

--SELECT * FROM Employees;

--TRUNCATE TABLE Employees;

--SELECT * FROM Employees;

----------------------------------------------------------------------------
--14. Drop the Department column from the Employees table.

--SELECT * FROM Employees;

--ALTER TABLE Employees
--DROP COLUMN Department;

--SELECT * FROM Employees;

----------------------------------------------------------------------------
--15. Rename the Employees table to StaffMembers using SQL commands.

--EXEC sp_rename 'Employees', 'StaffMembers';

--SELECT * FROM StaffMembers;

----------------------------------------------------------------------------
--16. Write a query to completely remove the Departments table from the database.

--DROP TABLE Departments;

--SELECT * FROM Departments; ----------------------------- Invalid object name 'Departments'.

----------------------------------------------------------------------------
-- Advanced-Level Tasks (9)

--17. Create a table named Products with at least 5 columns, including: 
--	  ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)

--DROP TABLE IF EXISTS Products;

--CREATE TABLE Products (
--    ProductID INT PRIMARY KEY,
--    ProductName VARCHAR(100),
--    Category VARCHAR(50),
--    Price DECIMAL(10,2),
--    Supplier VARCHAR(100)
--);
--SELECT * FROM Products;

----------------------------------------------------------------------------
--18. Add a CHECK constraint to ensure Price is always greater than 0.

--ALTER TABLE Products
--ADD CONSTRAINT CHK_Price CHECK (Price > 0);

----------------------------------------------------------------------------
--19. Modify the table to add a StockQuantity column with a DEFAULT value of 50.

--SELECT * FROM Products;

--ALTER TABLE Products
--ADD StockQuantity INT DEFAULT 50;

--SELECT * FROM Products;

----------------------------------------------------------------------------
--20. Rename Category to ProductCategory

--SELECT * FROM Products;

--EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

--SELECT * FROM Products;

----------------------------------------------------------------------------
--21. Insert 5 records into the Products table using standard INSERT INTO queries.

--SELECT * FROM Products;

--INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Supplier)
--VALUES
--		(1, 'Laptop', 'Electronics', 1200.00, 'Dell'),
--		(2, 'Phone', 'Electronics', 800.00, 'Samsung'),
--		(3, 'Table', 'Furniture', 150.00, 'IKEA'),
--		(4, 'Book', 'Stationery', 20.00, 'Oxford Press'),
--		(5, 'Shoes', 'Fashion', 75.00, 'Nike')

--SELECT * FROM Products;

----------------------------------------------------------------------------
--22. Use SELECT INTO to create a backup table called Products_Backup containing
--	all Products data.

--DROP TABLE IF EXISTS Products_Backup;

--SELECT *
--INTO Products_Backup
--FROM Products;

--SELECT * FROM Products_Backup;

----------------------------------------------------------------------------
--23. Rename the Products table to Inventory.

--EXEC sp_rename 'Products', 'Inventory';
--SELECT * FROM Inventory;

----------------------------------------------------------------------------
--24. Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.

--ALTER TABLE Inventory
--DROP CONSTRAINT CHK_Price;

--SELECT * FROM Inventory;

--ALTER TABLE Inventory
--ALTER COLUMN Price FLOAT;

--SELECT * FROM Inventory;

----------------------------------------------------------------------------
--25. Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.

--SELECT * FROM Inventory;

--ALTER TABLE Inventory
--ADD ProductCode INT IDENTITY(1000, 5);

--SELECT * FROM Inventory;
