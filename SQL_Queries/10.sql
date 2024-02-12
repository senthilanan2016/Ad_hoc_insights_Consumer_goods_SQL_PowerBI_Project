-- Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021?

WITH top_product AS (
SELECT 
    division, 
    dp.product_code, 
    CONCAT(dp.product, " (", dp.variant, ")") AS product,
    SUM(sold_quantity) AS total_sold_quantity,
    RANK() OVER (PARTITION BY division ORDER BY sum(sold_quantity) DESC) AS rank_order
 FROM fact_sales_monthly AS fsm
 JOIN dim_product AS dp ON fsm.product_code = dp.product_code
 WHERE fiscal_year = 2021
 GROUP BY product_code, division, dp.product, dp.variant
)
SELECT * FROM top_product
WHERE rank_order < 4;