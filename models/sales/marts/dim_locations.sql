with
    final_locations as (
        select *
        from {{ ref('int_locations') }}
    )

select *
from final_locations
