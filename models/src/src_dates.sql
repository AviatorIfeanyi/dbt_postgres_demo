
{{config(materialized='table')}}

with dates as (
  select * from {{source('world_unicorns', 'unicorn_dates')}}
)

select company_id, date_part('year',date_joined)::int as date_joined, year_founded
from dates
