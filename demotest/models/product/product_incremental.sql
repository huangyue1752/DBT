{{ config(
    materialized='incremental',  
    database='streaming1', 
    schema='golden'  
) }}

with q1 as (
    select * from {{ source('streaming1', 'weather_table') }}
)
select * from q1

{% if is_incremental() %}
where timestamp>=(select max(timestamp) from {{this}})
{% endif %}


