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
