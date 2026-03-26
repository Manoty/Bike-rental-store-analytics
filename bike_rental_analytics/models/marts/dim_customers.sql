with customers as (
    select * from {{ ref('stg_customers') }}
)

select
    customer_id,
    full_name,
    email,
    city,
    state,
    zip_code
from customers