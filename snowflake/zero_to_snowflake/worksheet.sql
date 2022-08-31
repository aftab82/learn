create or replace table trips
(tripduration integer,
starttime timestamp,
stoptime timestamp,
start_station_id integer,
start_station_name string,
start_station_latitude float,
start_station_longitude float,
end_station_id integer,
end_station_name string,
end_station_latitude float,
end_station_longitude float,
bikeid integer,
membership_type string,
usertype string,
birth_year integer,
gender integer);

create stage citibike_trips
    url = 's3://snowflake-workshop-lab/citibike-trips-csv/'
    -- credentials = (aws_secret_key = '<key>' aws_key_id = '<id>')
    ;
    
list @citibike_trips;


--create file format

create or replace file format csv type='csv'
  compression = 'auto' field_delimiter = ',' record_delimiter = '\n'
  skip_header = 0 field_optionally_enclosed_by = '\042' trim_space = false
  error_on_column_count_mismatch = false escape = 'none' escape_unenclosed_field = '\134'
  date_format = 'auto' timestamp_format = 'auto' null_if = ('') comment = 'file format for ingesting citibike trips data';
  
show file formats in database citibike;

copy into trips from @citibike_trips file_format=csv PATTERN = '.*csv.*' ;
-- approx. 400 files, 60M rows
--small wh : 24s
--large wh : 10s
truncate table trips;

select * from trips limit 10;

alter warehouse compute_wh set warehouse_size='large';

show warehouses;

select * from trips limit 20;


select date_trunc('hour', starttime) as "date",
count(*) as "num trips",
avg(tripduration)/60 as "avg duration (mins)",
avg(haversine(start_station_latitude, start_station_longitude, end_station_latitude, end_station_longitude)) as "avg distance (km)"
from trips
group by 1 order by 1;


select
monthname(starttime) as "month",
count(*) as "num trips"
from trips
group by 1 order by 2 desc;


create table trips_dev clone trips;


create database weather;


use warehouse compute_wh;

use database weather;

use schema public;

create table json_weather_data (v variant);

create stage nyc_weather
url = 's3://snowflake-workshop-lab/zero-weather-nyc';

list @nyc_weather;

copy into json_weather_data
from @nyc_weather 
    file_format = (type = json strip_outer_array = true);
    
select * from json_weather_data limit 10;

create or replace view json_weather_data_view as
select
    v:obsTime::timestamp as observation_time,
    v:station::string as station_id,
    v:name::string as city_name,
    v:country::string as country,
    v:latitude::float as city_lat,
    v:longitude::float as city_lon,
    v:weatherCondition::string as weather_conditions,
    v:coco::int as weather_conditions_code,
    v:temp::float as temp,
    v:prcp::float as rain,
    v:tsun::float as tsun,
    v:wdir::float as wind_dir,
    v:wspd::float as wind_speed,
    v:dwpt::float as dew_point,
    v:rhum::float as relative_humidity,
    v:pres::float as pressure
from
    json_weather_data
where
    station_id = '72502';
    
select * from json_weather_data_view
where date_trunc('month',observation_time) = '2018-01-01'
limit 20;

select weather_conditions as conditions
,count(*) as num_trips
from citibike.public.trips
left outer join json_weather_data_view
on date_trunc('hour', observation_time) = date_trunc('hour', starttime)
where conditions is not null
group by 1 order by 2 desc;

drop table json_weather_data;

select * from json_weather_data limit 10;

undrop table json_weather_data;

select * from json_weather_data_view limit 10;

use warehouse compute_wh;

use database citibike;

use schema public;

update trips set start_station_name = 'oops';

select
start_station_name as "station",
count(*) as "rides"
from trips
group by 1
order by 2 desc
limit 20;

set query_id =
(select query_id from table(information_schema.query_history_by_session (result_limit=>5))
where query_text like 'update%' order by start_time limit 1);

create or replace table trips as
(select * from trips before (statement => $query_id));

select
start_station_name as "station",
count(*) as "rides"
from trips
group by 1
order by 2 desc
limit 20;

create role junior_dba;

grant role junior_dba to user syedxali;

use role junior_dba;

use role accountadmin;

grant usage on warehouse compute_wh to role junior_dba;

use role junior_dba;

use warehouse compute_wh;

use role accountadmin;



use role accountadmin;

drop share if exists citibike_share;
-- If necessary, replace "zero_to_snowflake-shared_data" with the name you used for the share

drop database if exists citibike;

drop database if exists weather;

drop warehouse if exists analytics_wh;

drop role if exists junior_dba;

grant usage on database citibike to role junior_dba;

grant usage on database weather to role junior_dba;

use role junior_dba;
