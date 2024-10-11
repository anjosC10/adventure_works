with
    customers as (
        select *
        from {{ ref('stg_erp__customers') }}
    )

    , stores as (
        select *
        from {{ ref('stg_erp__stores') }}
    )

    , persons as (
        select *
        from {{ ref('stg_erp__persons') }}
    )

    , joined as (
        select
            customers.pk_customer
            , customers.fk_person
            , customers.fk_store
            , customers.fk_territory
            , stores.store_name
            , persons.person_name
        from customers
        left join stores
            on customers.fk_store = stores.pk_store
        left join persons
            on customers.fk_person = persons.pk_person
    )

select *
from joined
