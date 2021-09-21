with
    selected as (
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
                       
        from {{ ref('stg_customers') }}
    )
    , transformed as (
        select
            row_number() over (order by customer_id) as customer_sk
            , *
        from selected 
    )
select * from transformed