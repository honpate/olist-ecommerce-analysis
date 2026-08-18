/* ============================================================
   11 - How common are negative customer reviews?
   ------------------------------------------------------------
   Business question:
     How many customers gave low review scores?

   Approach:
     Group reviews by score and count the number
     of reviews at each rating level.
   ============================================================ */

SELECT
    review_score,
    COUNT(*) AS number_of_reviews

FROM order_reviews

GROUP BY review_score

ORDER BY review_score;


/* FINDING:
  11424 number of 1-star and 3151 for 2-star reviews.
*/