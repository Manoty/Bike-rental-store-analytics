with source as (
    select * from {{ source('bike_store', 'products') }}
),

renamed as (
    select
        product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        cast(list_price as decimal(10,2)) as list_price
    from source
)

select * from renamed