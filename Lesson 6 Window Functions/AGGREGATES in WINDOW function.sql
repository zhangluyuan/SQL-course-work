Aggregates in Window Functions with and without ORDER BY

Run the query that Derek wrote in the previous video in the first SQL Explorer
below. Keep the query results in mind; you''ll be comparing them to the results of another query next.

SELECT id,
       account_id,
       standard_qty,
       DATE_TRUNC('month', occurred_at) AS month,
       DENSE_RANK() OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS dense_rank,
       SUM(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS sum_std_qty,
       COUNT(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS count_std_qty,
       AVG(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS avg_std_qty,
       MIN(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS min_std_qty,
       MAX(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS max_std_qty
FROM orders


What is happening when you omit the ORDER BY clause when doing aggregates with
window functions? Use the results from the queries above to guide your thoughts
then jot these thoughts down in a few sentences in the text box below.

without ORDER BY, aggregation is performed over the entire window frame.
With ORDER BY, the aggregation is performed over the rows up to current row,
plus the following rows that are equal to current row in the "ORDER BY" column value.
