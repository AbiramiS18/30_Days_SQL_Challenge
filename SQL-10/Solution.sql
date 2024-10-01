WITH cte AS
(SELECT product_id,
        last_value(new_price) 
            OVER(PARTITION BY product_id 
                ORDER BY change_date
                RANGE BETWEEN unbounded preceding
                AND unbounded following) price
    FROM Products
    WHERE change_date<="2019-08-16")

SELECT p.product_id, coalesce(cte.price,10) price
        FROM products p LEFT JOIN cte
        ON p.product_id = cte.product_id
        GROUP BY product_id

