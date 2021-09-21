with
    source as (
        select
            /* Primary Key */           
            order_id	

            /* Foreign Key */   
            ,employee_id
            ,customer_id            
            ,ship_via as shipper_id	
            
            ,shipped_date		
            ,ship_country		
            ,ship_name		
            ,order_date			
            ,ship_postal_code	
            ,ship_city	
            ,freight	
            ,required_date		
            ,ship_address	
            ,ship_region

            /* Sitch Columns */   	
            , _sdc_table_version  
            , _sdc_received_at	            
            , _sdc_sequence	
            , _sdc_batched_at	            
        from {{ source('northwind_elt', 'orders') }}
    )
select * from source