with
    suppliers as (
        select 
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

        from {{ ref('stg_suppliers') }}
    )
    , divisions as (
        select *
        from {{ ref('seed_supplier_division') }}
    )
    , suppliers_t as (
        select
            supp.supplier_id	
            ,supp.country	
            ,supp.city	
            ,supp.fax	
            ,supp.postal_code	
            ,supp.homepage		
            ,supp.address	
            ,supp.region	
            ,supp.contact_name	
            ,supp.phone	
            ,supp.company_name	
            ,supp.contact_title         
            ,divisions.division       
        from suppliers as supp
        left join divisions on supp.country = divisions.country
    )    
    , categories as (
        select 
            category_id	
            ,category_name		
            ,description as categories_description	
       
        from {{ ref('stg_categories') }}

    )    
    , products as (
        select    
            products.product_id	          
            ,suppliers_t.supplier_id	            	
            ,categories.category_id
            ,products.units_in_stock	            	
            ,products.unit_price	
            ,products.product_name	
            ,products.quantity_per_unit	
            ,products.units_on_order
            ,products.reorder_level            	
            ,products.is_discontinued
            ,categories.category_name		
            ,categories.categories_description	
            ,suppliers_t.country	
            ,suppliers_t.city	
            ,suppliers_t.fax	
            ,suppliers_t.postal_code	
            ,suppliers_t.homepage		
            ,suppliers_t.address	
            ,suppliers_t.region	
            ,suppliers_t.contact_name	
            ,suppliers_t.phone	
            ,suppliers_t.company_name	
            ,suppliers_t.contact_title

        from {{ ref('stg_products') }} as products
        inner join categories on products.category_id = categories.category_id
        inner join suppliers_t on products.supplier_id = suppliers_t.supplier_id
    )
    , transformed as (
        select
            row_number() over (order by product_id) as product_sk
            , *
        from products     
    )
    
select * from transformed