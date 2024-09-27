#output1:

With cte as
	(SELECT *,
	lag(marks,1,0)over(ORDER BY test_id) as previous_mark
	FROM Student_performance)
    
SELECT test_id,marks FROM cte
WHERE Marks > previous_mark;


#Output2:

With cte as
	(SELECT *,
	lag(marks)over(ORDER BY test_id) as previous_mark
	FROM Student_performance)
    
SELECT test_id,marks FROM cte
WHERE Marks > previous_mark;