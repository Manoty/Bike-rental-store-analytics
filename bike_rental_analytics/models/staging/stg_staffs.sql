with source as (
    select * from {{ source('bike_store', 'staffs') }}
),

renamed as (
    select
        staff_id,
        first_name,
        last_name,
        first_name || ' ' || last_name     as full_name,
        email,
        phone,
        store_id,
        cast(manager_id as integer)        as manager_id, -- null = top-level manager
        case when active = 1 then true else false end as is_active
    from source
)

select * from renamed