SELECT
    sod.SalesOrderID          AS sales_order_id,
    sod.SalesOrderDetailID    AS sales_order_detail_id,
    sod.ProductID             AS product_id,
    sod.OrderQty              AS order_qty,
    sod.UnitPrice             AS unit_price,
    sod.UnitPriceDiscount     AS unit_price_discount,
    sod.LineTotal             AS line_total,
    sod.ModifiedDate          AS sales_order_detail_modified_date
FROM {{ source('raw', 'sales_order_detail') }} AS sod
