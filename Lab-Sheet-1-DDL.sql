 DBMS LAB PRACTICAL
 Lab Sheet 1: DDL Commands - CREATE, ALTER and DROP
 Lab Code: BTCS203P
 DBMS: MySQL

-- Q1. Create a database named CollegeDB.

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;



-- Q2. Create a Student table with Student_ID, Name, Age, Course and City.
CREATE TABLE IF NOT EXISTS Student (
    Student_ID INT,
    Name VARCHAR(50),
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

-- Q3. Create an Employee table with Emp_ID, Emp_Name, Department and Salary.
CREATE TABLE IF NOT EXISTS Employee (
    Emp_ID INT,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- Q4. Create a Department table with Dept_ID, Dept_Name and Location.
CREATE TABLE IF NOT EXISTS Department (
    Dept_ID INT,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

-- Q5. Create a Product table with Product_ID, Product_Name, Price and Quantity.
CREATE TABLE IF NOT EXISTS Product (
    Product_ID INT,
    Product_Name VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT
);

-- Q6. Create a Customer table with Customer_ID, Customer_Name, Email and Phone.
CREATE TABLE IF NOT EXISTS Customer (
    Customer_ID INT,
    Customer_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- Q7. Create a Course table with Course_ID, Course_Name, Duration and Fees.
CREATE TABLE IF NOT EXISTS Course (
    Course_ID INT,
    Course_Name VARCHAR(50),
    Duration INT,
    Fees DECIMAL(10,2)
);

-- Q8. Create a Faculty table with Faculty_ID, Faculty_Name, Subject and Salary.
CREATE TABLE IF NOT EXISTS Faculty (
    Faculty_ID INT,
    Faculty_Name VARCHAR(50),
    Subject VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- Q9. Create a Library table with Book_ID, Book_Name, Author and Price.
CREATE TABLE IF NOT EXISTS Library (
    Book_ID INT,
    Book_Name VARCHAR(100),
    Author VARCHAR(100),
    Price DECIMAL(10,2)
);

-- Q10. Create a Department table with Dept_ID as the Primary Key.
-- The Department table above can be modified as follows.
ALTER TABLE Department
    ADD PRIMARY KEY (Dept_ID);

-- Q11. Create a Student table with Student_ID as Primary Key and Name as NOT NULL.
ALTER TABLE Student
    ADD PRIMARY KEY (Student_ID);
ALTER TABLE Student
    MODIFY Name VARCHAR(50) NOT NULL;

-- Q12. Create an Employee table with a UNIQUE constraint on Email.
ALTER TABLE Employee
    ADD Email VARCHAR(100);
ALTER TABLE Employee
    ADD CONSTRAINT uq_employee_email UNIQUE (Email);

-- Q13. Create a Product table with a CHECK constraint that Price > 0.
ALTER TABLE Product
    ADD CONSTRAINT chk_product_price CHECK (Price > 0);

-- Q14. Add a new column Email to the Student table using ALTER TABLE.
ALTER TABLE Student
    ADD Email VARCHAR(100);

-- Q15. Add a Phone column to the Student table.
ALTER TABLE Student
    ADD Phone VARCHAR(20);

-- Q16. Modify the datatype/size of the Name column in the Student table.
ALTER TABLE Student
    MODIFY Name VARCHAR(100) NOT NULL;

-- Q17. Rename the Student table to Student_Details.
RENAME TABLE Student TO Student_Details;

-- Q18. Rename the column City to Address.
ALTER TABLE Student_Details
    RENAME COLUMN City TO Address;

-- Q19. Add a Salary column to the Employee table.
-- Employee already has Salary; the following shows the equivalent ALTER operation
-- on a separate example table so the original table is not duplicated.
CREATE TABLE IF NOT EXISTS Employee_Salary_Demo (
    Emp_ID INT,
    Emp_Name VARCHAR(50)
);
ALTER TABLE Employee_Salary_Demo
    ADD Salary DECIMAL(10,2);

-- Rename Student_Details back to Student so Q20-Q21 can be demonstrated exactly.
ALTER TABLE Student_Details
    RENAME COLUMN Address TO City;
RENAME TABLE Student_Details TO Student;

-- Q20. Drop the Phone column from the Student table.
ALTER TABLE Student
    DROP COLUMN Phone;

-- Q21. Drop the Email column from the Student table.
ALTER TABLE Student
    DROP COLUMN Email;

-- Q22. Remove all records from a table using TRUNCATE.
TRUNCATE TABLE Employee_Salary_Demo;

-- Q23. Drop the Course table from the database.
DROP TABLE IF EXISTS Course;

-- Q24. Drop the Customer table from the database.
DROP TABLE IF EXISTS Customer;

-- Q25. Create a complete Student table using Primary Key, NOT NULL, UNIQUE and CHECK
-- constraints, and demonstrate suitable ALTER and DROP operations.
DROP TABLE IF EXISTS Student_Complete;
CREATE TABLE Student_Complete (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 16),
    Course VARCHAR(50),
    City VARCHAR(50)
);

-- Suitable ALTER operation
ALTER TABLE Student_Complete
    ADD Phone VARCHAR(20);

-- Suitable DROP operation (drop the column just added)
ALTER TABLE Student_Complete
    DROP COLUMN Phone;

