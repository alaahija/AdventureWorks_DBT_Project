SELECT
    c.CustomerID       AS customer_id,
    c.PersonID         AS person_id,
    c.StoreID          AS store_id,
    c.TerritoryID      AS territory_id,
    c.ModifiedDate     AS customer_modified_date
FROM {{ source('raw', 'customer') }} c
