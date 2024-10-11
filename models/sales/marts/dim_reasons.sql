with
    final_reasons as (
        select *
        from {{ ref('int_reasons') }}
    )

select *
from final_reasons
