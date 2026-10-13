 DBMS LAB PRACTICAL
 Lab Sheet 3: SQL Functions
 Lab Code: BTCS203P
 DBMS: MySQL

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

DROP TABLE IF EXISTS Employee_Functions;
DROP TABLE IF EXISTS Student_Functions;

CREATE TABLE Student_Functions (
    Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Name VARCHAR(100),
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Employee_Functions (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Salary DECIMAL(10,2),
    JoiningDate DATE
);

INSERT INTO Student_Functions VALUES
(1, 'Rahul', 'Sharma', 'Rahul Sharma', 20, 'BCA', 'Delhi'),
(2, 'Priya', 'Singh', 'Priya Singh', 21, 'BTech', 'Dehradun'),
(3, 'Aman', 'Kumar', 'Aman Kumar', 22, 'MCA', 'Meerut'),
(4, 'Neha', 'Verma', 'Neha Verma', 20, 'BCA', 'Delhi');

INSERT INTO Employee_Functions VALUES
(101, 'Amit', 45000, '2022-01-10'),
(102, 'Sneha', 52000, '2021-06-15'),
(103, 'Vikas', 60000, '2020-03-20'),
(104, 'Riya', 38000, '2023-09-05');

-- A. Number Functions

-- Q1. Demonstrate ABS() with suitable examples.
SELECT ABS(-25) AS Absolute_Value;

-- Q2. Demonstrate ROUND() with suitable examples.
SELECT ROUND(1234.56789, 2) AS Rounded_Value;

-- Q3. Demonstrate CEIL() and FLOOR().
SELECT CEIL(12.34) AS Ceiling_Value,
       FLOOR(12.99) AS Floor_Value;

-- Q4. Demonstrate MOD() with suitable examples.
SELECT MOD(17, 5) AS Remainder;

-- Q5. Calculate the rounded salary of employees.
SELECT Emp_Name, ROUND(Salary, 0) AS Rounded_Salary
FROM Employee_Functions;

-- B. Aggregate Functions

-- Q6. Find the total number of students using COUNT().
SELECT COUNT(*) AS Total_Students
FROM Student_Functions;

-- Q7. Find the total salary of all employees using SUM().
SELECT SUM(Salary) AS Total_Salary
FROM Employee_Functions;

-- Q8. Find the average salary using AVG().
SELECT AVG(Salary) AS Average_Salary
FROM Employee_Functions;

-- Q9. Find the highest salary using MAX().
SELECT MAX(Salary) AS Highest_Salary
FROM Employee_Functions;

-- Q10. Find the lowest salary using MIN().
SELECT MIN(Salary) AS Lowest_Salary
FROM Employee_Functions;

-- C. Character Functions

-- Q11. Demonstrate UPPER() on student names.
SELECT Name, UPPER(Name) AS Upper_Name
FROM Student_Functions;

-- Q12. Demonstrate LOWER() on student names.
SELECT Name, LOWER(Name) AS Lower_Name
FROM Student_Functions;

-- Q13. Demonstrate LENGTH() on student names.
SELECT Name, LENGTH(Name) AS Name_Length
FROM Student_Functions;

-- Q14. Demonstrate CONCAT() using first and last names.
SELECT CONCAT(First_Name, ' ', Last_Name) AS Full_Name
FROM Student_Functions;

-- Q15. Demonstrate SUBSTRING()/SUBSTR() with suitable examples.
SELECT Name, SUBSTRING(Name, 1, 3) AS First_Three_Characters
FROM Student_Functions;

-- D. Conversion Functions

-- Q16. Convert a number into a character/string value.
SELECT CAST(12345 AS CHAR) AS Number_As_String;

-- Q17. Convert a string into a numeric value.
SELECT CAST('12345' AS UNSIGNED) AS String_As_Number;

-- Q18. Convert a date value into a different format.
SELECT DATE_FORMAT('2026-10-14', '%d-%m-%Y') AS Formatted_Date;

-- Q19. Demonstrate CAST() with suitable examples.
SELECT CAST(123.45 AS DECIMAL(10,2)) AS Cast_Decimal,
       CAST('2026-10-14' AS DATE) AS Cast_Date;

-- Q20. Demonstrate CONVERT() where supported by the DBMS.
SELECT CONVERT('12345', UNSIGNED) AS Converted_Number,
       CONVERT('2026-10-14', DATE) AS Converted_Date;

-- E. Date Functions

-- Q21. Display the current date using a suitable date function.
SELECT CURDATE() AS Current_Date;

-- Q22. Extract the year, month and day from a date.
SELECT YEAR(JoiningDate) AS Joining_Year,
       MONTH(JoiningDate) AS Joining_Month,
       DAY(JoiningDate) AS Joining_Day
FROM Employee_Functions;

-- Q23. Find the difference between two dates.
SELECT DATEDIFF('2026-12-31', '2026-10-14') AS Difference_In_Days;

-- Q24. Add a specified number of days to a date.
SELECT DATE_ADD('2026-10-14', INTERVAL 10 DAY) AS New_Date;

-- Q25. Display employees' joining dates in a required date format.
SELECT Emp_Name,
       DATE_FORMAT(JoiningDate, '%d-%m-%Y') AS Joining_Date
FROM Employee_Functions;


