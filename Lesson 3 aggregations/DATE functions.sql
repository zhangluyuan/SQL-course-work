1. Find the sales in terms of total dollars for all orders in each year, ordered
from greatest to least. Do you notice any trends in the yearly sales totals?

my answer:
SELECT DATE_PART('year', occurred_at) occurred_year, SUM(total_amt_usd) total_sales
FROM orders
GROUP BY 1
ORDER BY 2;

solution:
SELECT DATE_PART('year', occurred_at) ord_year,  SUM(total_amt_usd) total_spent
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

2. Which month did Parch & Posey have the greatest sales in terms of total
dollars? Are all months evenly represented by the dataset?

my answer:
SELECT DATE_PART('month', occurred_at) order_month, SUM(total_amt_usd) total_sales
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 1;

solution:
SELECT DATE_PART('month', occurred_at) ord_month, SUM(total_amt_usd) total_spent
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC;

3. Which year did Parch & Posey have the greatest sales in terms of total
number of orders? Are all years evenly represented by the dataset?

my answer:
SELECT DATE_PART('year', occurred_at) order_year, COUNT(id) total_orders
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

solution:
SELECT DATE_PART('year', occurred_at) ord_year,  COUNT(*) total_sales
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

4. Which month did Parch & Posey have the greatest sales in terms of total
number of orders? Are all months evenly represented by the dataset?

my answer:
SELECT DATE_PART('month', occurred_at) order_month, COUNT(id) total_orders
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC;

solution:
SELECT DATE_PART('month', occurred_at) ord_month, COUNT(*) total_sales
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC;

5. In which month of which year did Walmart spend the most on gloss paper
in terms of dollars?

my answer:
SELECT DATE_TRUN('month', occurred_at) order_year_month, SUM(gloss_amt_usd) gloss_amt_usd
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
  AND accounts.name = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;


solution:
SELECT DATE_TRUNC('month', o.occurred_at) ord_date, SUM(o.gloss_amt_usd) tot_spent
FROM orders o
JOIN accounts a
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
