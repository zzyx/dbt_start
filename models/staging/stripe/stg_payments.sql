with payments as (
    
    select
        ID as payment_id,
        ORDERID as order_id,
        PAYMENTMETHOD as payment_method,
        status,
        amount,
        created as created_at

    from stripe.payment
)

select * from payments