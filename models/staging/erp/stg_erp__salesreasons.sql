with
    raw_reasons as (
        select *
        from {{ source('erp_aw', 'salesreason') }}
    )

    , renamed as (
        select
            cast(SALESREASONID as int) as pk_reason
            , cast(NAME as varchar) as reason_name
            , cast(REASONTYPE as varchar) as reason_type
            --, cast(MODIFIEDDATE as varchar)
        from raw_reasons
    )

select *
from renamed
