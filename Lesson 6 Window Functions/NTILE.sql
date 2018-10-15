Percentiles with Partitions
You can use partitions with percentiles to determine the percentile of a specific
subset of all rows. Imagine you''re an analyst at Parch & Posey and you want to
determine the largest orders (in terms of quantity) a specific customer has made
to encourage them to order more similarly sized large orders. You only want to
consider the NTILE for that customer''s account_id.

1. In the SQL Explorer below, write three queries (separately) that reflect each of the following:

2. Use the NTILE functionality to divide the accounts into 4 levels in terms of
the amount of standard_qty for their orders. Your resulting table should have
the account_id, the occurred_at time for each order, the total amount of
standard_qty paper purchased, and one of four levels in a standard_quartile column.

SELECT id,
       account_id,
       occurred_at,
       standard_qty,
       NTILE(4) OVER (PARTITION BY account_id ORDER BY standard_qty) AS standard_quartile
  FROM orders
 ORDER BY account_id DESC


3. Use the NTILE functionality to divide the accounts into two levels in terms of
the amount of gloss_qty for their orders. Your resulting table should have the account_id,
the occurred_at time for each order, the total amount of gloss_qty paper purchased, and
one of two levels in a gloss_half column.

SELECT id,
       account_id,
       occurred_at,
       gloss_qty,
       NTILE(2) OVER (PARTITION BY account_id ORDER BY gloss_qty) AS gloss_quartile
  FROM orders
 ORDER BY account_id DESC

4. Use the NTILE functionality to divide the orders for each account into 100
levels in terms of the amount of total_amt_usd for their orders. Your resulting
table should have the account_id, the occurred_at time for each order, the total
amount of total_amt_usd paper purchased, and one of 100 levels in a total_percentile column.

SELECT id,
       account_id,
       occurred_at,
       total_amt_usd,
       NTILE(100) OVER (PARTITION BY account_id ORDER BY total_amt_usd) AS total_percentile
  FROM orders
 ORDER BY account_id DESC
