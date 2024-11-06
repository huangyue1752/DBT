{{ config(
    materialized='table',  
    database='streaming1', 
    schema='silver'  
) }}

with q1 as (
    select * from {{ source('streaming1', 'product') }}
)
select * from q1


