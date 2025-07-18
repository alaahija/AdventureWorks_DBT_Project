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
    coalesce(p.first_name + ' ' + p.last_name, s.store_name) as customer_name,
    case 
        when p.person_id is not null then 'Individual'
        when s.store_id is not null then 'Store'
        else 'Unknown'
    end as customer_type

from customer c
left join person p on c.person_id = p.person_id
left join store s on c.store_id = s.store_id
