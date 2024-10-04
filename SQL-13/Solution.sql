SELECT d.name Department, e.name Employee, e.salary Salary 
FROM Employee e 
LEFT JOIN Department d ON e.departmentid = d.id
WHERE (e.salary,e.departmentid) IN 
                (SELECT max(salary),departmentid 
                FROM employee
                GROUP BY departmentid)