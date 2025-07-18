SELECT
    sp.BusinessEntityID AS salesperson_id,
    sp.SalesQuota       AS sales_quota,
    sp.Bonus            AS bonus,
    sp.CommissionPct    AS commission_pct,
    sp.ModifiedDate     AS salesperson_modified_date
FROM {{ source('raw', 'sales_person') }} AS sp
