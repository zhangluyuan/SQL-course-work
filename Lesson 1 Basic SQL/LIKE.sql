Use the accounts table to find
1. All the companies whose names start with 'C'.

my answer:
SELECT name
FROM accounts
WHERE name LIKE 'C%';

solution:
SELECT name
FROM accounts
WHERE name LIKE 'C%';

2.All companies whose names contain the string 'one' somewhere in the name.

my answer:
SELECT name
FROM accounts
WHERE name LIKE '%one%';

solution:
SELECT name
FROM accounts
WHERE name LIKE '%one%';

3. All companies whose names end with 's'.

my answer:
SELECT name
FROM accounts
WHERE name LIKE '%s';

solution:
SELECT name
FROM accounts
WHERE name LIKE '%s';
