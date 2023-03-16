{{ config(materialized='table') }}

with companies as (
  select * from {{ ref('src_companies') }}
),
dates as (
  select * from {{ ref('src_dates') }}
),
funding as (
  select * from {{ ref('src_funding') }}
),
industries as (
  select * from {{ ref('src_industries') }}
)


select 
  c.*, 
  i.industry, 
  d.date_joined, 
  d.year_founded,
  f.valuation,
  f.funding
from 
  companies as c
inner join 
  industries as i
on 
  c.company_id = i.company_id
inner join 
  dates as d
on 
  c.company_id = d.company_id
inner join 
  funding as f
on 
  d.company_id = f.company_id
