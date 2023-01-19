with
    customers as (select * from {{ ref('stg_customers') }}),

    orders as (select * from {{ ref('stg_orders') }}),

    payments as (select * from {{ ref('stg_payments') }}),

    payments_orders as (

        select payment_id, orders.order_id, amount
        from payment
        left join orders using (order_id)

    ),

    final as (

        select order_id, customers.customer_id, amount

        from payments_orders

        left join customers using (customer_id)

    )

select *
from final
