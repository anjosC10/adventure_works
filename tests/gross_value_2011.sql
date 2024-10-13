/* This test verifies that the total gross value for the year 2011 matches the expected
reference value ($12.646.112,16), with a small margin of error to account for floating-point
precision issues. */

select
    sum(gross_value) as total_gross_value
from {{ ref('fct_sales') }}
where year(order_date) = 2011
having abs(total_gross_value - 12646112.16) > 0.05
