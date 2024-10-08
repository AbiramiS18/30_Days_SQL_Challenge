WITH CTE AS (
    SELECT *
    FROM (
        SELECT 
            id,
            LEAD(id,1,null) OVER(ORDER BY id) AS id1,
            LEAD(id,2,null) OVER(ORDER BY id) AS id2
        FROM Stadium AS S
        WHERE (people >= 100)
        ORDER BY id
    ) AS t
    WHERE (id + 1 = id1 AND id1 + 1 = id2)
)

SELECT S.*
FROM Stadium AS S
JOIN (
    SELECT id
    FROM CTE
    UNION
    SELECT id1
    FROM CTE
    UNION
    SELECT id2
    FROM CTE
) AS Sub ON S.id = Sub.id