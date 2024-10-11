with
    int_creditcards as (
        select *
        from {{ ref('stg_erp__creditcards') }}
    )

select *
from int_creditcards
