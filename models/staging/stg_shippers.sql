with
    source as (
        select 
            /* Primary Key */
            shipper_id		
            
            ,phone		
            ,company_name	

            /* Sitch Columns */   	
            , _sdc_table_version  
            , _sdc_received_at	            
            , _sdc_sequence	
            , _sdc_batched_at	            
        from {{ source('northwind_elt', 'shippers') }}
    )
select * from source