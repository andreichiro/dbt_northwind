with
    products as (
        select
        {{dbt_utils.generate_surrogate_key(['product_id'])}} as product_sk,
        *
        from {{ref("stg_products")}}
    )

select *
from products