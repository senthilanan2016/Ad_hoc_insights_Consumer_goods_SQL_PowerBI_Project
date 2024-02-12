-- Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?

WITH channel_sales AS (
SELECT dc.channel,
       SUM(fgp.gross_price * fcm.sold_quantity) AS gross_sales
FROM dim_customer as dc
JOIN fact_sales_monthly as fcm ON dc.customer_code = fcm.customer_code
JOIN fact_gross_price as fgp ON fcm.product_code = fgp.product_code
WHERE fcm.fiscal_year = 2021
GROUP BY dc.channel
ORDER BY gross_sales DESC)

SELECT channel, 
       CONCAT(CAST(ROUND(gross_sales/1000000, 2) AS CHAR), " M") AS gross_sale,
       CONCAT(CAST(ROUND(gross_sales/(SUM(gross_sales) OVER () )*100 ,2) AS CHAR), "%") AS pcnt
FROM channel_sales;       