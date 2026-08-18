/* ============================================================
   02 - Are orders being delivered on time?
   ------------------------------------------------------------
   Business question:
     How well are we meeting promised delivery dates?

   Approach:
     Compare the actual delivery date with the estimated
     delivery date for delivered orders.
   ============================================================ */

SELECT
    COUNT(*) AS delivered_orders,

    COUNT(*) FILTER (
        WHERE order_delivered_customer_date::timestamp::date
           <= order_estimated_delivery_date::timestamp::date
    ) AS on_time_orders,

    COUNT(*) FILTER (
        WHERE order_delivered_customer_date::timestamp::date
           > order_estimated_delivery_date::timestamp::date
    ) AS late_orders

FROM orders

WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;


/* FINDING:
   Add the actual delivery-performance finding after running
   the query in DBeaver.
*/