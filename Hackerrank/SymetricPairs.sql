SET @ROWINDEX1 := -1;
SET @ROWINDEX2 := -1;
SELECT DISTINCT T1.X,T1.Y
FROM (SELECT @ROWINDEX1:=@ROWINDEX1 + 1 AS ROWINDEX,X,Y
    FROM FUNCTIONS) AS T1, 
(SELECT @ROWINDEX2:=@ROWINDEX2 + 1 AS ROWINDEX,X,Y 
    FROM FUNCTIONS) AS T2
WHERE T1.X <= T1.Y AND T1.ROWINDEX != T2.ROWINDEX AND T1.X = T2.Y AND T2.X = T1.Y
ORDER BY T1.X

#Solution 2
# EXSITS : The EXISTS operator is used to test for the existence of any record in a subquery.
# f1.X = f1.Y 인 경우
(SELECT f1.X, f1.Y FROM Functions AS f1 
WHERE f1.X = f1.Y GROUP BY f1.X, f1.Y HAVING COUNT(*) > 1)
UNION
# f1.X != f1.Y 인 경우
(SELECT f1.X, f1.Y FROM Functions AS f1
WHERE EXISTS(SELECT X, Y FROM Functions WHERE f1.X = Y AND f1.Y = X AND f1.X < X))
ORDER BY X;