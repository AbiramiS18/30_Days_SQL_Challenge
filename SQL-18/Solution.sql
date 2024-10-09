WITH CTE AS
	(SELECT d.name Department,e.name Employee, Salary,
			DENSE_RANK() OVER(PARTITION BY e.departmentid
							  ORDER BY e.salary DESC) Flag 
	 FROM Employee e JOIN
	 Department d ON e.departmentid=d.id)

SELECT Department,Employee,Salary FROM cte
WHERE Flag <= 3