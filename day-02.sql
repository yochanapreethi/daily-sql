-- Q-01: (https://www.codechef.com/practice/course/sql-case-studies-topic-wise/SQLBP01/problems/SQLPBP05)
-- Retrieve the details of the last five matches played.
-- For each match, include:
--   - match ID
--   - names of both participating players
--   - name of the winner
--   - date the match was played
--   - the final score of the winning player
-- This insight helps understand recent player performance and engagement levels.
SELECT 
    m.match_id,
    m.player_1,
    m.player_2,
    m.winner,
    m.match_date,
    p.score AS score
FROM Matches m
JOIN Players p
    ON m.winner = p.player_name
ORDER BY m.match_date DESC
LIMIT 5;



-- Q-02:
-- What is the maximum number of participants in WhatsApp groups
-- that were created in October 2024?
-- This metric helps identify the largest group size available.

SELECT MAX(participant_count) AS max_participants
FROM dim_groups
WHERE EXTRACT(YEAR FROM created_date) = 2024
  AND EXTRACT(MONTH FROM created_date) = 10;



-- Q-03:
-- For WhatsApp groups with more than 50 participants that were created
-- In October 2024, what is the average number of messages sent?
-- This insight helps assess engagement in larger groups.

SELECT AVG(total_messages) AS avg_messages
FROM dim_groups
WHERE EXTRACT(YEAR FROM created_date) = 2024
  AND EXTRACT(MONTH FROM created_date) = 10
  AND participant_count > 50;



-- Using multiple joins
use sql_store;

SELECT o.order_id,
		o.customer_id,
        o.order_date,
        o.shipped_date,
        c.first_name,
        c.last_name
	FROM orders o
JOIN customers c 
ON o.customer_id = c.customer_id
JOIN order_statuses s
ON o.status = s.order_status_id
