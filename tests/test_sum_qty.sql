with 
    validation as (
        select sum(quantity) as sum_val
        from {{ref ('fact_order_details')}}
    )

select * from validation where sum_val != 51317