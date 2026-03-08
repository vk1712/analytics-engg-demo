with trips_unioned AS (
    select * from {{ ref('int_trips_unioned') }}
),
payment_type_name AS (
    select * from {{ ref('payment_type_lookup') }}
)
select
    *,
    concat(tu.vendor_id, '~', tu.pickup_datetime, '~', tu.dropoff_datetime, '~', tu.pickup_location_id, '~', tu.dropoff_location_id) as trip_id
from 
    trips_unioned tu
        join
    payment_type_name ptn on tu.payment_type = ptn.payment_type
where tu.payment_type != 3;