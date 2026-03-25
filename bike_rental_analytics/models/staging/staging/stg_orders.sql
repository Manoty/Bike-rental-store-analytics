with source as (
    select * from {{ source('bike_store', 'orders') }}
),

renamed as (
    select
        order_id,
        customer_id,
        store_id,
        staff_id,
        order_status,
        case order_status
            when 1 then 'Pending'
            when 2 then 'Processing'
            when 3 then 'Rejected'
            when 4 then 'Completed'
        end                                         as order_status_label,
        cast(order_date    as date)                 as order_date,
        cast(required_date as date)                 as required_date,
        cast(shipped_date  as date)                 as shipped_date
    from source
)

select * from renamed