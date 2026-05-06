select
    o.*,
    u.nome,
    u.cognome,
    u.email
from {{ ref('orders') }} o
left join {{ ref('stg_postgres__users') }} u on o.user_id = u.user_id