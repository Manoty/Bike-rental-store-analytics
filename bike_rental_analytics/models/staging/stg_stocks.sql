with source as (
    select * from {{ source('bike_store', 'stocks') }}
),

renamed as (
    select
        store_id,
        product_id,
        quantity as stock_quantity
    from source
)

select * from renamed