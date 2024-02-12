--  Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market.

SELECT fpid.customer_code,
       dc.customer,
       CAST(AVG(pre_invoice_discount_pct) AS DECIMAL (10,4)) AS average_discount_percentage
FROM fact_pre_invoice_deductions AS fpid
JOIN dim_customer AS dc ON fpid.customer_code = dc.customer_code
WHERE fiscal_year = 2021 AND market = 'India'
GROUP BY fpid.customer_code, dc.customer
ORDER BY average_discount_percentage DESC
LIMIT 5;