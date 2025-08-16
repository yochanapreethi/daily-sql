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



'''## Q-02: Delete all duplicate emails, keeping only the one with the **smallest id**.

Table: Person
| id | email                                       |
| -- | ------------------------------------------- |
| 1  | [john@example.com](mailto:john@example.com) |
| 2  | [bob@example.com](mailto:bob@example.com)   |
| 3  | [john@example.com](mailto:john@example.com) |'''

--code
DELETE p1
FROM Person p1
JOIN Person p2
  ON p1.email = p2.email
 AND p1.id > p2.id;

'''## Explanation

* `JOIN` matches duplicate emails in the same table
* `p1.id > p2.id` → keeps the smallest id deletes the rest
* So only one unique email with the lowest id remains'''

