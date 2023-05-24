with
    categories as (
        select 
        {{ dbt_utils.generate_surrogate_key(['category_id'])}} as sk_category,
        *
        from {{ref("stg_categories")}}
    )

select *
from categories