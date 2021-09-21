with
    source as (
        select 
            /* Primary Key */
            product_id	

            /* Foreign Key */            
            , supplier_id	            	
            , category_id

            , units_in_stock	            	
            , unit_price	
            , product_name	
            , quantity_per_unit	
            , units_on_order
            , reorder_level            	
            , 
                case
                    when discontinued = 1 then True
                    else False
                end as is_discontinued	

            /* Sitch Columns */   	
            , _sdc_table_version  
            , _sdc_received_at	            
            , _sdc_sequence	
            , _sdc_batched_at	            
        from {{ source('northwind_elt', 'products') }}
    )
select * from source