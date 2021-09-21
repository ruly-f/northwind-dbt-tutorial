with
    source as (
        select 
            /* Primary Key */
            customer_id

            ,company_name
            ,contact_title
            ,contact_name	            	
            ,country	
            ,city	
            ,fax	
            ,postal_code	
            ,address
            ,region	
            ,phone	

            /* Sitch Columns */   	
            , _sdc_table_version  
            , _sdc_received_at	            
            , _sdc_sequence	
            , _sdc_batched_at	            
        from {{ source('northwind_elt', 'customers') }}
    )
select * from source