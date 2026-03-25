with source as (
    select * from {{ source('bike_store', 'brands') }}
),

renamed as (
    select
        brand_id,
        brand_name
    from source
)

select * from renamed