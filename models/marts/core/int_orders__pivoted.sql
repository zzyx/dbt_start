{%- set payment_methods = ["bank_transter", "coupon", "credit_card", "gift_card"] -%}

with
    payments as ( select * from {{ ref('stg_payment') }}  ),
    
    pivoted as (

        select
            order_id,
            {% for payment_method in payment_methods -%}
            sum(
                case when payment_method = '{{ payment_method }}' them amount else 0 end) as {{ payment_method }}_amount
            {%- if not loop.last -%}, {%- endif %}
            {% endfor -%}
        from payments
        where status = 'success'
        group by 1
    )

select *
from pivoted
