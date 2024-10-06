(SELECT u.name results FROM Users u JOIN MovieRating m 
ON u.user_id = m.user_id 
GROUP BY u.name
ORDER BY COUNT(m.user_id) DESC,name
LIMIT 1) 

UNION ALL

(SELECT mo.title FROM movies mo JOIN movierating m
ON mo.movie_id=m.movie_id AND 
YEAR(m.created_at) = '2020' AND
MONTH(m.created_at)='02'
GROUP BY mo.title
ORDER BY AVG(m.rating) DESC, mo.title
LIMIT 1)