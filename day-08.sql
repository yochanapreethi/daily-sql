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
* So only one unique email with the lowest id remains




##Q-03: Find Patients with Type I Diabetes

Table: `Patients`
| Column Name   | Type    |
| ------------- | ------- |
| patient\_id   | int     |
| patient\_name | varchar |
| conditions    | varchar |

* `patient_id` is the primary key
* `conditions` contains 0 or more codes separated by spaces.
* We want to find patients diagnosed with Type I Diabetes which always starts with the prefix `"DIAB1"`.

#Example Input

Patients Table:
| patient_id  | patient_name  | conditions    |
| ----------- | ------------- | ------------- |
| 1           | George        | ACNE +DIAB100 |
| 2           | Alain         | DIAB201       |
| 3           | Bob           | DIAB100 MYOP  |
| 4           | Daniel        | YFEV COUGH    |
| 5           | Alice         |               |


# Expected Output

| patient_id  | patient_name  | conditions   |
| ----------- | ------------- | ------------ |
| 3           | Bob           | DIAB100 MYOP |
| 4           | George        | ACNE DIAB100 |'''

--code
SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions REGEXP '(^| )DIAB1';


'''## Explanation
* `REGEXP` is used to match patterns in strings.
* `(^| )DIAB1` means:
  * `^` → start of the string
  * `|` → OR
  * `' '` → a space
  * So this ensures `"DIAB1"` appears either at the start of the string OR right after a space.

This way, we only capture clean occurrences like:
* `"DIAB100"` ✅ (at start)
* `"ACNE DIAB100"` ✅ (after space)
* `"ACNE+DIAB100"` ❌ (blocked, because `+` is not a space)



## Q-04: Fix Names Formatting

# Example Input

Users Table:
| user_id  | name  |
| -------- | ----- |
| 1        | aLice |
| 2        | bOB   |

# Expected Output

| user_id  | name  |
| -------- | ----- |
| 1        | Alice |
| 2        | Bob   |'''

--code
SELECT 
  user_id, 
  CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM Users
ORDER BY user_id ASC;

'''# Explanation
* `UPPER(LEFT(name, 1))` → makes the **first letter uppercase**.
* `LOWER(SUBSTRING(name, 2))` → converts the **rest of the string to lowercase**.
* `CONCAT(...)` → combines them into the corrected name.
* `ORDER BY user_id ASC` → ensures output is sorted by `user_id`.


