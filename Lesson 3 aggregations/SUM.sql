1. Find the total amount of poster_qty paper ordered in the orders table.

my answer:
SELECT SUM(poster_qty) sum_poster_qty
FROM orders;

solution:
SELECT SUM(poster_qty) AS total_poster_sales
FROM orders;

2. Find the total amount of standard_qty paper ordered in the orders table.

my answer:
SELECT SUM(standard_qty) sum_standard_qty
FROM orders;

solution:
SELECT SUM(standard_qty) AS total_standard_sales
FROM orders;

3. Find the total dollar amount of sales using the total_amt_usd in the orders table.

my answer:
SELECT SUM(total_amt_usd) total_sales
FROM orders;

solution:
SELECT SUM(total_amt_usd) AS total_dollar_sales
FROM orders;

4. Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each
order in the orders table. This should give a dollar amount for each order in the table.

my answer:
SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;

solution:
SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;

5. Find the standard_amt_usd per unit of standard_qty paper. Your solution should
use both an aggregation and a mathematical operator.

my answer:
SELECT SUM(standard_amt_usd)/SUM(standard_qty) standar_unit_price
FROM orders;

solution:
SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;
