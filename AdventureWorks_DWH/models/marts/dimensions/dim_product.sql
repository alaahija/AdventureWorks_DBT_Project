select
    product_id ,
    product_name ,
    product_number,
   -- color,
    standard_cost,
    list_price,
    --size,
  --  weight,
    product_modified_date
from {{ ref('stg_product') }}
