SELECT
    pc.ProductCategoryID AS category_id,
    pc.Name              AS category_name,
    pc.ModifiedDate      AS category_modified_date
FROM {{ source('raw', 'product_category') }} AS pc
