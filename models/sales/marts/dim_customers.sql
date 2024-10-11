with
    final_customers as (
        select *
        from {{ ref('int_customers') }}
    )

select *
from final_customers
