/* ============================================================
   09 - Which customers are the most valuable?
   ------------------------------------------------------------
   Business question:
     Which customers purchase frequently and spend the most?

   Approach:
     Group delivered orders by customer and calculate their
     number of orders and total payment value.
   ============================================================ */

SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(p.payment_value)::numeric, 2) AS total_spent

FROM customers c

JOIN orders o
    ON c.customer_id = o.customer_id

JOIN order_payments p
    ON o.order_id = p.order_id

WHERE o.order_status = 'delivered'

GROUP BY c.customer_unique_id

ORDER BY total_spent DESC;


/* FINDING:
 1 is the highest-value customer's number of orders
   and total spending is 13664.08
*/