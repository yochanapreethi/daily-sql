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

