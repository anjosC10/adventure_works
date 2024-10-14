with
    raw_productsubcategories as (
        select *
        from {{ source('erp_aw', 'productsubcategory') }}
    )

    , renamed as (
        select
            cast(PRODUCTSUBCATEGORYID as int) as pk_product_subcategory
            , cast(PRODUCTCATEGORYID as int) as fk_product_category
            , cast(NAME as varchar) as product_subcategory
            --, cast(ROWGUID as varchar)
            --, cast(MODIFIEDDATE as varchar)
        from raw_productsubcategories
    )

select *
from renamed
