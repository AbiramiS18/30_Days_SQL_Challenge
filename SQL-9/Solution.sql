SELECT dates, product_id products
FROM Products
UNION
SELECT dates,group_concat(product_id) product FROM products
GROUP BY customer_id,dates
ORDER BY dates, products