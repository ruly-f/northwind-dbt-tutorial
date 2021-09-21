with
    source as (
        select 
            /* Primary Key */
            product_id
            
            /* Foreign Key */
            ,order_id	

            ,unit_price		
            ,quantity		
            ,discount	

            /* Sitch Columns */   	
            , _sdc_table_version  
            , _sdc_received_at	            
            , _sdc_sequence	
            , _sdc_batched_at	            
        from {{ source('northwind_elt', 'order_details') }}
    )
select * from source