#Table1:

WITH cte AS
	(SELECT * FROM Salary
		CROSS JOIN Income
	UNION
	SELECT * FROM Salary
		CROSS JOIN Deduction)
SELECT 
	emp_id,
    emp_name,
    income AS TRNS_TYPE,
    round((base_salary*percent)/100,0) AS Amount
FROM cte
ORDER BY emp_id;


#Table2:

WITH cte AS
	((SELECT emp_id,emp_name,income trans_type,round(S.base_salary * i.percentage/100 )  As amount FROM Salary S CROSS JOIN income i)
	 UNION all
	(SELECT emp_id,emp_name,deduction trans_type,round(S.base_salary * d.percentage/100) As amount FROM salary s CROSS JOIn Deduction d))
	 

	SELECT emp_name Employee,
	SUM(CASE WHEN trans_type = "Basic" THEN amount ELSE 0 END) AS Basic,
	SUM(CASE WHEN trans_type = "Allowance" THEN amount ELSE 0 END) AS Allowance,
	SUM(CASE WHEN trans_type = "Others" THEN amount ELSE 0 END) AS Others,
    SUM(if( trans_type = "Basic",amount,0)+ if(trans_type = "Allowance",amount,0) +  IF(trans_type = "Others", amount,0)) AS Gross,
	SUM(CASE WHEN trans_type = "insurance" THEN amount ELSE 0 END) AS Insurance,
	SUM(CASE WHEN trans_type = "Health" THEN amount ELSE 0 END) AS Health,
	SUM(CASE WHEn trans_type = "House" THEN amount ELSE 0 END) AS House,
    SUM(IF( trans_type = "insurance",amount,0)+ IF(trans_type = "Health",amount,0) +  IF(trans_type = "House", amount,0)) AS Total_Deduction,
    SUM(IF( trans_type = "Basic",amount,0)+ IF(trans_type = "Allowance",amount,0) +  IF(trans_type = "Others", amount,0) - 
		(IF( trans_type = "insurance",amount,0)+ IF(trans_type = "Health",amount,0) +  IF(trans_type = "House", amount,0))) AS Net_pay
	FROM cte 
    GROUP BY Employee