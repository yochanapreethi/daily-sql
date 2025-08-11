'''Q-01: You are given the following `int_orders` table:

| order_number | order_date | cust_id  |  salesperson_id | amount |
| -------------| ---------- | -------- | --------------- | ------ |
| 30           | 1995-07-14 | 9        | 1               | 460    |
| 10           | 1996-08-02 | 4        | 2               | 540    |
| 40           | 1998-01-29 | 7        | 2               | 2400   |
| 50           | 1998-02-03 | 6        | 7               | 600    |
| 60           | 1998-03-02 | 6        | 7               | 720    |
| 70           | 1998-05-06 | 9        | 7               | 150    |
| 20           | 1999-01-30 | 4        | 8               | 1800   |

For each customer (`cust_id`), return:
1. All their orders.
2. The **total sales amount** for that customer.
3. The **rank** of each order based on highest `amount` first **within that customer**.

Expected Output:

|  cust_id |  order_number | amount |   total_sales_per_customer  |  rank_within_customer  |
| -------- | ------------- | ------ | --------------------------- | ---------------------- |
| 4        | 20            | 1800   | 2340                        | 1                      |
| 4        | 10            | 540    | 2340                        | 2                      |
| 6        | 60            | 720    | 1320                        | 1                      |
| 6        | 50            | 600    | 1320                        | 2                      |
| 7        | 40            | 2400   | 2400                        | 1                      |
| 9        | 30            | 460    | 610                         | 1                      |
| 9        | 70            | 150    | 610                         | 2                      | '''

SELECT 
    cust_id, 
    order_number, 
    amount, 
    SUM(amount) OVER (PARTITION BY cust_id) AS total_sales_per_customer,
    RANK() OVER (PARTITION BY cust_id ORDER BY amount DESC) AS rank_within_customer
FROM int_orders
ORDER BY cust_id, rank_within_customer;



'''Q-02: Top 3 Most Expensive Orders per Customer (Including Ties)
    
Table: `orders`
| order_id  | customer_id  | order_date  | total_amount  |
| --------- | ------------ | ----------- | ------------- |
| 1         | 101          | 2024-01-10  | 500.00        |
| 2         | 101          | 2024-01-15  | 450.00        |
| 3         | 101          | 2024-01-20  | 450.00        |
| 4         | 101          | 2024-02-01  | 300.00        |
| 5         | 102          | 2024-01-12  | 800.00        |
| 6         | 102          | 2024-01-18  | 750.00        |
| 7         | 102          | 2024-01-22  | 700.00        |
| 8         | 102          | 2024-01-28  | 700.00        |
| 9         | 103          | 2024-01-05  | 1000.00       |
| 10        | 103          | 2024-01-25  | 950.00        |

Find the top 3 most expensive orders for each customer.
If there is a tie for 3rd place, include all tied orders.'''

SELECT order_id,
       customer_id,
       order_date,
       total_amount
FROM (
    SELECT order_id,
           customer_id,
           order_date,
           total_amount,
           RANK() OVER (PARTITION BY customer_id ORDER BY total_amount DESC) AS rnk
    FROM orders
) t
WHERE rnk <= 3;

'''Explanation:
1. `PARTITION BY customer_id` → ranking restarts for each customer.
2. `ORDER BY total_amount DESC` → highest orders first.
3. `RANK()` → assigns the same rank to ties, so all tied 3rd-place orders are included.
4. Outer query filters `rnk <= 3` → keeps top 3 (with ties). '''
