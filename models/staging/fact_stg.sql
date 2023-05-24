with categories as (
    select *
    from {{ref("dim_categories")}}
),

products as (
    select *
    from {{ref('dim_products')}}
),

suppliers as (
    select *
    from {{ref("dim_suppliers")}}
),

order_details as (
    select *
    from {{ref("stg_order_details")}}
)

select 
    categories.sk_category,
    categories.category_name,
    categories.description,
    products.product_name,
    suppliers.company_name,
    suppliers.contact_name,
    order_details.unit_price,
    order_details.quantity
    from categories
    left join products on products.category_id = products.category_id
    left join suppliers on suppliers.supplier_id = products.supplier_id
    left join order_details on order_details.product_id = products.product_id