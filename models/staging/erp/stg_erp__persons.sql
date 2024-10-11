with
    raw_persons as (
        select *
        from {{ source('erp_aw', 'person') }}
    )

    , renamed as (
        select
            cast(BUSINESSENTITYID as int) as pk_person
            , FIRSTNAME || ' ' || LASTNAME as person_name
            --, cast(PERSONTYPE as varchar)
            --, cast(NAMESTYLE as varchar)
            --, cast(TITLE as varchar)
            --, cast(FIRSTNAME as varchar)
            --, cast(MIDDLENAME as varchar)
            --, cast(LASTNAME as varchar)
            --, cast(SUFFIX as varchar)
            --, cast(EMAILPROMOTION as varchar)
            --, cast(ADDITIONALCONTACTINFO as varchar)
            --, cast(DEMOGRAPHICS as varchar)
            --, cast(ROWGUID as varchar)
            --, cast(MODIFIEDDATE as varchar)
        from raw_persons
    )

select *
from renamed
