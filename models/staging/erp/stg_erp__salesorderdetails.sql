with
    raw_salesorderdetails as (
        select *
        from {{ source('erp_aw', 'salesorderdetail') }}
    )

    , renamed as (
        select
            cast(SALESORDERDETAILID as int) pk_orderdetail
            , cast(SALESORDERID as int) as fk_order
            , cast(PRODUCTID as int) as fk_product
            , cast(ORDERQTY as int) as quantity
            , cast(UNITPRICE as float) as unit_price
            , cast(UNITPRICEDISCOUNT as float) as discount
            --, cast(SPECIALOFFERID as varchar)
            --, cast(CARRIERTRACKINGNUMBER as varchar)
            --, cast(ROWGUID as varchar)
            --, cast(MODIFIEDDATE as varchar)
        from raw_salesorderdetails
    )

select *
from renamed
