with source as (
    select * from {{ source('postgres', 'metodi') }}
),

renamed as (
    select
        id as method_id,
        nome as method_name 
    from source
)

select * from renamed