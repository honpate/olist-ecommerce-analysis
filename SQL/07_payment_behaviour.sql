/* ============================================================
   07 - How do customers prefer to pay?
   ------------------------------------------------------------
   Business question:
     Which payment methods are most commonly used by customers?

   Approach:
     Group payments by payment type and count how many
     transactions use each payment method.
   ============================================================ */

SELECT
    payment_type,
    COUNT(*) AS number_of_payments,
    ROUND(AVG(payment_value)::numeric, 2) AS avg_payment_value

FROM order_payments

GROUP BY payment_type

ORDER BY number_of_payments DESC;


/* FINDING:
  credit_card is the most commonly used payment method and its
   average payment value is 163.32