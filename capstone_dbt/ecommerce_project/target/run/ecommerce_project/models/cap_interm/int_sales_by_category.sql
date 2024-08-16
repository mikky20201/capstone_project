

  create or replace view `capstone-project-431620`.`capstone_data_prod`.`int_sales_by_category`
  OPTIONS()
  as With sales AS (
    SELECT
        o.order_id,
        p.product_category_name,
        oi.price
    FROM
        `capstone-project-431620`.`capstone_data_prod`.`stg_orders` o 
    JOIN
        `capstone-project-431620`.`capstone_data_prod`.`stg_order_items` oi
    ON
        o.order_id = oi.order_id
    JOIN
        `capstone-project-431620`.`capstone_data_prod`.`stg_products` p 
    ON
       oi.product_id = p.product_id 
)
SELECT
    product_category_name,
    SUM(price) AS total_sales
FROM
    sales
GROUP BY
    product_category_name;

