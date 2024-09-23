with q1 as (select * from {{source('shopify_orders','shopify_orders')}})
with q2 as (select a.*,CAST(a.price AS int) AS price_int from q1 )
select cast(year(processed_at) as string) as year, cast(month(processed_at) as string) as month,title, sum(price_int) as revenue from q1 group by 1,2,3