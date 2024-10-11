with
    raw_creditcards as (
        select *
        from {{ source('erp_aw', 'creditcard') }}
    )

    , renamed as (
        select
            cast(CREDITCARDID as int) as pk_creditcard
            , cast(CARDTYPE as varchar) as creditcard_type
            --, cast(CARDNUMBER as varchar)
            --, cast(EXPMONTH as varchar)
            --, cast(EXPYEAR as varchar)
            --, cast(MODIFIEDDATE as varchar)
        from raw_creditcards
    )

select *
from renamed
