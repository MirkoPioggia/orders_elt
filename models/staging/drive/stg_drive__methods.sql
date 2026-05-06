with source as (
    -- Qui cambiamo 'drive' con 'postgres'
    select * from {{ source('postgres', 'methods') }}
),

renamed as (
    select
        id as method_id,
        nome as method_name -- Usiamo 'nome' perché nelle tue slide è in italiano
    from source
)

select * from renamed