With cte as
    (SELECT * ,weekday(dates)+1 dow,
	CASE WHEN SUBSTRING(day_indicator, weekday(dates)+1,1) = 1 THEN 1 ELSE 0 END as Flag 
	FROM relevent_dates)
    
SELECT product_id,day_indicator,dates FROM cte
WHERE flag=1
