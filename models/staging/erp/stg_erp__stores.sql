with
    raw_stores as (
        select *
        from {{ source('erp_aw', 'store') }}
    )

    , renamed as (
        select
            cast(BUSINESSENTITYID as int) as pk_store
            , cast(NAME as varchar) as store_name
            --, cast(SALESPERSONID as int) as fk_person
            --, cast(DEMOGRAPHICS as varchar)
            --, cast(ROWGUID as varchar)
            --, cast(MODIFIEDDATE as varchar)
        from raw_stores
    )

select *
from renamed
