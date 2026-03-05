with green_tripdata as (
    select * from {{ ref('stg_green_tripdata') }}
),
yellow_tripdata as (
    select * from {{ ref('stg_yellow_tripdata') }}
),
trips_unioned as (
    select * from green_tripdata
        union all
    select * from yellow_tripdata
)
select *
-- select distinct vendor_id
-- select distinct pickup_location_id
-- select distinct trip_type
from trips_unioned;