with
    int_address as (
        select *
        from {{ ref('stg_erp__address') }}
    )

    , int_stateprovince as (
        select *
        from {{ ref('stg_erp__stateprovince') }}
    )

    , int_countryregion as (
        select *
        from {{ ref('stg_erp__countryregion') }}
    )

    , joined as (
        select
            int_address.pk_address
            , int_stateprovince.fk_territory
            , int_address.fk_state_province
            , int_stateprovince.fk_country
            , int_address.address_city
            , int_stateprovince.stateprovince_name
            , int_countryregion.country_name
        from int_address
        left join int_stateprovince
            on int_address.fk_state_province = int_stateprovince.pk_stateprovince
        left join int_countryregion
            on int_stateprovince.fk_country = int_countryregion.pk_country
    )

select *
from joined
