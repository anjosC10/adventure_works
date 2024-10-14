with
    final_dates as (
        select
            DATE_DAY as pk_date
            --, PRIOR_DATE_DAY
            --, NEXT_DATE_DAY
            --, PRIOR_YEAR_DATE_DAY
            --, PRIOR_YEAR_OVER_YEAR_DATE_DAY
            , DAY_OF_WEEK
            --, DAY_OF_WEEK_ISO
            , DAY_OF_WEEK_NAME
            , DAY_OF_WEEK_NAME_SHORT
            , DAY_OF_MONTH
            , DAY_OF_YEAR
            --, WEEK_START_DATE
            --, WEEK_END_DATE
            --, PRIOR_YEAR_WEEK_START_DATE
            --, PRIOR_YEAR_WEEK_END_DATE
            , WEEK_OF_YEAR
            --, ISO_WEEK_START_DATE
            --, ISO_WEEK_END_DATE
            --, PRIOR_YEAR_ISO_WEEK_START_DATE
            --, PRIOR_YEAR_ISO_WEEK_END_DATE
            --, ISO_WEEK_OF_YEAR
            --, PRIOR_YEAR_WEEK_OF_YEAR
            --, PRIOR_YEAR_ISO_WEEK_OF_YEAR
            , MONTH_OF_YEAR
            , MONTH_NAME
            , MONTH_NAME_SHORT
            --, MONTH_START_DATE
            --, MONTH_END_DATE
            --, PRIOR_YEAR_MONTH_START_DATE
            --, PRIOR_YEAR_MONTH_END_DATE
            , QUARTER_OF_YEAR
            --, QUARTER_START_DATE
            --, QUARTER_END_DATE
            , YEAR_NUMBER
            --, YEAR_START_DATE
            --, YEAR_END_DATE
        from {{ ref('stg_dates') }}
    )

select *
from final_dates
