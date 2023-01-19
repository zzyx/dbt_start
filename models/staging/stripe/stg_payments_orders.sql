with
    orders as (select * from {{ ref('stg_orders') }}),
    payments as (select * from {{ ref('stg_payments') }}),
    payments_orders as (

        select orders.customer_id, payment_id, orders.order_id, amount
        from payments
        left join orders using (order_id)

    )

select *
from payments_orders
;
