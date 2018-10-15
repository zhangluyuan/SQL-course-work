1. Use the accounts table to find the account name, primary_poc, and sales_rep_id
for Walmart, Target, and Nordstrom.

my answer:
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

solution:
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');


2. Use the web_events table to find all information regarding individuals who
were contacted via the channel of organic or adwords.

my answer:
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');

solution:
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');
