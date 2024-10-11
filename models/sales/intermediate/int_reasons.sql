with
    salesorderheadersalesreasons as (
        select *
        from {{ ref('stg_erp__salesorderheadersalesreasons') }}
    )

    , salesreasons as (
        select *
        from {{ ref('stg_erp__salesreasons') }}
    )

    , joined as (
        select
            salesorderheadersalesreasons.pk_salesorder
            , salesorderheadersalesreasons.fk_reason
            , salesreasons.reason_name
            , salesreasons.reason_type
        from salesorderheadersalesreasons
        left join salesreasons
            on salesorderheadersalesreasons.fk_reason = salesreasons.pk_reason
    )

select *
from joined
