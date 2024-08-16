
  
    

    create or replace table `capstone-project-431620`.`capstone_data_prod`.`stg_order_items`
      
    
    

    OPTIONS()
    as (
      select * from `capstone-project-431620`.`capstone_data1`.`order_items`
    );
  