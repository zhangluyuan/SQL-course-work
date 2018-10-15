1. Provide the name of the sales_rep in each region with the largest amount of
total_amt_usd sales.

my answer:
SELECT region_max_usd.id, region_max_usd.region, stu.sales, max_amt_usd
FROM
(SELECT r.id id, r.name region, MAX(total_amt_usd) max_amt_usd
FROM (SELECT s.id, s.name sales, SUM(total_amt_usd) total_amt_usd
      FROM orders o
      JOIN accounts a
      ON o.account_id = a.id
      JOIN sales_reps s
      ON a.sales_rep_id = s.id
      GROUP BY s.id, s.name) sales_total_usd
JOIN sales_reps s
ON s.id = sales_total_usd.id
JOIN region r
ON r.id = s.region_id
GROUP BY r.id, r.name) region_max_usd
JOIN (SELECT s.id, s.name sales, SUM(total_amt_usd) total_amt_usd
      FROM orders o
      JOIN accounts a
      ON o.account_id = a.id
      JOIN sales_reps s
      ON a.sales_rep_id = s.id
      GROUP BY s.id, s.name) stu
ON stu.total_amt_usd = region_max_usd.max_amt_usd
ORDER BY 4 DESC;

solution:
SELECT t3.rep_name, t3.region_name, t3.total_amt
FROM(SELECT region_name, MAX(total_amt) total_amt
     FROM(SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
             FROM sales_reps s
             JOIN accounts a
             ON a.sales_rep_id = s.id
             JOIN orders o
             ON o.account_id = a.id
             JOIN region r
             ON r.id = s.region_id
             GROUP BY 1, 2) t1
     GROUP BY 1) t2
JOIN (SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
     FROM sales_reps s
     JOIN accounts a
     ON a.sales_rep_id = s.id
     JOIN orders o
     ON o.account_id = a.id
     JOIN region r
     ON r.id = s.region_id
     GROUP BY 1,2
     ORDER BY 3 DESC) t3
ON t3.region_name = t2.region_name AND t3.total_amt = t2.total_amt;

2. For the region with the largest (sum) of sales total_amt_usd, how many total
(count) orders were placed?

my answer:
SELECT r.name region, SUM(total_amt_usd) sum_sales, COUNT(*) order_count
FROM orders o
JOIN accounts a
ON a.id = o.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name
ORDER BY 2 DESC
LIMIT 1;

solution:
SELECT r.name, COUNT(o.total) total_orders
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name
HAVING SUM(o.total_amt_usd) = (
      SELECT MAX(total_amt)
      FROM (SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
              FROM sales_reps s
              JOIN accounts a
              ON a.sales_rep_id = s.id
              JOIN orders o
              ON o.account_id = a.id
              JOIN region r
              ON r.id = s.region_id
              GROUP BY r.name) sub);

3. For the name of the account that purchased the most (in total over their
  lifetime as a customer) standard_qty paper, how many accounts still had more in total purchases?

my answer:
SELECT COUNT(*)
FROM (SELECT account_id
      FROM orders o
      GROUP BY account_id
      HAVING SUM(total) >
          (SELECT total_sales
           FROM (SELECT account_id,
                        SUM(standard_qty) total_standard_qty,
                        SUM(total) total_sales
                  FROM orders o
                  GROUP BY account_id
                  ORDER BY 2 DESC
                  LIMIT 1
                  ) t1
            )
      ) t3

solution:
SELECT COUNT(*)
FROM (SELECT a.name
      FROM orders o
      JOIN accounts a
      ON a.id = o.account_id
      GROUP BY 1
      HAVING SUM(o.total) > (SELECT total
                  FROM (SELECT a.name act_name, SUM(o.standard_qty) tot_std, SUM(o.total) total
                        FROM accounts a
                        JOIN orders o
                        ON o.account_id = a.id
                        GROUP BY 1
                        ORDER BY 2 DESC
                        LIMIT 1) inner_tab)
            ) counter_tab;

4. For the customer that spent the most (in total over their lifetime as a
  customer) total_amt_usd, how many web_events did they have for each channel?

my answer:
SELECT a.name account, w.channel channel, COUNT(*)
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
   AND w.account_id =
      (SELECT account_id
      FROM (SELECT account_id, SUM(total_amt_usd)
            FROM orders
            GROUP BY account_id
            ORDER BY 2 DESC
            LIMIT 1) t1)
GROUP BY a.name, w.channel

solution:
SELECT a.name, w.channel, COUNT(*)
FROM accounts a
JOIN web_events w
ON a.id = w.account_id AND a.id =  (SELECT id
                     FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
                           FROM orders o
                           JOIN accounts a
                           ON a.id = o.account_id
                           GROUP BY a.id, a.name
                           ORDER BY 3 DESC
                           LIMIT 1) inner_table)
GROUP BY 1, 2
ORDER BY 3 DESC;

5. What is the lifetime average amount spent in terms of total_amt_usd for
the top 10 total spending accounts?

my answer:
SELECT AVG(total_amt)
FROM (SELECT SUM(total_amt_usd) total_amt
      FROM orders
      GROUP BY account_id
      ORDER BY 1 DESC
      LIMIT 10) t1

solution:
SELECT AVG(tot_spent)
FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
      FROM orders o
      JOIN accounts a
      ON a.id = o.account_id
      GROUP BY a.id, a.name
      ORDER BY 3 DESC
       LIMIT 10) temp;

6. What is the lifetime average amount spent in terms of total_amt_usd for
only the companies that spent more than the average of all orders.

my answer:
SELECT AVG(total)
FROM (SELECT AVG(total_amt_usd) total
      FROM orders
      GROUP BY account_id
      HAVING AVG(total_amt_usd) > (SELECT AVG(total_amt_usd)
                                  FROM orders)) t1

solution:
SELECT AVG(avg_amt)
FROM (SELECT o.account_id, AVG(o.total_amt_usd) avg_amt
    FROM orders o
    GROUP BY 1
    HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) avg_all
                               FROM orders o
                               JOIN accounts a
                               ON a.id = o.account_id)) temp_table;
