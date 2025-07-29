-- Q-01: (https://www.codechef.com/practice/course/sql-case-studies-topic-wise/SQLBP01/problems/SQLPBP06)
-- How many employees are there in each department?
-- This query returns the total number of employees grouped by their department name.
SELECT department, COUNT(*) AS total_employees
FROM Employees
GROUP BY department;
