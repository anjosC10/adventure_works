with
    final_sales as (
        select *
        from {{ ref('int_sales') }}
    )

select *
from final_sales
