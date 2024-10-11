with
    raw_customers as (
        select *
        from {{ source('erp_aw', 'customer') }}
    )

    , renamed as (
        select
            cast(CUSTOMERID as int) as pk_customer
            , cast(PERSONID as int) as fk_person
            , cast(STOREID as int) as fk_store
            , cast(TERRITORYID as int) as fk_territory
            --, cast(ROWGUID as varchar) 
            --, cast(MODIFIEDDATE as varchar) 
        from raw_customers
    )

select *
from renamed
