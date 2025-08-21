'''
Q-01:
We need to calculate the cancellation rate of taxi requests, considering only trips 
where both the client and driver are unbanned users.

- Cancellation Rate = (Cancelled trips) ÷ (Total trips) for each day
- Cancelled means: status in ('cancelled_by_driver', 'cancelled_by_client')
- Only trips between "2013-10-01" and "2013-10-03"
- Round result to two decimals

Example:

Trips Table:
+----+-----------+-----------+---------+---------------------+------------+
| id | client_id | driver_id | city_id | status              | request_at |
+----+-----------+-----------+---------+---------------------+------------+
| 1  | 1         | 10        | 1       | completed           | 2013-10-01 |
| 2  | 2         | 11        | 1       | cancelled_by_driver | 2013-10-01 |
| 3  | 3         | 12        | 6       | completed           | 2013-10-01 |
| 4  | 4         | 13        | 6       | cancelled_by_client | 2013-10-01 |
| 5  | 1         | 10        | 1       | completed           | 2013-10-02 |
| 6  | 2         | 11        | 6       | completed           | 2013-10-02 |
| 7  | 3         | 12        | 6       | completed           | 2013-10-02 |
| 8  | 2         | 12        | 12      | completed           | 2013-10-03 |
| 9  | 3         | 10        | 12      | completed           | 2013-10-03 |
| 10 | 4         | 13        | 12      | cancelled_by_driver | 2013-10-03 |
+----+-----------+-----------+---------+---------------------+------------+

Users Table:
+----------+--------+--------+
| users_id | banned | role   |
+----------+--------+--------+
| 1        | No     | client |
| 2        | Yes    | client |
| 3        | No     | client |
| 4        | No     | client |
| 10       | No     | driver |
| 11       | No     | driver |
| 12       | No     | driver |
| 13       | No     | driver |
+----------+--------+--------+

Output:
+------------+-------------------+
| Day        | Cancellation Rate |
+------------+-------------------+
| 2013-10-01 | 0.33              |
| 2013-10-02 | 0.00              |
| 2013-10-03 | 0.50              |
+------------+-------------------+

------------------------------------------------------
Explanation:
1. We join the `Trips` table with the `Users` table twice:
   - Once for the client (`t.client_id = c.users_id`)
   - Once for the driver (`t.driver_id = d.users_id`)
   Both must have `banned = 'No'`.

2. We only consider trips between '2013-10-01' and '2013-10-03'.

3. For each day (`GROUP BY t.request_at`):
   - The denominator (`COUNT(*)`) = total valid trips (unbanned users).
   - The numerator (`SUM(t.status IN (...))`) = total cancelled trips 
     (MySQL treats boolean as 1/0).
   - Divide them and round to 2 decimals.

This gives us the cancellation rate per day. '''

--code
SELECT
  t.request_at AS Day,
  ROUND(
    SUM(t.status IN ('cancelled_by_driver', 'cancelled_by_client')) / COUNT(*),
    2
  ) AS cancellation_rate
FROM Trips t
JOIN Users c
  ON t.client_id = c.users_id AND c.banned = 'No'
JOIN Users d
  ON t.driver_id = d.users_id AND d.banned = 'No'
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at;


