WITH trails1 as
	(SELECT t1.hut1 start_hut, h1.name start_hut_name, h1.altitude start_altitude,t1.hut2 end_hut
	FROM mountain_huts h1 JOIN trails t1 ON h1.id =t1.hut1),

trails2 as
    (SELECT t2.*, h2.name end_hut_name, h2.altitude end_altitude
    FROM trails1 t2 JOIN mountain_huts h2 on h2.id = t2.end_hut),

trails3 as    
    (SELECT trails2.*,CASE WHEN start_altitude > end_altitude THEN 1 ELSE 0 END AS af
     FROM trails2),
     
Final_cte as
	(SELECT CASE WHEN af =1 THEN Start_hut ELSE end_hut end as start_hut, 
     CASE WHEN af=1 THEN start_hut_name ELSE end_hut_name end as start_hut_name,
     CASE WHEN af=1 THEN start_altitude ELSE end_altitude end as start_altitude,
     CASE WHEN af =0 THEN Start_hut ELSE end_hut end as end_hut,
     CASE WHEN af=0 THEN start_hut_name ELSE end_hut_name end as end_hut_name,
     CASE WHEN af=0 THEN start_altitude ELSE end_altitude end as end_altitude
     FROM trails3)
    
SELECT F1.Start_hut_name startpt,F1.end_hut_name as midpt, F2.end_hut_name endpt  FROM Final_cte F1
JOIN Final_cte F2 ON F1.end_hut = F2.start_hut
ORDER BY startpt