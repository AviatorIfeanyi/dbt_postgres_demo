
{{config(materialized='table')}}

with funding as (
  select * from {{source('world_unicorns', 'unicorn_funding')}}
)

select company_id, valuation, funding from funding