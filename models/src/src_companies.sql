
{{config(materialized='table')}}

with companies as (
  select * from {{source('world_unicorns', 'unicorn_companies')}}
)

select company_id, company, country, continent from companies