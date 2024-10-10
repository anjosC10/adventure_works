with
    raw_products as (
        select *
        from {{ source('erp_aw', 'product') }}
    )

    , renamed as (
        select
            cast(PRODUCTID as int) as pk_product
            , cast(NAME as varchar) as product_name
            --, cast(PRODUCTNUMBER as varchar)
            --, cast(MAKEFLAG as varchar)
            --, cast(FINISHEDGOODSFLAG as varchar)
            --, cast(COLOR as varchar)
            --, cast(SAFETYSTOCKLEVEL as varchar)
            --, cast(REORDERPOINT as varchar)
            --, cast(STANDARDCOST as varchar)
            --, cast(LISTPRICE as varchar)
            --, cast(SIZE as varchar)
            --, cast(SIZEUNITMEASURECODE as varchar)
            --, cast(WEIGHTUNITMEASURECODE as varchar)
            --, cast(WEIGHT as varchar)
            --, cast(DAYSTOMANUFACTURE as varchar)
            --, cast(PRODUCTLINE as varchar)
            --, cast(CLASS as varchar)
            --, cast(STYLE as varchar)
            --, cast(PRODUCTSUBCATEGORYID as varchar)
            --, cast(PRODUCTMODELID as varchar)
            --, cast(SELLSTARTDATE as varchar)
            --, cast(SELLENDDATE as varchar)
            --, cast(DISCONTINUEDDATE as varchar)
            --, cast(ROWGUID as varchar)
            --, cast(MODIFIEDDATE as varchar)
        from raw_products
    )

select *
from renamed
