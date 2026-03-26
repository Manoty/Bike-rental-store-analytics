with orders as (
    select * from {{ ref('int_orders_enriched') }}
)

select
    -- keys
    order_id,
    item_id,
    product_id,
    customer_id,
    staff_id,
    store_id,

    -- time
    order_date,
    shipped_date,
    required_date,
    order_year,
    order_month,
    order_quarter,

    -- status
    order_status,
    order_status_label,

    -- financials
    quantity,
    list_price,
    discount,
    line_revenue,

    -- flags
    is_on_time

from orders
where order_status_label = 'Completed'