1. Use the accounts table to create first and last name columns that hold the
first and last names for the primary_poc.

my answer:
SELECT primary_poc,
       LEFT(primary_poc, STRPOS(primary_poc, ' ')-1) first_name,
       RIGHT(primary_poc, LENGTH(primary_poc)-STRPOS(primary_poc, ' ')) last_name
FROM accounts;

solution:
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,
RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name
FROM accounts;

2. Now see if you can do the same thing for every rep name in the sales_reps table.
Again provide first and last name columns.

my answer:
SELECT name,
       LEFT(name, STRPOS(name, ' ')-1) first_name,
       RIGHT(name, LENGTH(name)-STRPOS(name, ' ')) last_name
FROM sales_reps;

solution:
SELECT LEFT(name, STRPOS(name, ' ') -1 ) first_name,
       RIGHT(name, LENGTH(name) - STRPOS(name, ' ')) last_name
FROM sales_reps;
