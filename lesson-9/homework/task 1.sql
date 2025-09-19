--Easy (10 puzzles)

--1. Using Products, Suppliers table List all combinations of product names and supplier names.
--SELECT 
--    p.ProductName,   -- product name from Products table
--    s.SupplierName   -- supplier name from Suppliers table
--FROM Products p
--INNER JOIN Suppliers s   -- join ensures only products with valid suppliers are shown
--    ON p.SupplierID = s.SupplierID;

-------------------------------------------------------------------------------
--2. Using Departments, Employees table Get all combinations of departments and employees.
--SELECT 
--    e.Name AS EmployeeName,     -- employee name from Employees table
--    d.DepartmentName            -- department name from Departments table
--FROM Employees e
--INNER JOIN Departments d        -- join ensures only employees with valid departments are shown
--    ON e.DepartmentID = d.DepartmentID;

-------------------------------------------------------------------------------
--3. Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name
--SELECT 
--    s.SupplierName,   -- supplier name from Suppliers table
--    p.ProductName     -- product name from Products table
--FROM Products p
--INNER JOIN Suppliers s   -- inner join ensures only existing supplier-product matches
--    ON p.SupplierID = s.SupplierID;

-------------------------------------------------------------------------------
--4. Using Orders, Customers table List customer names and their orders ID.
--SELECT 
--    c.FirstName + ' ' + c.LastName AS CustomerName,  -- combine first and last name
--    o.OrderID                                       -- order ID from Orders table
--FROM Customers c
--INNER JOIN Orders o   -- join ensures only customers with valid orders are shown
--    ON c.CustomerID = o.CustomerID;

-------------------------------------------------------------------------------
--5. Using Courses, Students table Get all combinations of students and courses.
--SELECT 
--    s.Name AS StudentName,    -- student name from Students table
--    c.CourseName              -- course name from Courses table
--FROM Students s
--CROSS JOIN Courses c;         -- cross join creates all student-course pairs

-------------------------------------------------------------------------------
--6. Using Products, Orders table Get product names and orders where product IDs match.
--SELECT 
--    p.ProductName,    -- product name from Products table
--    o.OrderID         -- order ID from Orders table
--FROM Products p
--INNER JOIN Orders o   -- join ensures only orders with valid product IDs are shown
--    ON p.ProductID = o.ProductID;

-------------------------------------------------------------------------------
--7. Using Departments, Employees table List employees whose DepartmentID matches the department.
--SELECT 
--    e.Name AS EmployeeName,     -- employee name from Employees table
--    d.DepartmentName            -- department name from Departments table
--FROM Employees e
--INNER JOIN Departments d        -- inner join ensures only valid matches
--    ON e.DepartmentID = d.DepartmentID;

-------------------------------------------------------------------------------
--8. Using Students, Enrollments table List student names and their enrolled course IDs.
--SELECT 
--    s.Name AS StudentName,    -- student name from Students table
--    e.CourseID                -- course ID from Enrollments table
--FROM Students s
--INNER JOIN Enrollments e      -- join ensures only enrolled students appear
--    ON s.StudentID = e.StudentID;

-------------------------------------------------------------------------------
--9. Using Payments, Orders table List all orders that have matching payments.
--SELECT 
--    o.OrderID,        -- order ID from Orders table
--    p.PaymentID,      -- payment ID from Payments table
--    p.Amount          -- payment amount (extra useful info)
--FROM Orders o
--INNER JOIN Payments p   -- join ensures only orders with payments are shown
--    ON o.OrderID = p.OrderID;

-------------------------------------------------------------------------------
--10. Using Orders, Products table Show orders where product price is more than 100.
--SELECT 
--    o.OrderID,        -- order ID from Orders table
--    p.ProductName,    -- product name from Products table
--    p.Price           -- product price for clarity
--FROM Orders o
--INNER JOIN Products p   -- join orders with their products
--    ON o.ProductID = p.ProductID
--WHERE p.Price > 100;    -- filter condition: only products priced above 100

-------------------------------------------------------------------------------
--Medium (10 puzzles)
--11. Using Employees, Departments table List employee names and department names where department IDs are not equal. It means: Show all mismatched employee-department combinations.
--SELECT 
--    e.Name AS EmployeeName,      -- employee name from Employees table
--    d.DepartmentName             -- department name from Departments table
--FROM Employees e
--CROSS JOIN Departments d         -- generate all employee-department combinations
--WHERE e.DepartmentID <> d.DepartmentID;   -- keep only mismatches

-------------------------------------------------------------------------------
--12. Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.
--SELECT 
--    o.OrderID,            -- order ID from Orders table
--    p.ProductName,        -- product name from Products table
--    o.Quantity,           -- quantity ordered
--    p.StockQuantity       -- stock available
--FROM Orders o
--INNER JOIN Products p     -- join orders with their products
--    ON o.ProductID = p.ProductID
--WHERE o.Quantity > p.StockQuantity;   -- filter: ordered > stock


-------------------------------------------------------------------------------
--13. Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.
--SELECT 
--    c.FirstName + ' ' + c.LastName AS CustomerName,  -- full name from Customers table
--    s.ProductID,                                    -- product ID from Sales table
--    s.SaleAmount                                    -- included for clarity
--FROM Customers c
--INNER JOIN Sales s    -- join customers with their sales
--    ON c.CustomerID = s.CustomerID
--WHERE s.SaleAmount >= 500;   -- filter: only sales of 500 or more

