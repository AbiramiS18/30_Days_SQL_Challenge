SELECT * FROM
(SELECT car from footer WHERE car IS NOT NULL ORDER BY id DESC LIMIT 1) AS car CROSS JOIN
(SELECT length from footer WHERE length IS NOT NULL ORDER BY id DESC LIMIT 1)AS length CROSS JOIN
(SELECT width FROM footer WHERE width IS NOT NULL ORDER BY id DESC LIMIT 1) AS width CROSS JOIN
(SELECT height FROM footer WHERE height IS NOT NULL ORDER BY id DESC LIMIT 1) AS height;


WITH cte as
	(SELECT *,
    SUM(CASE WHEN car IS NULL THEN 0 ELSE 1 END)OVER(order by id) AS car_segment,
    SUM(CASE WHEN length IS NULL THEN 0 ELSE 1 END)OVER(order by id) AS length_segment,
    SUM(CASE WHEN width IS NULL THEN 0 ELSE 1 END)OVER(order by id) AS width_segment,
    SUM(CASE WHEN height IS NULL THEN 0 ELSE 1 END)OVER(order by id) AS height_segment
	FROM Footer),
    
cte2 as 
	(SELECT 
     FIRST_VALUE(car) OVER(PARTITION BY car_segment ORDER BY id) car,
     FIRST_VALUE(Length) OVER(PARTITION BY length_segment ORDER BY id) length,
     FIRST_VALUE(width) OVER(PARTITION BY width_segment ORDER BY id) width,
     FIRST_VALUE(height) OVER(PARTITION BY height_segment ORDER BY id) height
     FROM cte
     ORDER BY id DESC LIMIT 1)
    
SELECT * FROM cte2
