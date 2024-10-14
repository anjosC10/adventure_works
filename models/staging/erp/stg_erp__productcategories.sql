with
    raw_productcategories as (
        select *
        from {{ source('erp_aw', 'productcategory') }}
    )

    , renamed as (
        select
            cast(PRODUCTCATEGORYID as int) as pk_product_category
            , cast(NAME as varchar) as product_category
            --, cast(ROWGUID as varchar)
            --, cast(MODIFIEDDATE as varchar)
        from raw_productcategories
    )

select *
from renamed
