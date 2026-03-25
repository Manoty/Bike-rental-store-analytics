with source as (
    select * from {{ source('bike_store', 'customers') }}
),

renamed as (
    select
        customer_id,
        first_name,
        last_name,
        first_name || ' ' || last_name   as full_name,
        email,
        phone,                            -- ~88% null, retained as-is
        street,
        city,
        state,
        cast(zip_code as varchar)         as zip_code
    from source
)

select * from renamed