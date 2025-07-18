SELECT
    soh.SalesOrderID        AS sales_order_id,
    soh.OrderDate           AS order_date,
    soh.CustomerID          AS customer_id,
    soh.SalesPersonID       AS salesperson_id,
    soh.TotalDue            AS total_due,
    soh.ModifiedDate        AS sales_order_modified_date
FROM {{ source('raw', 'sales_order_header') }} AS soh
