with
    raw_dates as (
        select *
        from {{ ref('stg_dates') }}
    )

select *
from raw_dates
