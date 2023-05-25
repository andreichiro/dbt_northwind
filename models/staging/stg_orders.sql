{{config(materialized='incremental')}}

with 
    orders as (
        select *
        from {{source('northwind', 'orders')}}
        {% if is_incremental() %}
        where order_date > (select max(order_date) from {{this}})
        {% endif %}
)

select * 
from orders

