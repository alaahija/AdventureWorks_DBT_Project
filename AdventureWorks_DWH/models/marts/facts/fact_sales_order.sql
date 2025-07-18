with sales_header as (
    select
        sales_order_id,
        customer_id,
        order_date,
        salesperson_id
    from {{ ref('stg_salesorderheader') }}  -- staging model for sales order header
),

sales_detail as (
    select
        sales_order_id,
        product_id,
        order_qty,
        unit_price,
        line_total = order_qty * unit_price
    from {{ ref('stg_salesorderdetail') }}  -- staging model for sales order detail
)

select
    h.sales_order_id as sales_order_id,
    h.customer_id as customer_id,
    cast(h.order_date as date) as order_date,
    h.salesperson_id as sales_person_id,
    sd.product_id as product_id,
    sd.order_qty,
    sd.unit_price,
    sd.line_total

from sales_header h
left join sales_detail sd on h.sales_order_id = sd.sales_order_id
