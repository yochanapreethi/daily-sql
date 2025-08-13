'''## Q-01: Find product names and total units ordered in **February 2020** where the total units are **at least 100**.

Example Input
Products
| product_id  | product_name          | product_category  |
| ----------- | --------------------- | ----------------- |
| 1           | Leetcode Solutions    | Book              |
| 2           | Jewels of Stringology | Book              |
| 3           | HP                    | Laptop            |
| 4           | Lenovo                | Laptop            |
| 5           | Leetcode Kit          | T-shirt           |

Orders
| product_id  | order_date  | unit |
| ----------- | ----------- | ---- |
| 1           | 2020-02-05  | 60   |
| 1           | 2020-02-10  | 70   |
| 2           | 2020-02-11  | 80   |
| 5           | 2020-02-25  | 50   |
| 5           | 2020-02-27  | 50   |

Example Output
| product_name       | unit |
| ------------------ | ---- |
| Leetcode Solutions | 130  |
| Leetcode Kit       | 100  | '''
  
--Code
SELECT p.product_name,
       SUM(o.unit) AS unit
FROM Products p
JOIN Orders o
    ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100;

'''# Explanation
1. JOIN `Products` and `Orders` using `product_id` to get product names with their orders.
2. WHERE filters orders between Feb 1 and Feb 29, 2020.
3. GROUP BY ensures totals are calculated per product.
4. SUM(o.unit) calculates the total units ordered per product in February 2020.
5. HAVING SUM(o.unit) >= 100 keeps only products with at least 100 units. '''

---
