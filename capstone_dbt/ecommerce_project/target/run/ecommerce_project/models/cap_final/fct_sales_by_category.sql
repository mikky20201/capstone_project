
  
    

    create or replace table `capstone-project-431620`.`capstone_data_prod`.`fct_sales_by_category`
      
    
    

    OPTIONS()
    as (
      select *
from `capstone-project-431620`.`capstone_data_prod`.`int_sales_by_category`
order by total_sales desc
limit 1
    );
  