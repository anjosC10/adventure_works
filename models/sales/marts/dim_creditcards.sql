with
    final_creditcards as (
        select *
        from {{ ref('int_creditcards') }}
    )

select *
from final_creditcards
