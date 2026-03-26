with orders as (
    select * from {{ ref('stg_orders') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

staff as (
    select * from {{ ref('stg_staffs') }}
),

stores as (
    select * from {{ ref('stg_stores') }}
),

joined as (
    select
        -- order identifiers
        oi.order_id,
        oi.item_id,
        oi.product_id,

        -- order metadata
        o.order_date,
        o.shipped_date,
        o.required_date,
        o.order_status,
        o.order_status_label,

        -- time dimensions
        date_part('year',  o.order_date)    as order_year,
        date_part('month', o.order_date)    as order_month,
        date_part('quarter', o.order_date)  as order_quarter,

        -- customer
        o.customer_id,
        c.full_name                         as customer_name,
        c.city                              as customer_city,
        c.state                             as customer_state,

        -- staff
        o.staff_id,
        st.full_name                        as staff_name,

        -- store
        o.store_id,
        str.store_name,
        str.city                            as store_city,
        str.state                           as store_state,

        -- financials
        oi.quantity,
        oi.list_price,
        oi.discount,
        oi.line_revenue,

        -- flags
        case when o.shipped_date <= o.required_date
            then true else false
        end                                 as is_on_time

    from order_items oi
    left join orders     o   on oi.order_id   = o.order_id
    left join customers  c   on o.customer_id  = c.customer_id
    left join staff      st  on o.staff_id     = st.staff_id
    left join stores     str on o.store_id     = str.store_id
)

select * from joined