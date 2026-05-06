with source as (
    select
    id as transaction_id,
    id_ordine as order_id,  -- <--- Qui prendiamo 'id_ordine' e lo rinominiamo in 'order_id'
    data_transazione,
    importo
from {{ source('postgres', 'transazioni') }}
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