SELECT
    s.BusinessEntityID AS store_id,
    s.Name             AS store_name,
    s.ModifiedDate     AS store_modified_date
FROM {{ source('raw', 'store') }} AS s
