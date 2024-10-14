with
    products as (
        select *
        from {{ ref('stg_erp__products') }}
    )

    , subcategories as (
        select *
        from {{ ref('stg_erp__productsubcategories') }}
    )

    , categories as (
        select *
        from {{ ref('stg_erp__productcategories') }}
    )

    , joined as (
        select
            products.pk_product
            , categories.pk_product_category as fk_product_category
            , products.fk_product_subcategory
            , products.product_name
            , categories.product_category
            , subcategories.product_subcategory
        from products
        left join subcategories
            on products.fk_product_subcategory = subcategories.pk_product_subcategory
        left join categories
            on subcategories.fk_product_category = categories.pk_product_category
    )

select *
from joined
