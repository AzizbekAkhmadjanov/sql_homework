-- Basic-Level Tasks (10)
-- 1. Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
-- CREATE TABLE Employees (
--     EmpID INT,
--     Name VARCHAR(50),
--     Salary DECIMAL(10,2)
-- );


-- 2. Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
-- Single row insert
-- INSERT INTO Employees (EmpID, Name, Salary)
-- VALUES (1, 'Ali', 6000.00);


-- -- Another single row insert
-- INSERT INTO Employees
-- VALUES (2, 'Dilnoza', 5500.00);


-- -- Multiple rows in one query
-- INSERT INTO Employees (EmpID, Name, Salary)
-- VALUES 
-- (3, 'Javohir', 4800.00),
-- (4, 'Malika', 7200.00);


-- 3. Update the Salary of an employee to 7000 where EmpID = 1.
-- UPDATE Employees
-- SET Salary = 7000
-- WHERE EmpID = 1;


-- 4. Delete a record from the Employees table where EmpID = 2.
-- DELETE FROM Employees
-- WHERE EmpID = 2;


-- 5. Give a brief definition for difference between DELETE, TRUNCATE, and DROP.
-- DELETE: Removes specific rows from a table using a condition (WHERE). Table structure remains. Can be rolled back.
-- TRUNCATE: Removes all rows from a table (faster than DELETE). Table structure remains. Cannot use WHERE. Can be rolled back if inside a transaction.
-- DROP: Completely deletes the table structure and data from the database. Cannot be rolled back.


-- 6. Modify the Name column in the Employees table to VARCHAR(100).
-- ALTER TABLE Employees
-- ALTER COLUMN Name VARCHAR(100);


-- 7. Add a new column Department (VARCHAR(50)) to the Employees table.
-- ALTER TABLE Employees
-- ADD Department VARCHAR(50);


-- 8. Change the data type of the Salary column to FLOAT.
-- ALTER TABLE Employees
-- ALTER COLUMN Salary FLOAT;


-- 9. Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).
-- CREATE TABLE Departments (
--     DepartmentID INT PRIMARY KEY,
--     DepartmentName VARCHAR(50)
-- );


-- 10. Remove all records from the Employees table without deleting its structure.
-- TRUNCATE TABLE Employees;


-- Intermediate-Level Tasks (6)
-- 11. Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).
-- INSERT INTO Departments (DepartmentID, DepartmentName)
-- SELECT 1, 'HR' UNION ALL
-- SELECT 2, 'Finance' UNION ALL
-- SELECT 3, 'IT' UNION ALL
-- SELECT 4, 'Sales' UNION ALL
-- SELECT 5, 'Marketing';


-- 12. Update the Department of all employees where Salary > 5000 to 'Management'.
-- UPDATE Employees
-- SET Department = 'Management'
-- WHERE Salary > 5000;


-- 13. Write a query that removes all employees but keeps the table structure intact.
-- TRUNCATE TABLE Employees;


-- 14. Drop the Department column from the Employees table.
-- ALTER TABLE Employees
-- DROP COLUMN Department;


-- 15. Rename the Employees table to StaffMembers using SQL commands.
-- EXEC sp_rename 'Employees', 'StaffMembers';


-- 16. Write a query to completely remove the Departments table from the database.
-- DROP TABLE Departments;


-- Advanced-Level Tasks (9)
-- 17. Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
-- CREATE TABLE Products (
--     ProductID INT PRIMARY KEY,
--     ProductName VARCHAR(100),
--     Category VARCHAR(50),
--     Price DECIMAL(10,2),
--     Supplier VARCHAR(100)
-- );


-- 18. Add a CHECK constraint to ensure Price is always greater than 0.
-- ALTER TABLE Products
-- ADD CONSTRAINT CHK_Price CHECK (Price > 0);


-- 19. Modify the table to add a StockQuantity column with a DEFAULT value of 50.
-- ALTER TABLE Products
-- ADD StockQuantity INT DEFAULT 50;


-- 20. Rename Category to ProductCategory
-- EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';


-- 21. Insert 5 records into the Products table using standard INSERT INTO queries.
-- INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Supplier)
-- VALUES
-- (1, 'Laptop', 'Electronics', 1200.00, 'Dell'),
-- (2, 'Phone', 'Electronics', 800.00, 'Samsung'),
-- (3, 'Table', 'Furniture', 150.00, 'IKEA'),
-- (4, 'Book', 'Stationery', 20.00, 'Oxford Press'),
-- (5, 'Shoes', 'Fashion', 75.00, 'Nike');


-- 22. Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
-- SELECT *
-- INTO Products_Backup
-- FROM Products;


-- 23. Rename the Products table to Inventory.
-- EXEC sp_rename 'Products', 'Inventory';


-- 24. Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
-- ALTER TABLE Inventory
-- ALTER COLUMN Price FLOAT;


-- 25. Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.
-- ALTER TABLE Inventory
-- ADD ProductCode INT IDENTITY(1000, 5);
