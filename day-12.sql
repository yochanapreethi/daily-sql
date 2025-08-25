'''
Q-01: We need to obtain a histogram of tweets posted per user in the year 2022.  
- First, count how many tweets each user posted in 2022.  
- Then, group users by that count (the “tweet bucket”).  
- Finally, count how many users fall into each bucket.  

## Example  
Tweets Table  
| tweet_id | user_id | msg                                               | tweet_date          |
|----------|---------|---------------------------------------------------|---------------------|
| 214252   | 111     | Am considering taking Tesla private at $420        | 2021-12-30 00:00:00 |
| 739252   | 111     | Despite the constant negative press covfefe        | 2022-01-01 00:00:00 |
| 846402   | 111     | Following @NickSinghTech changed my life!          | 2022-02-14 00:00:00 |
| 241425   | 254     | If the salary is so competitive, why hide it?      | 2022-03-01 00:00:00 |
| 231574   | 148     | I no longer have a manager. I cant be managed     | 2022-03-23 00:00:00 |

Output  
| tweet_bucket | users_num |
|--------------|-----------|
| 1            | 2         |
| 2            | 1         |

## Explanation  
1. Filter tweets from 2022 using `EXTRACT(YEAR FROM tweet_date) = 2022`.  
2. Count tweets per user group by `user_id` to get each user’s total tweet count.  
   - Example: user 111 → 2 tweets, user 254 → 1 tweet, user 148 → 1 tweet.  
3. Build histogram take the result of step 2 and group by `tweet_count`. This shows how many users posted exactly 1 tweet, 2 tweets, etc.  
   - Example: two users with 1 tweet, one user with 2 tweets.  
4. Order by bucket so the histogram is sorted from fewer tweets to more.  

This two-step aggregation (first by user, then by tweet count) produces the required histogram.  '''


--code
SELECT 
    tweet_count AS tweet_bucket,
    COUNT(user_id) AS users_num
FROM (
    SELECT 
        user_id,
        COUNT(tweet_id) AS tweet_count
    FROM tweets
    WHERE EXTRACT(YEAR FROM tweet_date) = 2022
    GROUP BY user_id
) AS user_counts
GROUP BY tweet_count
ORDER BY tweet_bucket;



