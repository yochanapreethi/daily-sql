'''## Q-01: Find users with valid emails.
1. Must start with a letter.
2. Can contain letters, digits, `.`, `_`, `-` before the `@`.
3. Must have **exact domain** `@leetcode.com` (lowercase only).

Example Input
| user_id  | name      | mail                                                      |
| -------- | --------- | --------------------------------------------------------- |
| 1        | Winston   | [winston@leetcode.com](mailto:winston@leetcode.com)       |
| 2        | Jonathan  | jonathanisgreat                                           |
| 3        | Annabelle | [bella-@leetcode.com](mailto:bella-@leetcode.com)         |
| 4        | Sally     | [sally.come@leetcode.com](mailto:sally.come@leetcode.com) |
| 5        | Marwan    | quarz#[2020@leetcode.com](mailto:2020@leetcode.com)       |
| 6        | David     | [david69@gmail.com](mailto:david69@gmail.com)             |
| 7        | Shapiro   | [.shapo@leetcode.com](mailto:.shapo@leetcode.com)         |

Example Output
| user_id  | name      | mail                                                      |
| -------- | --------- | --------------------------------------------------------- |
| 1        | Winston   | [winston@leetcode.com](mailto:winston@leetcode.com)       |
| 3        | Annabelle | [bella-@leetcode.com](mailto:bella-@leetcode.com)         |
| 4        | Sally     | [sally.come@leetcode.com](mailto:sally.come@leetcode.com) |

## SQL Solution'''

SELECT user_id, name, mail
FROM Users
WHERE REGEXP_LIKE(mail, '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com$', 'c');

'''## Explanation

* `^` → start of string
* `[a-zA-Z]` → first char must be a letter
* `[a-zA-Z0-9._-]*` → allowed chars after first letter
* `@leetcode\\.com` → exact lowercase domain match (`\\.` escapes the dot)
* `$` → end of string
* `'c'` → case-sensitive match

## When and Why We Use `REGEXP_LIKE`
* When: We need pattern-based matching in SQL, especially when simple `LIKE` is not flexible enough.
* Why: `REGEXP_LIKE` supports regular expressions so we can:

  * Match specific character sets.
  * Enforce position rules (start `^` / end `$`).
  * Control allowed characters and formats in one expression.
  * Add case sensitivity with the `'c'` flag.

Example:
* `LIKE '%@leetcode.com'` → would accept `@leetcode.COM` (wrong case) and invalid prefixes.
* `REGEXP_LIKE(...)` → enforces **all** rules in a single check.
