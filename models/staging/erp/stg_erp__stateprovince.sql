with
    raw_stateprovince as (
        select *
        from {{ source('erp_aw', 'stateprovince') }}
    )

    , renamed as (
        select
            cast(STATEPROVINCEID as int) as pk_stateprovince
            , cast(COUNTRYREGIONCODE as varchar) as fk_country
            , cast(TERRITORYID as int) as fk_territory
            , cast(NAME as varchar) as stateprovince_name
            --, cast(STATEPROVINCECODE as varchar)
            --, cast(ISONLYSTATEPROVINCEFLAG as varchar)
            --, cast(ROWGUID as varchar)
            --, cast(MODIFIEDDATE as varchar)
        from raw_stateprovince
    )

select *
from renamed
