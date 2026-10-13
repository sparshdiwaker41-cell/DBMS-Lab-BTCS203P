 DBMS LAB PRACTICAL
 Lab Sheet 5: SQL Joins
 Lab Code: BTCS203P
 DBMS: MySQL

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

DROP TABLE IF EXISTS Student_Joins;
DROP TABLE IF EXISTS Employee_Joins;
DROP TABLE IF EXISTS Department_Joins;
DROP TABLE IF EXISTS Course_Joins;

CREATE TABLE Department_Joins (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Course_Joins (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Duration INT,
    Fees DECIMAL(10,2)
);

CREATE TABLE Student_Joins (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Dept_ID INT,
    Course_ID INT
);

CREATE TABLE Employee_Joins (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Dept_ID INT,
    Salary DECIMAL(10,2),
    Manager_ID INT NULL
);

INSERT INTO Department_Joins VALUES
(1, 'Computer Science', 'Delhi'),
(2, 'Management', 'Dehradun'),
(3, 'Finance', 'Noida'),
(4, 'Mechanical', 'Meerut');

INSERT INTO Course_Joins VALUES
(1, 'BCA', 36, 90000),
(2, 'BTech', 48, 180000),
(3, 'MCA', 24, 120000),
(4, 'MBA', 24, 150000);

INSERT INTO Student_Joins VALUES
(1, 'Rahul', 20, 1, 1),
(2, 'Priya', 21, 1, 2),
(3, 'Aman', 22, 2, 1),
(4, 'Neha', 20, 2, 3),
(5, 'Riya', 21, NULL, 2),
(6, 'Karan', 23, 3, 4);

INSERT INTO Employee_Joins VALUES
(101, 'Amit', 1, 70000, NULL),
(102, 'Sneha', 1, 50000, 101),
(103, 'Vikas', 2, 60000, NULL),
(104, 'Rohit', 2, 40000, 103),
(105, 'Anjali', 3, 65000, NULL),
(106, 'Pooja', 3, 45000, 105);

-- Q1. Demonstrate an INNER JOIN between Student and Department.
SELECT s.Name, d.Dept_Name
FROM Student_Joins s
INNER JOIN Department_Joins d
ON s.Dept_ID = d.Dept_ID;

-- Q2. Display student names along with their department names using INNER JOIN.
SELECT s.Name AS Student_Name, d.Dept_Name
FROM Student_Joins s
INNER JOIN Department_Joins d
ON s.Dept_ID = d.Dept_ID;

-- Q3. Display employee names along with their department names.
SELECT e.Emp_Name, d.Dept_Name
FROM Employee_Joins e
INNER JOIN Department_Joins d
ON e.Dept_ID = d.Dept_ID;

-- Q4. Display students along with their course details.
SELECT s.Name AS Student_Name,
       c.Course_Name,
       c.Duration,
       c.Fees
FROM Student_Joins s
INNER JOIN Course_Joins c
ON s.Course_ID = c.Course_ID;

-- Q5. Find students belonging to a particular department using INNER JOIN.
SELECT s.Name, d.Dept_Name
FROM Student_Joins s
INNER JOIN Department_Joins d
ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_Name = 'Computer Science';

-- Q6. Demonstrate a LEFT OUTER JOIN between Student and Department.
SELECT s.Name, d.Dept_Name
FROM Student_Joins s
LEFT JOIN Department_Joins d
ON s.Dept_ID = d.Dept_ID;

-- Q7. Display all students, including those who do not have a matching department.
SELECT s.Name, d.Dept_Name
FROM Student_Joins s
LEFT JOIN Department_Joins d
ON s.Dept_ID = d.Dept_ID;

-- Q8. Demonstrate a RIGHT OUTER JOIN between Student and Department.
SELECT s.Name, d.Dept_Name
FROM Student_Joins s
RIGHT JOIN Department_Joins d
ON s.Dept_ID = d.Dept_ID;

-- Q9. Display all departments, including departments having no students.
SELECT d.Dept_Name, s.Name AS Student_Name
FROM Student_Joins s
RIGHT JOIN Department_Joins d
ON s.Dept_ID = d.Dept_ID;

-- Q10. Find students who are not assigned to any department using LEFT JOIN.
SELECT s.Name
FROM Student_Joins s
LEFT JOIN Department_Joins d
ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_ID IS NULL;

-- Q11. Find departments having no students using RIGHT/LEFT JOIN.
SELECT d.Dept_Name
FROM Department_Joins d
LEFT JOIN Student_Joins s
ON d.Dept_ID = s.Dept_ID
WHERE s.Student_ID IS NULL;

-- Q12. Demonstrate a FULL OUTER JOIN concept using a MySQL workaround.
SELECT s.Name AS Student_Name, d.Dept_Name
FROM Student_Joins s
LEFT JOIN Department_Joins d
ON s.Dept_ID = d.Dept_ID
UNION
SELECT s.Name AS Student_Name, d.Dept_Name
FROM Student_Joins s
RIGHT JOIN Department_Joins d
ON s.Dept_ID = d.Dept_ID;

-- Q13. Demonstrate a CROSS JOIN between Student and Course.
SELECT s.Name AS Student_Name, c.Course_Name
FROM Student_Joins s
CROSS JOIN Course_Joins c;

-- Q14. Calculate the number of possible Student-Course combinations using CROSS JOIN.
SELECT COUNT(*) AS Total_Student_Course_Combinations
FROM Student_Joins s
CROSS JOIN Course_Joins c;

-- Q15. Demonstrate a NATURAL JOIN between two suitable tables.
-- NATURAL JOIN matches columns having the same column names.
SELECT *
FROM Student_Joins
NATURAL JOIN Department_Joins;

-- Q16. Compare the result of NATURAL JOIN and INNER JOIN.
SELECT s.Student_ID, s.Name, d.Dept_Name
FROM Student_Joins s
INNER JOIN Department_Joins d
ON s.Dept_ID = d.Dept_ID;

SELECT *
FROM Student_Joins
NATURAL JOIN Department_Joins;

-- Q17. Perform a SELF JOIN on an Employee table to show employee-manager relationships.
SELECT e.Emp_Name AS Employee,
       m.Emp_Name AS Manager
FROM Employee_Joins e
LEFT JOIN Employee_Joins m
ON e.Manager_ID = m.Emp_ID;

-- Q18. Display employees along with their managers using SELF JOIN.
SELECT e.Emp_Name AS Employee_Name,
       COALESCE(m.Emp_Name, 'No Manager') AS Manager_Name
FROM Employee_Joins e
LEFT JOIN Employee_Joins m
ON e.Manager_ID = m.Emp_ID;

-- Q19. Join three tables - Student, Department and Course.
SELECT s.Name,
       d.Dept_Name,
       c.Course_Name
FROM Student_Joins s
INNER JOIN Department_Joins d
ON s.Dept_ID = d.Dept_ID
INNER JOIN Course_Joins c
ON s.Course_ID = c.Course_ID;

-- Q20. Display student name, course name and department name using multiple joins.
SELECT s.Name AS Student_Name,
       c.Course_Name,
       d.Dept_Name
FROM Student_Joins s
LEFT JOIN Course_Joins c
ON s.Course_ID = c.Course_ID
LEFT JOIN Department_Joins d
ON s.Dept_ID = d.Dept_ID;

-- Q21. Find employees whose salary is greater than the average salary of their department.
SELECT e.Emp_Name,
       d.Dept_Name,
       e.Salary
FROM Employee_Joins e
INNER JOIN Department_Joins d
ON e.Dept_ID = d.Dept_ID
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employee_Joins e2
    WHERE e2.Dept_ID = e.Dept_ID
);

