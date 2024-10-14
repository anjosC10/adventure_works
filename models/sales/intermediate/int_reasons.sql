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

    , aggregated as (
        select
            pk_salesorder
            , listagg(trim(reason_name), '; ') within group (order by reason_name) as reason_name
            , listagg(trim(reason_type), '; ') within group (order by reason_type) as reason_type
        from joined
        group by pk_salesorder
    )

select *
from aggregated
