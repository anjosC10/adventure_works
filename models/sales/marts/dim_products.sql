with
    final_products as (
        select *
        from {{ ref('int_products') }}
    )

select *
from final_products
