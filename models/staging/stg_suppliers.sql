with
    source as (
        select 
            /* Primary Key */
            supplier_id	
     
            ,country	
            ,city	
            ,fax	
            ,postal_code	
            ,homepage		
            ,address	
            ,region	
            ,contact_name	
            ,phone	
            ,company_name	
            ,contact_title	

            /* Sitch Columns */   	
            , _sdc_table_version  
            , _sdc_received_at	            
            , _sdc_sequence	
            , _sdc_batched_at	            
        from {{ source('northwind_elt', 'suppliers') }}
    )
select * from source