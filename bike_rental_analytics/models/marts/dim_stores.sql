with stores as (
    select * from {{ ref('stg_stores') }}
)

select
    store_id,
    store_name,
    phone,
    email,
    street,
    city,
    state,
    zip_code
from stores