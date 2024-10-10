with
    int_products as (
        select *
        from {{ ref('stg_erp__products') }}
    )

select *
from int_products
