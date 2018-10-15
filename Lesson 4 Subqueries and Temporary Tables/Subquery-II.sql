find only the orders that took place in the same month and year as the first
order, then pull the average for each type of paper quantity in this month

step 1: find the month and year of the first orders
SELECT DATE_TRUNC('month', MIN(occurred_at))
FROM orders

step 2: pull all the orders that have the same month and year as the first orders
SELECT *
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = (SELECT DATE_TRUNC('month', MIN(occurred_at))
                                          FROM orders)

step 3: average paper quantity
SELECT AVG(poster_qty) poster_qty,
       AVG(standard_qty) standard_qty,
       AVG(gloss_qty) gloss_qty
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = (SELECT DATE_TRUNC('month', MIN(occurred_at))
                                          FROM orders)

solution:
SELECT AVG(standard_qty) avg_std, AVG(gloss_qty) avg_gls, AVG(poster_qty) avg_pst
FROM orders
WHERE DATE_TRUNC('month', occurred_at) =
     (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);
