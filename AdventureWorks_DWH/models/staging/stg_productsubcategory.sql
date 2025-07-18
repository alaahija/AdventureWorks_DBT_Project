SELECT
    ps.ProductSubcategoryID AS subcategory_id,
    ps.Name                 AS subcategory_name,
    ps.ProductCategoryID    AS category_id,
    ps.ModifiedDate         AS subcategory_modified_date
FROM {{ source('raw', 'product_subcategory') }} AS ps
