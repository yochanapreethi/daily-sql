'''
## Q-01: Swap All `f` and `m` Values

### Table: `Salary`
| Column Name | Type          |
| ----------- | ------------- |
| id          | int           |
| name        | varchar       |
| sex         | ENUM(`m`,`f`) |
| salary      | int           |

* `id` is the primary key.
* `sex` contains only `m` or `f`.
* Goal → swap `m` ↔ `f` with one update query

### Example Input
| id | name | sex | salary |
| -- | ---- | --- | ------ |
| 1  | A    | m   | 2500   |
| 2  | B    | f   | 1500   |
| 3  | C    | m   | 5500   |
| 4  | D    | f   | 500    |

### Expected Output
| id | name | sex | salary |
| -- | ---- | --- | ------ |
| 1  | A    | f   | 2500   |
| 2  | B    | m   | 1500   |
| 3  | C    | f   | 5500   |
| 4  | D    | m   | 500    |'''

-- Code
UPDATE Salary
SET sex = CASE 
            WHEN sex = 'm' THEN 'f'
            ELSE 'm'
          END;

'''
### Explanation

* We use a `CASE` expression directly inside the `UPDATE`.
* If sex = `m` → flip it to `f`.
* Else (`f`) → flip it to `m`.
* Runs in one statement, no temp tables needed.



