
/* ============================================================
   01 - How has revenue changed over time?
   ------------------------------------------------------------
   Business question:
     Is marketplace revenue growing, stable, or declining?

   Approach:
     Calculate monthly revenue from delivered orders and compare
     revenue with order volume and revenue per order.
   ============================================================ */

SELECT
    DATE_TRUNC(
        'month',
        o.order_purchase_timestamp::timestamp
    )::date AS month,

    COUNT(DISTINCT o.order_id) AS orders,

    ROUND(
        SUM(p.payment_value)::numeric,
        2
    ) AS revenue,

    ROUND(
        SUM(p.payment_value)::numeric
        / COUNT(DISTINCT o.order_id),
        2
    ) AS revenue_per_order

FROM orders o

JOIN order_payments p
    ON o.order_id = p.order_id

WHERE o.order_status = 'delivered'

GROUP BY 1
ORDER BY 1;


/* FINDING:
   Total delivered revenue: R$15,422,461.77.

   Add the highest-revenue month, overall monthly trend,
   and whether growth was mainly driven by order volume
   after reviewing the query results.
*/