with source as (
    select * from {{ source('postgres', 'orders') }}
),

renamed as (
    select
        id as order_id,
        user_id,
        plan_id,
        method_id,
        data_ordine
    from source
)

select * from renamed