WITH cte as
(SELECT *,
sum(weight) OVER(ORDER BY turn) Weights FROM Queue
)

SELECT person_name FROM cte
WHERE weights<=1000
ORDER BY weights DESC
LIMIT 1