1. Use DISTINCT to test if there are any accounts associated with more than one region.

my answer:
SELECT a.name account, count(r.name) region_count
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON r.id = s.region_id
GROUP BY a.name
ORDER BY region_count DESC;

solution:


2. Have any sales reps worked on more than one account?

my answer:
SELECT s.name sales, count(*) account_count
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY account_count DESC;

solution:
