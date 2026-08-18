/* ============================================================
   05 - Which sellers generate the most sales?
   ------------------------------------------------------------
   Business question:
     Which sellers contribute the most to marketplace sales?

   Approach:
     Group order items by seller and calculate the number
     of items sold and total sales for each seller.
   ============================================================ */

SELECT
    seller_id,
    COUNT(*) AS items_sold,
    ROUND(SUM(price)::numeric, 2) AS total_sales

FROM order_items

GROUP BY seller_id

ORDER BY total_sales DESC;


/* FINDING:
   Add the top seller id is 4869f7a5dfa277a7dca6462dcf3b52b2, number of items sold is 1156, and total sales is 229,472.63

*/