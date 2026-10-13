 DBMS LAB PRACTICAL
 Lab Sheet 4: SQL Operators
 Lab Code: BTCS203P
 DBMS: MySQL

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

DROP TABLE IF EXISTS Student_Operators;
DROP TABLE IF EXISTS Employee_Operators;
DROP TABLE IF EXISTS Product_Operators;

CREATE TABLE Student_Operators (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Course VARCHAR(50),
    City VARCHAR(50),
    Age INT,
    Email VARCHAR(100)
);

CREATE TABLE Employee_Operators (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE Product_Operators (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT
);

INSERT INTO Student_Operators VALUES
(1, 'Aman', 'BCA', 'Delhi', 20, 'aman@example.com'),
(2, 'Priya', 'BTech', 'Dehradun', 21, NULL),
(3, 'Neha', 'BCA', 'Delhi', 22, 'neha@example.com'),
(4, 'Rohan', 'MCA', 'Meerut', 23, NULL),
(5, 'Anjali', 'BTech', 'Noida', 20, 'anjali@example.com');

INSERT INTO Employee_Operators VALUES
(101, 'Amit', 'IT', 45000),
(102, 'Sneha', 'HR', 40000),
(103, 'Vikas', 'Finance', 55000),
(104, 'Riya', 'IT', 65000);

INSERT INTO Product_Operators VALUES
(1, 'Laptop', 60000, 2),
(2, 'Mouse', 800, 10),
(3, 'Keyboard', 1500, 0),
(4, 'Monitor', 12000, 3);

-- Arithmetic Operators

-- Q1. Perform addition of two numbers using +.
SELECT 10 + 5 AS Addition;

-- Q2. Perform subtraction using -.
SELECT 10 - 5 AS Subtraction;

-- Q3. Perform multiplication using *.
SELECT 10 * 5 AS Multiplication;

-- Q4. Perform division using /.
SELECT 10 / 5 AS Division;

-- Q5. Calculate the total amount as Price x Quantity.
SELECT Product_Name, Price, Quantity,
       Price * Quantity AS Total_Amount
FROM Product_Operators;

-- Logical Operators

-- Q6. Demonstrate AND with two conditions.
SELECT *
FROM Student_Operators
WHERE City = 'Delhi' AND Course = 'BCA';

-- Q7. Demonstrate OR with two conditions.
SELECT *
FROM Student_Operators
WHERE City = 'Delhi' OR City = 'Dehradun';

-- Q8. Demonstrate NOT with a condition.
SELECT *
FROM Student_Operators
WHERE NOT City = 'Delhi';

-- Q9. Find students belonging to a specific course AND city.
SELECT *
FROM Student_Operators
WHERE Course = 'BCA' AND City = 'Delhi';

-- Q10. Find employees belonging to either of two departments.
SELECT *
FROM Employee_Operators
WHERE Department = 'IT' OR Department = 'HR';

-- Comparison Operators

-- Q11. Demonstrate the = operator.
SELECT *
FROM Student_Operators
WHERE City = 'Delhi';

-- Q12. Demonstrate the > operator.
SELECT *
FROM Employee_Operators
WHERE Salary > 50000;

-- Q13. Demonstrate the < operator.
SELECT *
FROM Employee_Operators
WHERE Salary < 50000;

-- Q14. Demonstrate >= and <=.
SELECT *
FROM Employee_Operators
WHERE Salary >= 40000 AND Salary <= 55000;

-- Q15. Demonstrate the <> / != operator.
SELECT *
FROM Student_Operators
WHERE City <> 'Delhi';

SELECT *
FROM Student_Operators
WHERE City != 'Delhi';

-- Special Operators

-- Q16. Demonstrate BETWEEN for salary range.
SELECT *
FROM Employee_Operators
WHERE Salary BETWEEN 40000 AND 60000;

-- Q17. Demonstrate IN for selecting multiple cities.
SELECT *
FROM Student_Operators
WHERE City IN ('Delhi', 'Dehradun', 'Meerut');

-- Q18. Demonstrate NOT IN.
SELECT *
FROM Student_Operators
WHERE City NOT IN ('Delhi', 'Meerut');

-- Q19. Demonstrate LIKE for names beginning with a particular letter.
SELECT *
FROM Student_Operators
WHERE Name LIKE 'A%';

-- Q20. Demonstrate IS NULL and IS NOT NULL.
SELECT *
FROM Student_Operators
WHERE Email IS NULL;

SELECT *
FROM Student_Operators
WHERE Email IS NOT NULL;

-- Set Operations

-- Q21. Demonstrate UNION using two compatible queries.
SELECT City AS Location
FROM Student_Operators
WHERE Course = 'BCA'
UNION
SELECT Department AS Location
FROM Employee_Operators
WHERE Department = 'IT';

-- Q22. Demonstrate UNION ALL.
SELECT City AS Location
FROM Student_Operators
WHERE Course = 'BCA'
UNION ALL
SELECT Department AS Location
FROM Employee_Operators
WHERE Department = 'IT';

-- Q23. Demonstrate INTERSECT where supported by the DBMS.
-- MySQL versions that support INTERSECT can use:
-- SELECT City FROM Student_Operators
-- INTERSECT
-- SELECT City FROM Student_Operators WHERE City = 'Delhi';
-- Compatibility workaround using INNER JOIN/subquery:
SELECT DISTINCT s.City
FROM Student_Operators s
WHERE s.City IN (SELECT City FROM Student_Operators WHERE City = 'Delhi');

-- Q24. Demonstrate EXCEPT/MINUS where supported.
-- Compatibility workaround:
SELECT DISTINCT s.City
FROM Student_Operators s
WHERE s.City NOT IN (
    SELECT City
    FROM Student_Operators
    WHERE City = 'Delhi'
);

-- Q25. Problem using Arithmetic + Logical + Comparison + Special operators.
SELECT Product_Name,
       Price,
       Quantity,
       Price * Quantity AS Total_Amount
FROM Product_Operators
WHERE (Price * Quantity) > 5000
  AND Quantity BETWEEN 1 AND 10
  AND Product_Name IN ('Laptop', 'Monitor', 'Keyboard')
  AND Product_Name LIKE '%o%';


