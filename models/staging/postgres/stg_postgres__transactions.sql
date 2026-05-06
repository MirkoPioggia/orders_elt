with source as (
    select * from {{ source('postgres', 'transactions') }}
),

renamed as (
    select
        id as transaction_id,
        order_id,
        importo,
        data_transazione
    from source
)

select * from renamed