
with customer as (
    select *
    from {{ ref('stg_customer') }}
),

person as (
    select *
    from {{ ref('stg_person') }}
),

store as (
    select *
    from {{ ref('stg_store') }}
)

select
    c.customer_id,
    c.person_id,
    p.first_name,
    p.last_name,
    s.store_name,
    c.customer_modified_date
from customer c
left join person p on c.person_id = p.person_id
left join store s on c.store_id = s.store_id
