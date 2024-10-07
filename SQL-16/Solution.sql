SELECT stock_name, 
SUM(CASE
WHEN Operation = 'Buy' THEN -(price)
WHEN operation = 'sell' THEN price END) capital_gain_loss FROM Stocks
GROUP BY stock_name