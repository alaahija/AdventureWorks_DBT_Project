SELECT
    p.ProductID            AS product_id,
    p.Name                 AS product_name,
    p.ProductNumber        AS product_number,
    p.StandardCost         AS standard_cost,
    p.ListPrice            AS list_price,
    p.ProductSubcategoryID AS subcategory_id,
    p.ModifiedDate         AS product_modified_date
FROM {{ source('raw', 'product') }} AS p
