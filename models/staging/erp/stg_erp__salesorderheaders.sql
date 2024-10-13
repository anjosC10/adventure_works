with
    raw_salesorderheaders as (
        select *
        from {{ source('erp_aw', 'salesorderheader') }}
    )

    , renamed as (
        select
            cast(SALESORDERID as int) as pk_order
            , cast(CUSTOMERID as int) as fk_customer
            , cast(TERRITORYID as int) as fk_territory
            , cast(BILLTOADDRESSID as int) as fk_address
            , cast(CREDITCARDID as int) as fk_creditcard
            , cast(ORDERDATE as date) as order_date
            , cast(DUEDATE as date) as order_due_date
            , cast(SHIPDATE as date) as order_ship_date
            , cast(STATUS as int) as order_status
            , case status
                when 1 then 'In Process'
                when 2 then 'Approved'
                when 3 then 'Backordered'
                when 4 then 'Rejected'
                when 5 then 'Shipped'
                when 6 then 'Cancelled'
                else 'Unknow'
            end as status_description
            , cast(SUBTOTAL as decimal(10,2)) as order_subtotal
            , cast(TAXAMT as decimal(10,2)) as order_tax_amount
            , cast(FREIGHT as decimal(10,2)) as order_freight
            , cast(TOTALDUE as decimal(10,2)) as order_total
            , cast(ONLINEORDERFLAG as boolean) as is_onlineorder
            --, cast(REVISIONNUMBER as varchar)
            --, cast(PURCHASEORDERNUMBER as varchar)
            --, cast(ACCOUNTNUMBER as varchar)
            --, cast(SALESPERSONID as varchar)
            --, cast(SHIPTOADDRESSID as varchar)
            --, cast(SHIPMETHODID as varchar)
            --, cast(CREDITCARDAPPROVALCODE as varchar)
            --, cast(CURRENCYRATEID as varchar)
            --, cast(COMMENT as varchar)
            --, cast(ROWGUID as varchar)
            --, cast(MODIFIEDDATE as varchar)
        from raw_salesorderheaders
    )

select *
from renamed
