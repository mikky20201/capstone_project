
  
    

    create or replace table `capstone-project-431620`.`capstone_data_prod`.`stg_sellers`
      
    
    

    OPTIONS()
    as (
      select * from `capstone-project-431620`.`capstone_data1`.`sellers`
    );
  