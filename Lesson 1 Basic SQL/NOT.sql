1. Use the accounts table to find the account name, primary poc, and sales rep id
for all stores except Walmart, Target, and Nordstrom.

my answer:
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

solution:
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

2. Use the web_events table to find all information regarding individuals who
were contacted via any method except using organic or adwords methods.
Use the accounts table to find:

my answer:
SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');

solution:
SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');

3. All the companies whose names do not start with 'C'.

my answer:
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%';

solution:
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%';

4. All companies whose names do not contain the string 'one' somewhere in the name.

my answer:
SELECT name
FROM accounts
WHERE name NOT LIKE '%one%';

solution:
SELECT name
FROM accounts
WHERE name NOT LIKE '%one%';

5. All companies whose names do not end with 's'.

my answer:
SELECT name
FROM accounts
WHERE name NOT LIKE '%s';

solution:
SELECT name
FROM accounts
WHERE name NOT LIKE '%s';
