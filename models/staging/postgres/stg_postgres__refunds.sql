with source as (
    select * from {{ source('postgres', 'rinnovi') }}
),

renamed as (
    select
        id as refund_id,
        order_id,
        data_rimborso
    from source
)

select * from renamed