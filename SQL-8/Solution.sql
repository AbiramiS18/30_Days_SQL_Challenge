#Solution1:

with cte as
    (SELECT *, 
	SUm(case WHEN job_role is null THEN 0 ELSE 1 end)over(order by row_id) segment1
	FROM Missing_value)
  
	SELECT row_id,
	first_value(job_role) over(partition by segment1) as Job_roles,skills
	FROM cte;
    
    
#Solution2:    
    
WITH RECURSIVE cte as
	(SELECT row_id,job_role,skills
     FROM Missing_value WHERE row_id=1
     
     UNION
     
      SELECT m.row_id,coalesce(m.job_role,cte.job_role) job_role,m.skills 
      FROM missing_value m
      JOIN cte on m.row_id = cte.row_id+1)
      
      SELECT * FROM cte
     
     


