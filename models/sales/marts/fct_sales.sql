with
    dim_creditcards as (
        select *
        from {{ ref('dim_creditcards') }}
    )
    
    , dim_customers as (
        select *
        from {{ ref('dim_customers') }}
    )
    
    , dim_dates as (
        select *
        from {{ ref('dim_dates') }}
    )

    , dim_locations as (
        select *
        from {{ ref('dim_locations') }}
    )
    
    , dim_products as (
        select *
        from {{ ref('dim_products') }}
    )

    , dim_reasons as (
        select *
        from {{ ref('dim_reasons') }}
    )
    
    , final_sales as (
        select *
        from {{ ref('int_sales') }}
    )

select *
from final_sales
