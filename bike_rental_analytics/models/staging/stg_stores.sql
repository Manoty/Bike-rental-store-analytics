with source as (
    select * from {{ source('bike_store', 'stores') }}
),

renamed as (
    select
        store_id,
        store_name,
        phone,
        email,
        street,
        city,
        state,
        cast(zip_code as varchar) as zip_code
    from source
)

select * from renamed
