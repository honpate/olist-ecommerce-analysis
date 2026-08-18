/* ============================================================
   04 - Which product categories sell the most?
   ------------------------------------------------------------
   Business question:
     Which product categories generate the most sales?

   Approach:
     Join order items with products and count the number
     of items sold in each product category.
   ============================================================ */

SELECT
    p.product_category_name,
    COUNT(*) AS items_sold

FROM order_items oi

JOIN products p
    ON oi.product_id = p.product_id

WHERE p.product_category_name IS NOT NULL

GROUP BY p.product_category_name

ORDER BY items_sold DESC;


/* FINDING:
  The top-selling product category is cama_mesa_banho and its number
   of items sold is 11,115.
*/