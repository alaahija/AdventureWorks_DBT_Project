-- tests/no_null_orders.sql
SELECT *
FROM {{ ref('fact_sales_order') }}
WHERE order_date IS NULL
