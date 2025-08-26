'''
##Q-01: Reformat the table such that there is a `department id` column and a `revenue` column for each month.
If a department doesn’t have revenue in a month, return `null` for that month.


## Tables
Department Table
| id | revenue | month |
| -- | ------- | ----- |
| 1  | 8000    | Jan   |
| 2  | 9000    | Jan   |
| 3  | 10000   | Feb   |
| 1  | 7000    | Feb   |
| 1  | 6000    | Mar   |'''


--code
SELECT id,
    MAX(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
    MAX(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
    MAX(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue,
    MAX(CASE WHEN month = 'Apr' THEN revenue END) AS Apr_Revenue,
    MAX(CASE WHEN month = 'May' THEN revenue END) AS May_Revenue,
    MAX(CASE WHEN month = 'Jun' THEN revenue END) AS Jun_Revenue,
    MAX(CASE WHEN month = 'Jul' THEN revenue END) AS Jul_Revenue,
    MAX(CASE WHEN month = 'Aug' THEN revenue END) AS Aug_Revenue,
    MAX(CASE WHEN month = 'Sep' THEN revenue END) AS Sep_Revenue,
    MAX(CASE WHEN month = 'Oct' THEN revenue END) AS Oct_Revenue,
    MAX(CASE WHEN month = 'Nov' THEN revenue END) AS Nov_Revenue,
    MAX(CASE WHEN month = 'Dec' THEN revenue END) AS Dec_Revenue
FROM Department
GROUP BY id;


'''## Output

| id | Jan_Revenue  | Feb_Revenue  | Mar_Revenue  | … | Dec_Revenue  |
| -- | ------------ | ------------ | ------------ | - | ------------ |
| 1  | 8000         | 7000         | 6000         | … | null         |
| 2  | 9000         | null         | null         | … | null         |
| 3  | null         | 10000        | null         | … | null         |

---

## Explanation

* `CASE WHEN month = 'Jan' THEN revenue END` → picks the revenue for that month.
* `MAX()` → collapses multiple rows into a single value (like pivoting).
* `GROUP BY id` → one row per department.
* Months with no data default to `null` '''



'''## Q-02: Report the total distance traveled by each user.
* Include users with **no rides** (distance = 0).
* Sort by `travelled_distance` **descending**.
* If two or more users traveled the same distance, order them by `name` alphabetically.

## Input Tables
Users
| id | name     |
| -- | -------- |
| 1  | Alice    |
| 2  | Bob      |
| 3  | Alex     |
| 4  | Donald   |
| 7  | Lee      |
| 13 | Jonathan |
| 19 | Elvis    |

Rides
| id | user_id  | distance |
| -- | -------- | -------- |
| 1  | 1        | 120      |
| 2  | 2        | 317      |
| 3  | 3        | 222      |
| 4  | 7        | 100      |
| 5  | 13       | 312      |
| 6  | 19       | 50       |
| 7  | 7        | 120      |
| 8  | 19       | 400      |
| 9  | 7        | 230      |'''

--code
SELECT u.name, 
       COALESCE(SUM(r.distance), 0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r
  ON u.id = r.user_id
GROUP BY u.id, u.name
ORDER BY travelled_distance DESC, u.name ASC;

'''## Output
| name     | travelled_distance  |
| -------- | ------------------- |
| Elvis    | 450                 |
| Lee      | 450                 |
| Bob      | 317                 |
| Jonathan | 312                 |
| Alex     | 222                 |
| Alice    | 120                 |
| Donald   | 0                   |


##  Explanation
* `LEFT JOIN` → keeps all users, even if they never rode.
* `SUM(r.distance)` → sums ride distances per user.
* `COALESCE(SUM(...), 0)` → converts `NULL` into `0` for users with no rides.
* `GROUP BY u.id, u.name` → ensures one row per user.
* `ORDER BY travelled_distance DESC, u.name ASC` → sorts by distance (descending) and breaks ties alphabetically.'''

## About `COALESCE`
`COALESCE(expr1, expr2, ..., exprN)` returns the first non-NULL value in the list.

'Key use cases:
1. Replace NULL with a default.'
--code
   SELECT COALESCE(phone, 'N/A') FROM Users;

'2. Handle empty aggregations'
--code
   COALESCE(SUM(distance), 0)
   → Ensures you get `0` instead of `NULL` for users with no rides.
    
'3. Multi-column fallback'
--code
   SELECT COALESCE(nickname, username, 'Anonymous') FROM Users;


