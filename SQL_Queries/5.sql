-- Get the products that have the highest and lowest manufacturing costs.

SELECT fcm.product_code, dp.product, fcm.manufacturing_cost 
FROM fact_manufacturing_cost AS fcm
JOIN dim_product AS dp ON fcm.product_code = dp.product_code
WHERE manufacturing_cost IN 
       (
       SELECT max(manufacturing_cost) FROM fact_manufacturing_cost
       UNION
       SELECT min(manufacturing_cost) FROM fact_manufacturing_cost
       )
ORDER BY manufacturing_cost DESC;


