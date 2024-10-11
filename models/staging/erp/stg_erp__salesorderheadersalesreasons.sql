with
    raw_salesorderheadersalesreason as (
        select *
        from {{ source('erp_aw', 'salesorderheadersalesreason') }}
    )

    , renamed as (
        select
            cast(SALESORDERID as int) as pk_salesorder
            , cast(SALESREASONID as int) as fk_reason
            --, cast(MODIFIEDDATE as varchar)
        from raw_salesorderheadersalesreason
    )

select *
from renamed
