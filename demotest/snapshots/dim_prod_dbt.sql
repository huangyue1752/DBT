{% snapshot customers_history %}

{{
    config(
        target_schema='product',
        unique_key='id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select * from {{ source('streaming2', 'product') }}

{% endsnapshot %}