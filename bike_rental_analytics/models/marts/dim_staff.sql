with staff as (
    select * from {{ ref('stg_staffs') }}
),

stores as (
    select * from {{ ref('stg_stores') }}
)

select
    st.staff_id,
    st.full_name         as staff_name,
    st.email,
    st.is_active,
    st.manager_id,
    st.store_id,
    str.store_name
from staff st
left join stores str on st.store_id = str.store_id