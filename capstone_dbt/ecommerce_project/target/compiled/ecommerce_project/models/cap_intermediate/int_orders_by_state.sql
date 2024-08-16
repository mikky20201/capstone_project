With orders_by_state AS (
    SELECT
        c.customer_state,
        COUNT(o.order_id) AS order_count
    FROM
        `capstone-project-431620`.`capstone_data_prod`.`stg_orders` o 
    JOIN
        `capstone-project-431620`.`capstone_data_prod`.`stg_customers` c
    ON
        c.customer_id = o.customer_id 
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_state 
    ORDER BY c.customer_state
)
SELECT
    *
FROM
    orders_by_state