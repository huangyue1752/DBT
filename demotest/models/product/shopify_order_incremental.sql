{{ config(
    materialized='incremental'

) }}


    select a.*, b.title,b.vendor,b.product_type from {{ source('streaming1', 'shopify_orders') }} a left join {{ source('streaming2', 'customers_history') }} b
    on a.product_id=b.id
{% if is_incremental() %}
where processed_at > (select max(cast(processed_at as timestamp)) from {{ this }})
{% endif %}

