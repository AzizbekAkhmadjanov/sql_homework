-- 1. Define the following terms: data, database, relational database, and table.
-- Data: Raw facts or figures that by themselves may not have meaning (e.g., numbers, text, dates).

-- Database: An organized collection of data that can be easily accessed, managed, and updated.

-- Relational Database: A type of database that stores data in tables (relations), where rows represent records and columns represent attributes. Relationships are defined using keys.

-- Table: A structured format within a database that consists of rows (records) and columns (fields/attributes).



-- 2. List five key features of SQL Server.
-- Scalability and Performance – Handles small to enterprise-level applications efficiently.

-- Security – Supports authentication, encryption, and role-based access control.

-- High Availability & Disaster Recovery – Features like Always On, log shipping, and mirroring.

-- Integration Services – Supports ETL (Extract, Transform, Load) processes.

-- Advanced Analytics & Reporting – Built-in tools like SQL Server Reporting Services (SSRS) and Machine Learning Services.




-- 3. What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
-- Windows Authentication – Uses Windows user accounts for secure login (preferred).

-- SQL Server Authentication – Uses SQL Server–specific username and password.



-- 4. Create a new database in SSMS named SchoolDB.
-- CREATE DATABASE SchoolDB;
-- USE SchoolDB;

-- 5. Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
-- CREATE TABLE Students (
--     StudentID INT PRIMARY KEY,
--     Name VARCHAR(50),
--     Age INT
-- );


-- 6. Describe the differences between SQL Server, SSMS, and SQL.
-- SQL Server: A Database Management System (DBMS) developed by Microsoft. It is the actual engine that stores, processes, and secures data.

-- SSMS (SQL Server Management Studio): A graphical user interface (GUI) tool to connect, manage, and interact with SQL Server. Provides features like query editor, database design, backup/restore, and monitoring.

-- SQL (Structured Query Language): The language used to interact with relational databases. It is standardized (ANSI SQL), though SQL Server has its own extensions (T-SQL).




-- 7. Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
-- SQL commands are classified into five main categories:

-- 1. DQL – Data Query Language

-- Purpose: Retrieve data from the database.

-- Example:

-- SELECT Name, Age FROM Students;

-- 2. DML – Data Manipulation Language

-- Purpose: Manage data inside tables (Insert, Update, Delete).

-- Examples:

-- INSERT INTO Students (StudentID, Name, Age)
-- VALUES (1, 'Ali', 20);

-- UPDATE Students
-- SET Age = 21
-- WHERE StudentID = 1;

-- DELETE FROM Students
-- WHERE StudentID = 1;

-- 3. DDL – Data Definition Language

-- Purpose: Define and manage database structure (tables, schemas).

-- Examples:

-- CREATE TABLE Courses (
--     CourseID INT PRIMARY KEY,
--     CourseName VARCHAR(50)
-- );

-- ALTER TABLE Students ADD Grade VARCHAR(5);

-- DROP TABLE Courses;

-- 4. DCL – Data Control Language

-- Purpose: Control access to data and permissions.

-- Examples:

-- GRANT SELECT ON Students TO User1;
-- REVOKE SELECT ON Students FROM User1;

-- 5. TCL – Transaction Control Language

-- Purpose: Manage transactions (commit, rollback, savepoint).

-- Examples:

-- BEGIN TRANSACTION;

-- UPDATE Students SET Age = 22 WHERE StudentID = 2;

-- ROLLBACK;  -- Undo changes

-- COMMIT;    -- Save change

-- 8. Write a query to insert three records into the Students table.
-- INSERT INTO Students (StudentID, Name, Age)
-- VALUES 
-- (1, 'Ali', 20),
-- (2, 'Dilnoza', 22),
-- (3, 'Javohir', 19);


-- 9. Restore AdventureWorksDW2022.bak file to your server. (write its steps to submit) You can find the database from this link :https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak
-- To restore the AdventureWorksDW2022.bak database in SQL Server Management Studio (SSMS), we followed these steps:

-- We copied the AdventureWorksDW2022.bak file into the default SQL Server backup folder:

-- C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup

-- We opened SQL Server Management Studio (SSMS) and connected to our SQL Server instance.

-- In Object Explorer, we right-clicked on Databases and selected Restore Database...

-- In the Restore Database dialog:

-- We chose Device → clicked Browse (...) → Add.

-- We navigated to the backup folder and selected the file AdventureWorksDW2022.bak.

-- In the Destination section, we made sure the database name was set to AdventureWorksDW2022.

-- In the Files tab, we verified that the database and log file paths were correct.

-- We clicked OK to start the restore process.

-- After the restore completed successfully, we expanded the Databases node in Object Explorer and confirmed that AdventureWorksDW2022 appeared in the list.







