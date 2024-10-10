with
    raw_countryregion as (
        select *
        from {{ source('erp_aw', 'countryregion') }}
    )

    , renamed as (
        select
            cast(COUNTRYREGIONCODE as varchar) as pk_country
            , cast(NAME as varchar) as country_name
            --, cast(MODIFIEDDATE as varchar)
        from raw_countryregion
    )

select *
from renamed