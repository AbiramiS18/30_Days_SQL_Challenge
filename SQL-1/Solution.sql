WITH Cte AS
	(SELECT *,CASE WHEN brand1 < brand2 THEN CONCAT(brand1,brand2,year)
     ELSE CONCAT(brand2,brand1,year) END as pair_id FROM Brands),

Cte_rn AS
	(SELECT *,
     ROW_NUMBER() OVER(PARTITION BY pair_id ORDER BY pair_id) as rn 
      FROM cte)
      
SELECT Brand1,Brand2,Year,custom1,custom2,custom3,custom4 fROM cte_rn
WHERE rn =1 or
custom1 <> custom3 and custom2 <> custom4
Order by brand1