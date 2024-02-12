--  Which segment had the most increase in unique products in 2021 vs 2020?

WITH pc2020 AS
(SELECT COUNT(DISTINCT(dp.product_code)) AS pc0, dp.segment AS a
FROM fact_sales_monthly AS fcm
JOIN dim_product AS dp ON fcm.product_code = dp.product_code
GROUP BY fiscal_year , segment
HAVING fiscal_year = 2020),

pc2021 AS
(SELECT COUNT(DISTINCT(dp.product_code)) AS pc1, dp.segment AS b
FROM fact_sales_monthly AS fcm
JOIN dim_product AS dp ON fcm.product_code = dp.product_code
GROUP BY fiscal_year , segment
HAVING fiscal_year = 2021)

SELECT pc2020.a AS segment, 
       pc2020.pc0 AS product_count_2020, 
       pc2021.pc1 AS product_count_2021,
       (pc1-pc0) AS difference
FROM pc2020, pc2021
WHERE a = b;