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













