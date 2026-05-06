with 
orders as (
    select * from {{ ref('stg_postgres__orders') }}
),

transactions as (
    select * from {{ ref('stg_postgres__transactions') }}
),

refunds as (
    select * from {{ ref('stg_postgres__refunds') }}
),

methods as (
    select * from {{ ref('stg_drive__methods') }}
),

joined as (
    select
        orders.order_id,
        orders.data_ordine as order_at, 
        orders.user_id,
        orders.method_id,

        coalesce(transactions.importo, 0) as paid_amount, 
        coalesce(refunds.refund_id, 0) as refunded_amount, 
        methods.method_name

    from orders
    left join transactions on orders.order_id = transactions.order_id
    left join refunds on orders.order_id = refunds.order_id
    left join methods on orders.method_id = methods.method_id
),

final as (
    select 
        *,
        paid_amount as gross_amount
    from joined
)

select * from final