-- Q22. Find the department having the maximum number of students.
SELECT d.Dept_Name,
       COUNT(s.Student_ID) AS Student_Count
FROM Department_Joins d
LEFT JOIN Student_Joins s
ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name
ORDER BY Student_Count DESC
LIMIT 1;

-- Q23. Display departments and the total number of students in each department.
SELECT d.Dept_Name,
       COUNT(s.Student_ID) AS Total_Students
FROM Department_Joins d
LEFT JOIN Student_Joins s
ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name;

-- Q24. Display courses along with the number of students enrolled in each course.
SELECT c.Course_Name,
       COUNT(s.Student_ID) AS Total_Students
FROM Course_Joins c
LEFT JOIN Student_Joins s
ON c.Course_ID = s.Course_ID
GROUP BY c.Course_ID, c.Course_Name;

-- Q25. Complete query using INNER JOIN, LEFT JOIN, GROUP BY and aggregate functions
-- to generate a student-department-course report.
SELECT d.Dept_Name,
       c.Course_Name,
       COUNT(s.Student_ID) AS Total_Students,
       AVG(s.Age) AS Average_Age
FROM Department_Joins d
INNER JOIN Student_Joins s
ON d.Dept_ID = s.Dept_ID
LEFT JOIN Course_Joins c
ON s.Course_ID = c.Course_ID
GROUP BY d.Dept_ID, d.Dept_Name, c.Course_ID, c.Course_Name
ORDER BY d.Dept_Name, c.Course_Name;

