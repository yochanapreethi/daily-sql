'''## Q-01
Validate Emails in the Users Table

Table:`Users`
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
| mail          | varchar |
+---------------+---------+
user_id is the primary key.

A valid e-mail has:
1. **Prefix name** — must start with a letter, can contain letters (upper/lower), digits, underscore `_`, period `.`, or dash `-`.
2. **Domain** — must be exactly `@leetcode.com`.

Write a query to return all users with valid e-mails.

## Example
Input:
+---------+-----------+-------------------------+
| user_id | name      | mail                    |
+---------+-----------+-------------------------+
| 1       | Winston   | winston@leetcode.com    |
| 2       | Jonathan  | jonathanisgreat         |
| 3       | Annabelle | bella-@leetcode.com     |
| 4       | Sally     | sally.come@leetcode.com |
| 5       | Marwan    | quarz#2020@leetcode.com |
| 6       | David     | david69@gmail.com       |
| 7       | Shapiro   | .shapo@leetcode.com     |
+---------+-----------+-------------------------+

Output:
+---------+-----------+-------------------------+
| user_id | name      | mail                    |
+---------+-----------+-------------------------+
| 1       | Winston   | winston@leetcode.com    |
| 3       | Annabelle | bella-@leetcode.com     |
| 4       | Sally     | sally.come@leetcode.com |
+---------+-----------+-------------------------+'''

-- Code
SELECT *
FROM Users
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com$';

'''## Explanation
* `^` → start of string.
* `[a-zA-Z]` → first character must be a letter (upper/lower).
* `[a-zA-Z0-9_.-]*` → zero or more allowed characters (letters, digits, `_`, `.`, `-`).
* `@leetcode[.]com` → matches the domain exactly (`@leetcode.com`).
* `$` → end of string.'''



