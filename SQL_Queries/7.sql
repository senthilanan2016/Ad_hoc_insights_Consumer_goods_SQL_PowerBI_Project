-- Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This analysis helps to get an idea of low and high-performing months and take strategic decisions.

SELECT CONCAT(MONTHNAME(fsm.date)," ", YEAR(fsm.date)) AS Month,
       fsm.fiscal_year,
       CONCAT(CAST(ROUND(SUM(fgp.gross_price * fsm.sold_quantity)/1000000, 2)AS CHAR), " M") 
       AS Gross_Sales_Amount
FROM fact_sales_monthly AS fsm
JOIN fact_gross_price AS fgp ON fsm.product_code = fgp.product_code 
JOIN dim_customer AS dc
ON fsm.customer_code = dc.customer_code
WHERE dc.customer = 'Atliq Exclusive'
GROUP BY Month, fsm.fiscal_year;