-------------------------------------------------------------------------------
--14. Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.
--SELECT 
--    s.Name AS StudentName,     -- student name from Students table
--    c.CourseName               -- course name from Courses table
--FROM Students s
--INNER JOIN Enrollments e       -- link students to their enrollments
--    ON s.StudentID = e.StudentID
--INNER JOIN Courses c           -- link enrollments to courses
--    ON e.CourseID = c.CourseID;

-------------------------------------------------------------------------------
--15. Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.
--SELECT 
--    p.ProductName,       -- product name from Products table
--    s.SupplierName       -- supplier name from Suppliers table
--FROM Products p
--INNER JOIN Suppliers s   -- join products with their suppliers
--    ON p.SupplierID = s.SupplierID
--WHERE s.SupplierName LIKE '%Tech%';   -- filter: supplier name contains 'Tech'

-------------------------------------------------------------------------------
--16. Using Orders, Payments table Show orders where payment amount is less than total amount.
--SELECT 
--    o.OrderID,          -- order ID from Orders table
--    o.TotalAmount,      -- total amount due
--    p.Amount AS Paid    -- actual paid amount
--FROM Orders o
--INNER JOIN Payments p   -- join orders with their payments
--    ON o.OrderID = p.OrderID
--WHERE p.Amount < o.TotalAmount;   -- filter: payment is less than total

-------------------------------------------------------------------------------
--17. Using Employees and Departments tables, get the Department Name for each employee.
--SELECT 
--    e.Name AS EmployeeName,     -- employee name
--    d.DepartmentName            -- department name from Departments
--FROM Employees e
--INNER JOIN Departments d        -- match employees with departments
--    ON e.DepartmentID = d.DepartmentID;


-------------------------------------------------------------------------------
--18. Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.
--SELECT
--  P.ProductName,
--  C.CategoryName
--FROM Products AS P
--INNER JOIN Categories AS C
--  ON P.Category = C.CategoryID
--WHERE
--  C.CategoryName IN ('Electronics', 'Furniture');


-------------------------------------------------------------------------------
--19. Using Sales, Customers table Show all sales from customers who are from 'USA'.
--SELECT 
--    s.SaleID,
--    s.ProductID,
--    s.CustomerID,
--    s.SaleDate,
--    s.SaleAmount,
--    (c.FirstName + ' ' + c.LastName) AS CustomerName,
--    c.Country
--FROM Sales s
--INNER JOIN Customers c
--    ON s.CustomerID = c.CustomerID
--WHERE c.Country = 'USA';


-------------------------------------------------------------------------------
--20. Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.
--SELECT 
--    o.OrderID,
--    o.CustomerID,
--    o.TotalAmount,
--    o.OrderDate,
--    (c.FirstName + ' ' + c.LastName) AS CustomerName,
--    c.Country
--FROM Orders o
--INNER JOIN Customers c
--    ON o.CustomerID = c.CustomerID
--WHERE c.Country = 'Germany'
--  AND o.TotalAmount > 100;

-------------------------------------------------------------------------------
--21. Using Employees table List all pairs of employees from different departments.
--SELECT 
--    e1.Name AS Employee1,
--    e1.DepartmentID AS Dept1,
--    e2.Name AS Employee2,
--    e2.DepartmentID AS Dept2
--FROM Employees e1
--INNER JOIN Employees e2
--    ON e1.EmployeeID < e2.EmployeeID   -- prevent duplicate and self-pair
--WHERE e1.DepartmentID <> e2.DepartmentID;

-------------------------------------------------------------------------------
--22. Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).
--SELECT 
--    p.PaymentID,
--    p.OrderID,
--    p.PaymentDate,
--    p.Amount AS PaidAmount,
--    (o.Quantity * pr.Price) AS ExpectedAmount,
--    pr.ProductName,
--    o.Quantity,
--    pr.Price
--FROM Payments p
--INNER JOIN Orders o
--    ON p.OrderID = o.OrderID
--INNER JOIN Products pr
--    ON o.ProductID = pr.ProductID
--WHERE p.Amount <> (o.Quantity * pr.Price);

-------------------------------------------------------------------------------
--23. Using Students, Enrollments, Courses table Find students who are not enrolled in any course.
---- We use a LEFT JOIN from Students to Enrollments
---- If no enrollment exists, EnrollmentID will be NULL → those students are not enrolled

--SELECT 
--    s.StudentID,
--    s.Name,
--    s.Age,
--    s.Major
--FROM Students s
--LEFT JOIN Enrollments e
--    ON s.StudentID = e.StudentID
--WHERE e.EnrollmentID IS NULL;
-------------------------------------------------------------------------------
--24. Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage.
--SELECT 
--    e1.EmployeeID AS ManagerID,
--    e1.Name AS ManagerName,
--    e1.Salary AS ManagerSalary,
--    e2.EmployeeID AS EmployeeID,
--    e2.Name AS EmployeeName,
--    e2.Salary AS EmployeeSalary
--FROM Employees e1
--INNER JOIN Employees e2
--    ON e1.EmployeeID = e2.ManagerID
--WHERE e1.Salary <= e2.Salary;

-------------------------------------------------------------------------------
--25. Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.
--SELECT 
--    c.CustomerID,
--    (c.FirstName + ' ' + c.LastName) AS CustomerName,
--    o.OrderID,
--    o.TotalAmount,
--    o.OrderDate
--FROM Customers c
--INNER JOIN Orders o
--    ON c.CustomerID = o.CustomerID
--LEFT JOIN Payments p
--    ON o.OrderID = p.OrderID
--WHERE p.PaymentID IS NULL;
