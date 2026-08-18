/* ============================================================
   08 - Which states have the most customers?
   ------------------------------------------------------------
   Business question:
     Where are the majority of customers located?

   Approach:
     Group customers by state and count the number
     of customers in each state.
   ============================================================ */

SELECT
    customer_state,
    COUNT(*) AS number_of_customers

FROM customers

GROUP BY customer_state

ORDER BY number_of_customers DESC;


/* FINDING:
   Add the state with the highest number of customers
   after running the query in DBeaver.
*/