with
    suppliers as (
        select
        {{dbt_utils.generate_surrogate_key(['supplier_id'])}} as sk_supplier,
        *
        from {{ref("stg_suppliers")}}
    )
select *
from suppliers