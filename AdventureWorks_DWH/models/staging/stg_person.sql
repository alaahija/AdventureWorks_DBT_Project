SELECT
    p.BusinessEntityID AS person_id,
    p.FirstName     AS first_name,
    p.LastName        AS last_name,
    p.EmailPromotion   AS email_promotion,
    p.ModifiedDate     AS person_modified_date
FROM {{ source('raw', 'person') }} AS p
