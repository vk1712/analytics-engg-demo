-- select * from taxi_rides_ny.prod.green_tripdata
select * from {{ source('raw_data', 'green_tripdata') }}