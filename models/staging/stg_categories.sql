with
    source as (
        select 
            /* Primary Key */
            category_id	

            ,category_name		
            ,description	

            /* Sitch Columns */   	
            , _sdc_table_version  
            , _sdc_received_at	            
            , _sdc_sequence	
            , _sdc_batched_at	            
        from {{ source('northwind_elt', 'categories') }}
    )
select * from source