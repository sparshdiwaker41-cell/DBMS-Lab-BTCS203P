 DBMS LAB PRACTICAL
 Lab Sheet 2: DML Commands - INSERT, UPDATE and DELETE
 Lab Code: BTCS203P
 DBMS: MySQL

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- Prepare the tables used in this sheet.
DROP TABLE IF EXISTS Student_DML;
DROP TABLE IF EXISTS Employee_DML;
DROP TABLE IF EXISTS Department_DML;
DROP TABLE IF EXISTS Product_DML;
DROP TABLE IF EXISTS Customer_DML;
DROP TABLE IF EXISTS Course_DML;

CREATE TABLE Student_DML (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Employee_DML (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Email VARCHAR(100)
);

CREATE TABLE Department_DML (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Product_DML (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT
);

CREATE TABLE Customer_DML (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Course_DML (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Duration INT,
    Fees DECIMAL(10,2)
);

-- Q1. Insert one record into the Student table.
INSERT INTO Student_DML (Student_ID, Name, Age, Course, City)
VALUES (1, 'Rahul', 20, 'BCA', 'Delhi');

-- Q2. Insert five student records using separate INSERT statements.
INSERT INTO Student_DML VALUES (2, 'Priya', 21, 'BTech', 'Dehradun');
INSERT INTO Student_DML VALUES (3, 'Aman', 20, 'BCA', 'Meerut');
INSERT INTO Student_DML VALUES (4, 'Neha', 22, 'BTech', 'Delhi');
INSERT INTO Student_DML VALUES (5, 'Riya', 21, 'BCA', 'Dehradun');
INSERT INTO Student_DML VALUES (6, 'Karan', 23, 'MCA', 'Meerut');

-- Q3. Insert multiple records using a single statement.
INSERT INTO Student_DML (Student_ID, Name, Age, Course, City) VALUES
(7, 'Sana', 20, 'BCA', 'Delhi'),
(8, 'Vivek', 22, 'MCA', 'Noida'),
(9, 'Pooja', 21, 'BTech', 'Delhi');

-- Q4. Insert records into the Employee table.
INSERT INTO Employee_DML VALUES
(101, 'Amit', 'IT', 45000, 'amit@example.com'),
(102, 'Sneha', 'HR', 40000, 'sneha@example.com'),
(103, 'Vikas', 'Finance', 55000, 'vikas@example.com');

-- Q5. Insert records into the Department table.
INSERT INTO Department_DML VALUES
(1, 'IT', 'Delhi'),
(2, 'HR', 'Dehradun'),
(3, 'Finance', 'Noida');

-- Q6. Insert records into the Product table.
INSERT INTO Product_DML VALUES
(1, 'Laptop', 60000, 5),
(2, 'Mouse', 800, 20),
(3, 'Keyboard', 1500, 10),
(4, 'Monitor', 12000, 3),
(5, 'USB Cable', 300, 0);

-- Q7. Insert records into the Customer table.
INSERT INTO Customer_DML VALUES
(1, 'Rohit', 'rohit@example.com', '9876543210'),
(2, 'Anjali', 'anjali@example.com', '9876543211');

-- Q8. Insert records into the Course table.
INSERT INTO Course_DML VALUES
(1, 'BCA', 36, 90000),
(2, 'BTech', 48, 180000),
(3, 'MCA', 24, 120000);

-- Q9. Insert a student record with values for all columns.
INSERT INTO Student_DML (Student_ID, Name, Age, Course, City)
VALUES (10, 'Arjun', 20, 'BCA', 'Jaipur');

-- Q10. Insert a student record by specifying only selected columns.
INSERT INTO Student_DML (Student_ID, Name, Course)
VALUES (11, 'Meera', 'BCA');

-- Q11. Update the city of a particular student.
UPDATE Student_DML
SET City = 'Dehradun'
WHERE Student_ID = 1;

-- Q12. Update the salary of a particular employee.
UPDATE Employee_DML
SET Salary = 50000
WHERE Emp_ID = 101;

-- Q13. Increase the salary of all employees by 10%.
UPDATE Employee_DML
SET Salary = Salary * 1.10;

-- Q14. Increase the price of all products by 5%.
UPDATE Product_DML
SET Price = Price * 1.05;

-- Q15. Change the course of a particular student.
UPDATE Student_DML
SET Course = 'MCA'
WHERE Student_ID = 3;

-- Q16. Update the department of an employee.
UPDATE Employee_DML
SET Department = 'IT'
WHERE Emp_ID = 102;

-- Q17. Update the city of all students from Meerut to Delhi.
UPDATE Student_DML
SET City = 'Delhi'
WHERE City = 'Meerut';

-- Q18. Update the fees of a particular course.
UPDATE Course_DML
SET Fees = 95000
WHERE Course_ID = 1;

-- Q19. Update multiple columns of a student simultaneously.
UPDATE Student_DML
SET Age = 21,
    Course = 'BTech',
    City = 'Noida'
WHERE Student_ID = 4;

-- Q20. Delete a particular student record using Student_ID.
DELETE FROM Student_DML
WHERE Student_ID = 11;

-- Q21. Delete all students belonging to a particular city.
DELETE FROM Student_DML
WHERE City = 'Jaipur';

-- Q22. Delete employees whose salary is below a specified amount.
DELETE FROM Employee_DML
WHERE Salary < 40000;

-- Q23. Delete products whose quantity is zero.
DELETE FROM Product_DML
WHERE Quantity = 0;

-- Q24. Delete records satisfying multiple conditions using AND/OR.
DELETE FROM Student_DML
WHERE (Age > 22 AND City = 'Delhi')
   OR Course = 'MCA';

-- Q25. Complete sequence of INSERT, UPDATE and DELETE operations and display
-- the table after each operation.
DROP TABLE IF EXISTS Student_Sequence;
CREATE TABLE Student_Sequence (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

-- INSERT
INSERT INTO Student_Sequence VALUES
(1, 'Aarav', 20, 'BCA', 'Delhi'),
(2, 'Isha', 21, 'BTech', 'Dehradun'),
(3, 'Kabir', 22, 'BCA', 'Noida');
SELECT * FROM Student_Sequence;

-- UPDATE
UPDATE Student_Sequence
SET City = 'Meerut'
WHERE Student_ID = 2;
SELECT * FROM Student_Sequence;

-- DELETE
DELETE FROM Student_Sequence
WHERE Student_ID = 3;
SELECT * FROM Student_Sequence;



