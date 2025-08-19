'''
## Q-01: Find all pairs (actor_id, director_id) where the actor has cooperated with the director at least three times. Return the result table in any order.

### Example
Input:
`ActorDirector` table
| actor_id  | director_id  | timestamp |
| --------- | ------------ | --------- |
| 1         | 1            | 0         |
| 1         | 1            | 1         |
| 1         | 1            | 2         |
| 1         | 2            | 3         |
| 1         | 2            | 4         |
| 2         | 1            | 5         |
| 2         | 1            | 6         |

Output:
| actor_id  | director_id  |
| --------- | ------------ |
| 1         | 1            |

Explanation:
* Pair `(1,1)` appears 3 times → included.
* Pair `(1,2)` appears 2 times → excluded.
* Pair `(2,1)` appears 2 times → excluded. '''

--code
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) > 2;

'''
* `GROUP BY` groups rows into unique `(actor_id, director_id)` pairs.
* `COUNT(*)` counts how many times each pair occurs.
* `HAVING COUNT(*) > 2` ensures only pairs with **3 or more** collaborations are returned.'''




