
  
    

    create or replace table `capstone-project-431620`.`capstone_data_prod`.`fct_orders_by_state`
      
    
    

    OPTIONS()
    as (
      select *
from `capstone-project-431620`.`capstone_data_prod`.`int_orders_by_state`
order by order_count desc
limit 1
    );
  