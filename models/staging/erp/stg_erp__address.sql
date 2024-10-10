with
    raw_address as (
        select *
        from {{ source('erp_aw', 'address') }}
    )

    , renamed as (
        select
            cast(ADDRESSID as int) as pk_address
            , cast(STATEPROVINCEID as int) fk_state_province
            , cast(CITY as varchar) as address_city
            --, cast(ADDRESSLINE1 as varchar)
            --, cast(ADDRESSLINE2 as varchar)
            --, cast(POSTALCODE as varchar)
            --, cast(SPATIALLOCATION as varchar)
            --, cast(ROWGUID as varchar)
            --, cast(MODIFIEDDATE as varchar)
        from raw_address
    )

select *
from renamed
