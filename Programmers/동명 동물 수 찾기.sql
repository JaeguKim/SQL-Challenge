-- 코드를 입력하세요
SELECT NAME, _count as COUNT
FROM
(SELECT NAME, COUNT(*) AS _count
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
GROUP BY NAME) AS tempTable
WHERE _count >= 2
order by NAME
