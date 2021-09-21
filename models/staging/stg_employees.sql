with
    source as (
        select 
            /* Primary Key */
            employee_id

            ,last_name	
            ,first_name	
            ,country	
            ,city	
            ,postal_code
            ,hire_date	
            ,extension	
            ,address	
            ,birth_date	
            ,region	
            ,photo_path	
            ,title		
            ,title_of_courtesy	
            ,notes		
            ,home_phone	
            ,reports_to	

            /* Sitch Columns */   	
            , _sdc_table_version  
            , _sdc_received_at	            
            , _sdc_sequence	
            , _sdc_batched_at	            
        from {{ source('northwind_elt', 'employees') }}
    )
select * from source