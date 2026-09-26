-- 1. Remove invalid orders (negative or zero sales)
SELECT * FROM orders WHERE sales_amount < 0 OR sales_qty <= 0;
-- Once confirmed, delete or exclude them going forward:
DELETE FROM orders WHERE sales_amount < 0 OR sales_qty <= 0;

-- 2. Clean the rating column in restaurant (replace '--' with NULL)
UPDATE restaurant
SET rating = NULL
WHERE rating = '--';

-- 3. Clean rating_count text (e.g. "Too Few Ratings" -> NULL, keep numeric-style ones as is for now)
UPDATE restaurant
SET rating_count = NULL
WHERE rating_count = 'Too Few Ratings';

-- 4. Check for NULL foreign keys (orphan records with no matching restaurant/user)
SELECT * FROM orders WHERE r_id NOT IN (SELECT id FROM restaurant);
SELECT * FROM orders WHERE user_id NOT IN (SELECT user_id FROM users);