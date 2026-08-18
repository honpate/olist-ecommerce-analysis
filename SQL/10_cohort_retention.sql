/* ============================================================
   10 - How many customers make repeat purchases?
   ------------------------------------------------------------
   Business question:
     Are customers returning to make additional purchases?

   Approach:
     Count the number of orders placed by each unique
     customer and identify repeat customers.
   ============================================================ */

SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS number_of_orders

FROM customers c

JOIN orders o
    ON c.customer_id = o.customer_id

GROUP BY c.customer_unique_id

HAVING COUNT(o.order_id) > 1

ORDER BY number_of_orders DESC;


/* FINDING:
   Add the number of repeat customers after reviewing
   the DBeaver results.
*/