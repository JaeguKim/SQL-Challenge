SELECT H.HACKER_ID, NAME, TOTAL_SCORE
FROM 
    (SELECT HACKER_ID, SUM(SCORE) AS TOTAL_SCORE
    FROM 
        (SELECT H.HACKER_ID, S.CHALLENGE_ID, MAX(SCORE) AS SCORE
        FROM HACKERS H, SUBMISSIONS S
        WHERE H.HACKER_ID = S.HACKER_ID
        GROUP BY H.HACKER_ID, S.CHALLENGE_ID) AS SCORE_TABLE
    GROUP BY HACKER_ID
    HAVING SUM(SCORE) <> 0) AS TOTAL_SCORE_TABLE, HACKERS H
WHERE TOTAL_SCORE_TABLE.HACKER_ID = H.HACKER_ID
ORDER BY TOTAL_SCORE DESC, H.HACKER_ID

#SOLUTION 2
SELECT m.hacker_id, h.name, SUM(m.score) AS total_score FROM
(SELECT hacker_id, challenge_id, MAX(score) AS score FROM Submissions GROUP BY hacker_id, challenge_id) AS m
JOIN Hackers AS h ON m.hacker_id = h.hacker_id 
GROUP By m.hacker_id, h.name
HAVING total_score > 0
ORDER BY total_score DESC, m.hacker_id;