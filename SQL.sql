-- Create a table for storing employee information
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Insert sample data into the Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) 
VALUES 
(1, 'John', 'Doe', 'IT', 60000.00),
(2, 'Jane', 'Smith', 'HR', 55000.00),
(3, 'Alice', 'Johnson', 'Marketing', 62000.00),
(4, 'Bob', 'Williams', 'Finance', 58000.00),
(5, 'Sarah', 'Brown', 'IT', 63000.00);

-- Retrieve all employees from the IT department
SELECT * FROM Employees WHERE Department = 'IT';

-- Increase the salary of all employees by 10%
UPDATE Employees SET Salary = Salary * 1.1;

-- Delete employees with a salary less than 55000
DELETE FROM Employees WHERE Salary < 55000;

-- Retrieve the average salary per department
SELECT Department, AVG(Salary) AS AverageSalary FROM Employees GROUP BY Department;

-- SELECT statement with WHERE, ORDER BY, DISTINCT, and LIMIT clauses
-- Retrieve the top 3 students who scored the highest in Mathematics
SELECT DISTINCT StudentName, Score
FROM StudentScores
WHERE Subject = 'Mathematics'
ORDER BY Score DESC
LIMIT 3;

-- Update an employee's salary
UPDATE Employees
SET Salary = 65000.00
WHERE EmployeeID = 1;

-- Delete an employee record
DELETE FROM Employees
WHERE EmployeeID = 4;


-- Create a table for storing sales data
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SaleAmount DECIMAL(10, 2)
);

-- Insert sample data into the Sales table
INSERT INTO Sales (SaleID, ProductID, SaleAmount) 
VALUES 
(1, 1, 100.00),
(2, 2, 150.00),
(3, 1, 200.00),
(4, 3, 50.00),
(5, 2, 120.00);

-- Aggregation functions with GROUP BY and HAVING clauses
-- Calculate total sales amount for each product
SELECT ProductID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;

-- Calculate average sales amount for each product
SELECT ProductID, AVG(SaleAmount) AS AverageSales
FROM Sales
GROUP BY ProductID;

-- Count the number of sales for each product
SELECT ProductID, COUNT(*) AS NumberOfSales
FROM Sales
GROUP BY ProductID;

-- Find the maximum sales amount among all products
SELECT MAX(SaleAmount) AS MaxSaleAmount
FROM Sales;

-- Find the minimum sales amount among all products
SELECT MIN(SaleAmount) AS MinSaleAmount
FROM Sales;

-- Filter results using HAVING clause
-- Find products with total sales amount greater than 200
SELECT ProductID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID
HAVING TotalSales > 200;

-- Create a table for storing employee information
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT
);

-- Insert sample data into the Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) 
VALUES 
(1, 'John', 'Doe', 1),
(2, 'Jane', 'Smith', 2),
(3, 'Alice', 'Johnson', 1),
(4, 'Bob', 'Williams', NULL);

-- Create a table for storing department information
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Insert sample data into the Departments table
INSERT INTO Departments (DepartmentID, DepartmentName) 
VALUES 
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

-- INNER JOIN: Retrieve employees along with their department information
SELECT E.FirstName, E.LastName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;

-- LEFT JOIN: Retrieve all employees and their department information, including employees without a department
SELECT E.FirstName, E.LastName, D.DepartmentName
FROM Employees E
LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID;

-- RIGHT JOIN: Retrieve all departments and their employees, including departments without employees
SELECT E.FirstName, E.LastName, D.DepartmentName
FROM Employees E
RIGHT JOIN Departments D ON E.DepartmentID = D.DepartmentID;

-- Retrieve all employees and departments, including unmatched records from both tables
SELECT E.FirstName, E.LastName, D.DepartmentName
FROM Employees E
LEFT OUTER JOIN Departments D ON E.DepartmentID = D.DepartmentID
UNION
SELECT E.FirstName, E.LastName, D.DepartmentName
FROM Employees E
RIGHT OUTER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE E.DepartmentID IS NULL;  -- Filter for unmatched records from the Employees table



-- Nested query: Retrieve employees with salaries greater than the average salary
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- Correlated subquery: Retrieve departments with average salary greater than departmental average salary
SELECT DepartmentID, 
       (SELECT AVG(Salary) FROM Employees E2 WHERE E2.DepartmentID = E1.DepartmentID) AS DepartmentAvgSalary
FROM Employees E1
GROUP BY DepartmentID;

-- Subquery in SELECT clause: Retrieve employee names along with the count of employees in their department
SELECT FirstName, LastName,
       (SELECT COUNT(*) FROM Employees E2 WHERE E2.DepartmentID = E1.DepartmentID) AS DepartmentEmployeeCount
FROM Employees E1;

-- Subquery in WHERE clause: Retrieve employees from departments with more than 3 employees
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID IN (SELECT DepartmentID FROM Employees GROUP BY DepartmentID HAVING COUNT(*) > 3);

-- Subquery in FROM clause: Retrieve the average salary of departments and compare it with the average salary of all departments
SELECT AVG(DepartmentAvgSalary) AS AvgDepartmentSalary, 
       (SELECT AVG(Salary) FROM Employees) AS OverallAvgSalary
FROM (SELECT DepartmentID, AVG(Salary) AS DepartmentAvgSalary FROM Employees GROUP BY DepartmentID) AS DepartmentSalaries;
	
-- Nested query: Retrieve employees with salaries greater than the average salary
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- Correlated subquery: Retrieve departments with average salary greater than departmental average salary
SELECT DepartmentID, 
       (SELECT AVG(Salary) FROM Employees E2 WHERE E2.DepartmentID = E1.DepartmentID) AS DepartmentAvgSalary
FROM Employees E1
GROUP BY DepartmentID;

    