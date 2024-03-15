
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50)
);


INSERT INTO employees (id, name, age, department) VALUES
(1, 'John Doe', 30, 'IT'),
(2, 'Jane Smith', 35, 'HR'),
(3, 'Alice Johnson', 25, 'Marketing');

DESCRIBE employees;
desc employees;


-- Add a new column
ALTER TABLE employees ADD COLUMN salary DECIMAL(10, 2);

-- Modify column data type
ALTER TABLE employees MODIFY COLUMN age INT UNSIGNED;

-- Rename a column
ALTER TABLE employees CHANGE COLUMN department dept_name VARCHAR(50);



UPDATE employees 
SET department = 'Finance' 
WHERE id = 3;


-- Increase the salary of all employees by 10%
UPDATE employees 
SET salary = salary * 1.1;

-- Decrease the age of employees by 5 years
UPDATE employees 
SET age = age - 5 
WHERE department = 'IT';

-- Add a bonus of $500 to the salary of employees in the HR department
UPDATE employees 
SET salary = salary + 500 
WHERE department = 'HR';


-- Drop a column
ALTER TABLE employees DROP COLUMN salary;

DROP TABLE employees;


#Parentheses: Expressions inside parentheses are evaluated first.
#Exponentiation: Operators like ^ or ** for exponentiation.
#Multiplication and Division: Operators like *, /, and % for multiplication, division, and modulo.
#Addition and Subtraction: Operators like + and - for addition and subtraction.
#Comparison Operators: Operators like =, <>, >, <, >=, and <= for comparison.
#Logical Operators: Operators like AND, OR, NOT, BETWEEN, IN, LIKE, IS NULL, etc.


-- Select all employees from the 'employees' table where the age is greater than 30
SELECT * 
FROM employees 
WHERE age > 30;

-- Select all products from the 'products' table where the price is less than or equal to 100
SELECT * 
FROM products 
WHERE price <= 100;

-- Select all orders from the 'orders' table placed by customers in the 'USA' region
SELECT * 
FROM orders 
WHERE customer_region = 'USA';


-- Select all employees from the 'employees' table and sort them by age in ascending order
SELECT * 
FROM employees 
ORDER BY age ASC;

-- Select all products from the 'products' table and sort them by price in descending order
SELECT * 
FROM products 
ORDER BY price DESC;

-- Select all orders from the 'orders' table and sort them by order date in ascending order
SELECT * 
FROM orders 
ORDER BY order_date ASC;



-- Select all products from the 'products' table where the price is greater than 50 and sort them by price in descending order
SELECT * 
FROM products 
WHERE price > 50 
ORDER BY price DESC;

-- Select all orders from the 'orders' table placed by customers in the 'USA' region and sort them by order date in ascending order
SELECT * 
FROM orders 
WHERE customer_region = 'USA' 
ORDER BY order_date ASC;

#Single row functions
SELECT UPPER(last_name) AS last_name_upper 
FROM employees;

SELECT ROUND(salary) AS rounded_salary 
FROM employees;

SELECT TO_CHAR(hire_date, 'YYYY-MM-DD') AS formatted_hire_date 
FROM employees;

#Multiple-Row Functions
SELECT department_id, COUNT(*) AS num_employees 
FROM employees 
GROUP BY department_id;

SELECT employee_id, salary, 
       AVG(salary) OVER (PARTITION BY department_id) AS avg_salary_by_dept 
FROM employees;


SELECT ROUND(123.456, 2) AS rounded_value; 
SELECT ROUND(123.456) AS rounded_value;   

SELECT TRUNC(123.456, 2) AS truncated_value; 
SELECT TRUNC(123.456) AS truncated_value;    

SELECT MOD(10, 3) AS remainder; 
SELECT MOD(12, 4) AS remainder; 


-- Add 7 days to the hire date of employees
SELECT hire_date, DATE(hire_date, '+7 days') AS new_hire_date 
FROM employees;

-- Subtract 1 month from the order date of orders
SELECT order_date, DATE(order_date, '-1 month') AS new_order_date 
FROM orders;

-- Extract the year from the hire date of employees
SELECT hire_date, DATE(hire_date, 'start of year') AS start_of_year 
FROM employees;

-- Calculate the age of employees based on their birth date
SELECT birth_date, DATE('now') - birth_date AS age_years 
FROM employees;

-- Extract the year from the hire date of employees
SELECT hire_date, DATE(hire_date, 'start of year') AS start_of_year 
FROM employees;

-- Calculate the age of employees based on their birth date
SELECT birth_date, DATE('now') - birth_date AS age_years 
FROM employees;


-- Convert a date value to a string in 'YYYY-MM-DD' format
SELECT TO_CHAR(hire_date, 'YYYY-MM-DD') AS formatted_hire_date
FROM employees;

-- Convert a numeric value to a string with two decimal places
SELECT TO_CHAR(salary, '99999.99') AS formatted_salary
FROM employees;

-- Convert a string representing a number to a numeric value
SELECT TO_NUMBER('12345.67', '99999.99') AS numeric_value;

-- Convert a string representing a date to a date value
SELECT TO_DATE('2022-01-15', 'YYYY-MM-DD') AS date_value;

-- Replace null values in the 'department' column with 'Unknown'
SELECT NVL(department, 'Unknown') AS department_name 
FROM employees;

-- Set 'department_id' to null if it is equal to 0
SELECT NULLIF(department_id, 0) AS department_id 
FROM employees;

-- Return the first non-null value from 'department', 'division', and 'unit'
SELECT COALESCE(department, division, unit) AS department_info 
FROM employees;

-- Select employee names and their salary status (High, Medium, Low) based on salary value
SELECT name,
       salary,
       CASE 
           WHEN salary > 50000 THEN 'High'
           WHEN salary > 30000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_status
FROM employees;

