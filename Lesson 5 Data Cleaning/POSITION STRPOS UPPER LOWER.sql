1. Use the accounts table to create first and last name columns that hold the
first and last names for the primary_poc.

my answer:
SELECT primary_poc,
       LEFT(primary_poc, STRPOS(primary_poc, ' ')-1) first_name,
       RIGHT(primary_poc, LENGTH(primary_poc)-STRPOS(primary_poc, ' ')) last_name
FROM accounts;

or:
SELECT primary_poc,
	     split_part(primary_poc, ' ', 1) as first_name,
       split_part(primary_poc, ' ', 2) as last_name
from accounts

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

or:
SELECT name,
       split_part(name, ' ', 1) AS first_name,
       split_part(name, ' ', 2) AS last_name
from sales_reps

solution:
SELECT LEFT(name, STRPOS(name, ' ') -1 ) first_name,
       RIGHT(name, LENGTH(name) - STRPOS(name, ' ')) last_name
FROM sales_reps;
