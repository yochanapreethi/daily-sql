'''## Q-01
Find the second highest distinct salary from the `Employee` table. If it doesn’t exist, return `NULL`.

Employee
| id | salary |
| -- | ------ |
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |'''
  
--code
SELECT (
  SELECT DISTINCT salary
  FROM Employee
  ORDER BY salary DESC
  LIMIT 1 OFFSET 1
) AS SecondHighestSalary;

'''## Explanation
* `DISTINCT` → removes duplicates
* `ORDER BY DESC` → sorts from high to low
* `LIMIT 1 OFFSET 1` → skip the highest, take the 2nd
* If no 2nd salary exists → returns `NULL`'''

