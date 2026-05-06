with source as (
    select * from {{ source('postgres', 'users') }}
),

renamed as (
    select
        id as user_id,
        nome,
        cognome,
        data_nascita,
        data_registrazione
    from source
)

select * from renamed