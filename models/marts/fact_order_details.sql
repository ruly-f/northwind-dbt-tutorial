with
    customers as (
        select *
        from {{ ref('dim_customers') }} 

    )
    , employees as (
        select *
        from {{ ref('dim_employees') }}

    ) 
    , products as (
        select *
        from {{ ref('dim_products') }}

    ) 
    , shippers as (
        select *
        from {{ ref('dim_shippers') }}

    )                  
    , orders as (
        select   
            /* Primary Key */           
            orders.order_id	

            /* Foreign Key */   
            ,employees.employee_sk as employee_fk
            ,customers.customer_sk as customer_fk            
            ,shippers.shipper_sk as shipper_fk	
            
            ,orders.shipped_date		
            ,orders.ship_country		
            ,orders.ship_name		
            ,orders.order_date			
            ,orders.ship_postal_code	
            ,orders.ship_city	
            ,orders.freight	
            ,orders.required_date		
            ,orders.ship_address	
            ,orders.ship_region

        from {{ ref('stg_orders') }} as orders
        inner join customers on orders.customer_id = customers.customer_id
        inner join employees on orders.employee_id = employees.employee_id        
        ---inner join products on orders.product_id = products.product_id
        inner join shippers on orders.shipper_id = shippers.shipper_id

    )
    , order_detail_with_sk as (
        select 

            products.product_sk as product_fk          
            ,od.order_id	
            ,od.unit_price		
            ,od.quantity		
            ,od.discount     
               
        from {{ ref('stg_order_details') }} as od
        left join products on od.product_id = products.product_id        

    )
    , final as (
        select 
        
            order_detail_with_sk.order_id
            ,order_detail_with_sk.product_fk             	
            ,orders.employee_fk
            ,orders.customer_fk            
            ,orders.shipper_fk	          
            ,orders.shipped_date		
            ,orders.ship_country		
            ,orders.ship_name		
            ,orders.order_date			
            ,orders.ship_postal_code	
            ,orders.ship_city	
            ,orders.freight	
            ,orders.required_date		
            ,orders.ship_address	
            ,orders.ship_region         
            ,order_detail_with_sk.unit_price		
            ,order_detail_with_sk.quantity		
            ,order_detail_with_sk.discount     
               
        from orders
        left join order_detail_with_sk on orders.order_id = order_detail_with_sk.order_id            
    )           
select * from final