with payment as (
    
    select
        ID as payment_id,
        ORDERID as order_id,
        PAYMENTMETHOD as payment_method,
        status,
        {{ cents_to_dollars('amount', 2) }}  as amount,
        created as created_at

   from {{ source('stripe', 'payment') }} 
)

select * from payment