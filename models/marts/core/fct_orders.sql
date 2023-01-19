with
    customers as (select * from {{ ref('stg_customers') }}),

    payments_orders as (select * from {{ ref('stg_payments_orders') }}),

    final as (

        select order_id, customers.customer_id, amount

        from payments_orders

        left join customers using (customer_id)

    )

select *
from final
