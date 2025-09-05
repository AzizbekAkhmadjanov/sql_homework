----------------------------------------------------
-- LESSON 3: Importing and Exporting Data (SQL Server)
----------------------------------------------------

/* 🟢 EASY-LEVEL TASKS (10) */

/* 1. Define and explain the purpose of BULK INSERT in SQL Server
   BULK INSERT is used to quickly load large amounts of data
   from external files (CSV, TXT, etc.) into a SQL Server table. */

/* 2. List four file formats that can be imported into SQL Server:
   - CSV (Comma-Separated Values)
   - TXT (Text files, fixed-width or delimited)
   - Excel (.xls, .xlsx)
   - XML / JSON */

/* 3. Create Products table */
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

/* 4. Insert three records */
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Phone', 800.00),
(3, 'Tablet', 450.00);

/* 5. Difference between NULL and NOT NULL
   - NULL: Means the column can store unknown/empty values.
   - NOT NULL: Forces every row to have a value in that column. */

/* 6. Add UNIQUE constraint on ProductName */
ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

/* 7. Example of SQL Comment */
-- This query selects all products from the Products table.
SELECT * FROM Products;

/* 8. Add CategoryID column to Products */
ALTER TABLE Products
ADD CategoryID INT NULL;

/* 9. Create Categories table */
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

/* 10. Purpose of IDENTITY column
   - Automatically generates incremental numbers for primary keys.
   - Useful when inserting rows without manually specifying IDs. */


/* 🟠 MEDIUM-LEVEL TASKS (10) */

/* 11. BULK INSERT (example with CSV file) */
BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

/* 12. Add FOREIGN KEY constraint */
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

/* 13. PRIMARY KEY vs UNIQUE KEY
   - PRIMARY KEY: Ensures uniqueness + NOT NULL. Only one per table.
   - UNIQUE KEY: Ensures uniqueness but allows one NULL. Multiple per table. */

/* 14. CHECK constraint ensuring Price > 0 */
ALTER TABLE Products
ADD CONSTRAINT CHK_Price CHECK (Price > 0);

/* 15. Add Stock column (NOT NULL) */
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

/* 16. Use ISNULL to replace NULL Price with 0 */
SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;

/* 17. Purpose of FOREIGN KEY
   - Maintains referential integrity.
   - Ensures values in child table exist in parent table. */


/* 🔴 HARD-LEVEL TASKS (10) */

/* 18. Customers table with CHECK Age >= 18 */
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 18)
);

/* 19. Table with IDENTITY (start=100, increment=10) */
CREATE TABLE AutoNumbers (
    ID INT IDENTITY(100, 10) PRIMARY KEY,
    Description VARCHAR(50)
);

/* 20. Composite PRIMARY KEY in OrderDetails */
CREATE TABLE OrderDetails (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderID, ProductID)
);

/* 21. COALESCE vs ISNULL
   - ISNULL(expr, replacement): Returns replacement if expr is NULL (SQL Server specific).
   - COALESCE(expr1, expr2, ...): Returns first non-NULL value (ANSI standard). */

/* 22. Employees table with PRIMARY KEY and UNIQUE KEY */
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE
);

/* 23. FOREIGN KEY with ON DELETE CASCADE & ON UPDATE CASCADE */
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
