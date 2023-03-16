
{{config(materialized='table')}}

with industries as (
  select * from {{source('world_unicorns', 'unicorn_industries')}}
)

select * from industries