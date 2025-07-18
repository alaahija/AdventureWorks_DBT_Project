{{ config(
    materialized='table'
) }}

-- Configurable start and end dates (fallback if sales data not available)
with date_range as (
    select
        coalesce(min(order_date), cast('2010-01-01' as date)) as start_date,
        coalesce(max(order_date), cast('2030-12-31' as date)) as end_date
    from {{ ref('int_sales_orders') }}
),

-- Create number table by cross joining digits (up to ~10,000 days)
numbers as (
    select
        ones.n + 10 * tens.n + 100 * hundreds.n + 1000 * thousands.n as n
    from 
        (select 0 as n union all select 1 union all select 2 union all select 3 union all select 4 
         union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) ones
    cross join 
        (select 0 as n union all select 1 union all select 2 union all select 3 union all select 4 
         union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) tens
    cross join 
        (select 0 as n union all select 1 union all select 2 union all select 3 union all select 4 
         union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) hundreds
    cross join 
        (select 0 as n union all select 1 union all select 2 union all select 3 union all select 4 
         union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) thousands
),

-- Generate date range using numbers
dates as (
    select
        dateadd(day, n, dr.start_date) as date_day
    from numbers
    join date_range dr on 1 = 1
    where dateadd(day, n, dr.start_date) <= dr.end_date
)

select
    date_day,
    year(date_day) as year,
    month(date_day) as month,
    day(date_day) as day,
    datename(month, date_day) as month_name,
    datepart(weekday, date_day) as day_of_week,
    datename(weekday, date_day) as day_name,
    case 
        when datepart(weekday, date_day) in (1, 7) then cast(1 as bit)
        else cast(0 as bit)
    end as is_weekend,
    format(date_day, 'yyyy-MM') as year_month,
    format(date_day, 'yyyy-MM-dd') as date_key
from dates
