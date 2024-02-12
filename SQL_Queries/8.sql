-- In which quarter of 2020, got the maximum total_sold_quantity?

SELECT 
	  CASE
        WHEN date BETWEEN '2019-09-01' AND '2019-11-01' THEN 1  
        WHEN date BETWEEN '2019-12-01' AND '2020-02-01' THEN 2
        WHEN date BETWEEN '2020-03-01' AND '2020-05-01' THEN 3
        WHEN date BETWEEN '2020-06-01' AND '2020-08-01' THEN 4
      END AS Quarters,
      CONCAT(CAST(ROUND(SUM(sold_quantity)/1000000, 2) AS CHAR), " M") AS total_sold_quantity      
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY Quarters
ORDER BY total_sold_quantity DESC;