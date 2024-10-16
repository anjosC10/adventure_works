/* This test verifies that the total gross value for the year 2011 matches the expected
reference value given by Carlos ($12.646.112,16), with a small margin of error to account
for floating-point precision issues. */

with
    gross_value_2011 as(
        select
            sum(gross_value) as total_gross_value
        from {{ ref('int_sales') }}
        where year(order_date) = 2011
    )

select
    total_gross_value
from gross_value_2011
where total_gross_value not between 12646112.16 and 12646112.26
