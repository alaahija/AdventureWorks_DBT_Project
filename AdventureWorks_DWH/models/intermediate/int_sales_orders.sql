{{ config(materialized='table') }}


with order_header as (
    select *
    from {{ ref('stg_salesorderheader') }}
),

order_detail as (
    select *
    from {{ ref('stg_salesorderdetail') }}
)

select
    oh.sales_order_id,
    oh.order_date,
    oh.customer_id,
    oh.salesperson_id,
    od.product_id,
    od.order_qty,
    od.unit_price,
    od.unit_price_discount,
    od.line_total
from order_header oh
join order_detail od
    on oh.sales_order_id = od.sales_order_id
