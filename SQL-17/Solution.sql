SELECT s.user_id,
    RPOUND(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END ) / 
    COUNT(s.user_id),2) AS confirmation_rate 
FROM signups s LEFT JOIN Confirmations c 
ON s.user_id=c.user_id
GROUP BY s.user_id