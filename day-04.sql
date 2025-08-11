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
