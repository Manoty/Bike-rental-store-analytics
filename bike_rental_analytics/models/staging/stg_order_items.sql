with source as (
    select * from {{ source('bike_store', 'order_items') }}
),

renamed as (
    select
        order_id,
        item_id,
        product_id,
        quantity,
        cast(list_price as decimal(10,2))                             as list_price,
        cast(discount as decimal(4,2))                                as discount,
        cast(
            quantity * list_price * (1 - discount)
        as decimal(10,2))                                             as line_revenue
    from source
)

select * from renamed