-- What is the percentage of unique product increase in 2021 vs. 2020?

WITH up2020 AS
(SELECT COUNT(DISTINCT(product_code)) AS up0 FROM fact_sales_monthly  
WHERE fiscal_year = 2020),

up2021 AS
(SELECT COUNT(DISTINCT(product_code)) AS up1 FROM fact_sales_monthly  
WHERE fiscal_year = 2021) 

SELECT 
      up2020.up0 AS unique_product_2020, 
      up2021.up1 AS unique_product_2021, 
      CONCAT(CAST((up1-up0)*100/up0 AS DECIMAL (10,2)), '%') AS pcnt_change
FROM up2020, up2021;

