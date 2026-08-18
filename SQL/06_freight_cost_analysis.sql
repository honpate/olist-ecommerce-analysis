/* ============================================================
   06 - Which product categories have the highest freight cost?
   ------------------------------------------------------------
   Business question:
     Which product categories cost the most to ship?

   Approach:
     Join order items with products and calculate the average
     freight cost for each product category.
   ============================================================ */

SELECT
    p.product_category_name,
    COUNT(*) AS items_sold,
    ROUND(AVG(oi.freight_value)::numeric, 2) AS avg_freight_cost

FROM order_items oi

JOIN products p
    ON oi.product_id = p.product_id

WHERE p.product_category_name IS NOT NULL

GROUP BY p.product_category_name

ORDER BY avg_freight_cost DESC;


/* FINDING:
  pcs is the category with the highest average freight cost
   is 48.45
*/