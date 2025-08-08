""" Day 03: SQL Joins Master Notes

/*
1. INNER JOIN
   - Keeps only matching rows between two tables based on the ON condition.
   - If there’s no match, the row is dropped. */
-- Example:
-- SELECT ...
-- FROM A
-- INNER JOIN B
--   ON A.id = B.id;
-- Use when: You only care about data that exists in both tables.


/*
2. LEFT JOIN (LEFT OUTER JOIN)
   - Keeps all rows from the left table.
   - Matching rows from the right table are filled in; if no match → NULL on right-side columns. */
-- Example:
-- SELECT ...
-- FROM A
-- LEFT JOIN B
--   ON A.id = B.id;
-- Use when: You want everything from the left table, even if there’s no match.
-- Common trap: Putting WHERE B.column = something will turn it into an INNER JOIN unless you move that condition into the ON.


/*
3. RIGHT JOIN (RIGHT OUTER JOIN)
   - Opposite of LEFT JOIN — keeps all rows from the right table.
   - Rare in practice; most people just swap table positions and use LEFT JOIN. */
-- Example:
-- SELECT ...
-- FROM A
-- RIGHT JOIN B
--   ON A.id = B.id;
-- Use when: You need all rows from the right table.


/*
4. FULL OUTER JOIN
   - Keeps all rows from both tables.
   - Matches where possible; fills with NULL where there’s no match.
   - MySQL doesn’t support FULL OUTER JOIN directly — simulate with a UNION of LEFT and RIGHT JOIN. d*/
-- Example:
-- SELECT ...
-- FROM A
-- FULL OUTER JOIN B
--   ON A.id = B.id;


/*
5. CROSS JOIN
   - Cartesian product — every row from A joins to every row from B.
   - No ON condition; rows = rows(A) × rows(B). */
-- Example:
-- SELECT ...
-- FROM A
-- CROSS JOIN B;
-- Use when: You need every possible combination or want to generate data.


/*
6. SELF JOIN
   - A table joins to itself.
   - Needs table aliases to tell the two instances apart.*/
-- Example:
-- SELECT e1.name, e2.name AS manager
-- FROM employees e1
-- JOIN employees e2
--   ON e1.manager_id = e2.emp_id;
-- Use when: Hierarchies, comparing rows within the same table.


/*
7. NATURAL JOIN
   - Joins automatically on columns with the same name in both tables.
   - Risky: column name changes can break logic. */
-- Example:
-- SELECT ...
-- FROM A
-- NATURAL JOIN B;


/*
Compound Join Condition
   - Multiple conditions inside ON. */
-- Example:
-- ON A.order_id = B.order_id
-- AND A.customer_id = B.customer_id

/*
Mix AND + OR in joins — use parentheses to control logic.
*/


/*
LEFT JOIN vs WHERE filter difference
*/
-- Filters during join (preserves unmatched left rows)
-- LEFT JOIN B
--   ON A.id = B.id AND B.status = 'active'

-- Filters after join (removes unmatched rows)
-- LEFT JOIN B
--   ON A.id = B.id
-- WHERE B.status = 'active'

"""

'''Q-01
Tables:

employees (emp_id, name, dept_id)
salaries (emp_id, salary, status)

Task:
List all employees with their salary only if status = "active". Show NULL if no salary or inactive. '''

SELECT p.project_id,
       p.status,
       e.name AS manager_name
FROM projects p
LEFT JOIN employees e
  ON p.manager_id = e.emp_id
WHERE p.status IN ('ongoing', 'paused');
