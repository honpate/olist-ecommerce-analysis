/* ============================================================
   03 - Does delivery performance affect customer reviews?
   ------------------------------------------------------------
   Business question:
     Do customers give lower review scores when orders
     are delivered late?

   Approach:
     Join orders with reviews and compare average review
     scores for delivered orders.
   ============================================================ */

SELECT
    o.order_status,
    COUNT(*) AS number_of_reviews,
    ROUND(AVG(r.review_score), 2) AS average_review_score

FROM orders o

JOIN order_reviews r
    ON o.order_id = r.order_id

WHERE o.order_status = 'delivered'

GROUP BY o.order_status;


/* FINDING:
   Delivered orders have an average review score of 4.16 out of 5,
   showing that customers are generally satisfied with their orders.
*/