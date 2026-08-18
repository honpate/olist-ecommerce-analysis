
/* 
00 - Data Profiling

Purpose:
Explore and understand the Olist data before analysis.
*/
-- 1. Check row counts

SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'order_payments', COUNT(*) FROM order_payments
UNION ALL
SELECT 'order_reviews', COUNT(*) FROM order_reviews
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
UNION ALL
SELECT 'geolocation', COUNT(*) FROM geolocation
UNION ALL
SELECT 'category_translation', COUNT(*) FROM category_translation;

-- 2. Check order date range

SELECT
    MIN(order_purchase_timestamp) AS first_order,
    MAX(order_purchase_timestamp) AS last_order
FROM orders;

-- 3. Check order statuses

SELECT
    order_status,
    COUNT(*) AS orders
FROM orders
GROUP BY order_status
ORDER BY orders DESC;

-- 4. Check how many orders have reviews

SELECT
    COUNT(DISTINCT order_id) AS reviewed_orders
FROM order_reviews;

-- 6. Check important NULL values in orders

SELECT
    COUNT(*) FILTER (WHERE order_delivered_customer_date IS NULL) AS missing_delivery_date,
    COUNT(*) FILTER (WHERE order_estimated_delivery_date IS NULL) AS missing_estimated_date
FROM orders;

-- 7. Check missing review comments

SELECT
    COUNT(*) FILTER (WHERE review_comment_message IS NULL) AS missing_comments
FROM order_reviews;

-- 8. Check repeated order IDs in order_items

SELECT
    order_id,
    COUNT(*) AS item_count
FROM order_items
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY item_count DESC;

-- 8. Check repeated order IDs in order_items

SELECT
    order_id,
    COUNT(*) AS item_count
FROM order_items
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY item_count DESC;

-- 10. Review score distribution

SELECT
    review_score,
    COUNT(*) AS review_count
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;

-- 11. Basic payment statistics

SELECT
    COUNT(*) AS payments,
    MIN(payment_value) AS minimum_payment,
    MAX(payment_value) AS maximum_payment,
    AVG(payment_value) AS average_payment
FROM order_payments;

-- 12. Payment types

SELECT
    payment_type,
    COUNT(*) AS payment_count
FROM order_payments
GROUP BY payment_type
ORDER BY payment_count DESC;

-- 13. Number of product categories

SELECT
    COUNT(DISTINCT product_category_name) AS categories
FROM products;

-- 14. Products by category

SELECT
    product_category_name,
    COUNT(*) AS products
FROM products
GROUP BY product_category_name
ORDER BY products DESC
LIMIT 10;

-- 15. Customers by state

SELECT
    customer_state,
    COUNT(*) AS customers
FROM customers
GROUP BY customer_state
ORDER BY customers DESC;

-- 16. Sellers by state

SELECT
    seller_state,
    COUNT(*) AS sellers
FROM sellers
GROUP BY seller_state
ORDER BY sellers DESC;

/* ============================================================
   00 - What data do we have and can we trust it?
   ------------------------------------------------------------
   Business question:
     Before analysing business performance, understand dataset
     coverage, completeness, and potential data-quality issues.

   Approach:
     Profile row counts, date coverage, order statuses, null
     values, duplicates, and key relationships.
   ============================================================ */