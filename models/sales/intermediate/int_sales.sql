with
    salesorderheaders as (
        select *
        from {{ ref('stg_erp__salesorderheaders') }}
    )

    , salesorderdetails as (
        select *
        from {{ ref('stg_erp__salesorderdetails') }}
    )

    , joined as (
        select
            salesorderheaders.PK_ORDER
            , salesorderheaders.FK_CUSTOMER
            , salesorderheaders.FK_TERRITORY
            , salesorderheaders.FK_ADDRESS
            , salesorderheaders.FK_CREDITCARD
            , salesorderheaders.ORDER_DATE
            , salesorderheaders.ORDER_DUE_DATE
            , salesorderheaders.ORDER_SHIP_DATE
            , salesorderheaders.ORDER_STATUS
            , salesorderheaders.STATUS_DESCRIPTION
            , salesorderheaders.ORDER_SUBTOTAL
            , salesorderheaders.ORDER_TAX_AMOUNT
            , salesorderheaders.ORDER_FREIGHT
            , salesorderheaders.ORDER_TOTAL
            , salesorderheaders.IS_ONLINEORDER
            , salesorderdetails.PK_ORDERDETAIL
            , salesorderdetails.FK_ORDER
            , salesorderdetails.FK_PRODUCT
            , salesorderdetails.QUANTITY
            , salesorderdetails.UNIT_PRICE
            , salesorderdetails.DISCOUNT
        from salesorderheaders
        left join salesorderdetails
            on salesorderheaders.pk_order = salesorderdetails.fk_order
    )

    , metrics as (
        select
            *
            , unit_price * quantity as gross_value
            , unit_price * quantity * (1-discount) as net_value
            , order_freight / (count(*) over(partition by fk_order)) as prorated_freight
            , order_tax_amount / (count(*) over(partition by fk_order)) as prorated_tax_amount
        from joined
    )
 
    , reorder as (
        select
            PK_ORDERDETAIL
            , FK_ORDER
            , FK_PRODUCT
            , FK_CUSTOMER
            , FK_CREDITCARD
            , FK_TERRITORY
            , FK_ADDRESS
            , ORDER_DATE
            , ORDER_DUE_DATE
            , ORDER_SHIP_DATE
            , ORDER_STATUS
            , STATUS_DESCRIPTION
            , QUANTITY
            , UNIT_PRICE
            , DISCOUNT
            , GROSS_VALUE
            , NET_VALUE
            , PRORATED_FREIGHT
            , PRORATED_TAX_AMOUNT
            , ESTIMATED_PROFIT
            , AVG_ORDER_TICKET_PRODUCT
            , AVG_ORDER_TICKET_TOTAL
            , IS_ONLINEORDER
        from rejoined
    )

select *
from reorder
