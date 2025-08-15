'''## Q-01: Count and List Distinct Products Sold per Date

Description:
Write a query to find, for each `sell_date`:
1. The number of different products sold.
2. The names of the products, sorted lexicographically and separated by commas.

Return the result ordered by `sell_date`.
---

## Example

Input:
Activities table:
+------------+------------+
| sell_date  | product    |
+------------+------------+
| 2020-05-30 | Headphone  |
| 2020-06-01 | Pencil     |
| 2020-06-02 | Mask       |
| 2020-05-30 | Basketball |
| 2020-06-01 | Bible      |
| 2020-06-02 | Mask       |
| 2020-05-30 | T-Shirt    |
+------------+------------+
  
Output:
+------------+----------+------------------------------+
| sell_date  | num_sold | products                     |
+------------+----------+------------------------------+
| 2020-05-30 | 3        | Basketball,Headphone,T-shirt |
| 2020-06-01 | 2        | Bible,Pencil                 |
| 2020-06-02 | 1        | Mask                         |
+------------+----------+------------------------------+'''

--CODE
SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product ASC) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;

'''## Explanation

* `COUNT(DISTINCT product)` → counts unique products per date.
* `GROUP_CONCAT(DISTINCT product ORDER BY product ASC)` → concatenates unique product names, sorted lexicographically, separated by commas.
* `GROUP BY sell_date` → ensures the aggregation happens for each date.
* `ORDER BY sell_date` → sorts the output by date.

Note:
Without `ORDER BY product` inside `GROUP_CONCAT`, the product names might not appear in lexicographical order.

