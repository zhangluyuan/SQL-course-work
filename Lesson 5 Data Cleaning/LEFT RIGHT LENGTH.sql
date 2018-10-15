1.In the accounts table, there is a column holding the website for each company.
The last three digits specify what type of web address they are using. A list of
extensions (and pricing) is provided here. Pull these extensions and provide
how many of each website type exist in the accounts table.

my answer:
SELECT RIGHT(website, 3) web_extension,
       COUNT(*) num_companies
FROM accounts
GROUP BY 1;

solution:
SELECT RIGHT(website, 3) AS domain, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

2. There is much debate about how much the name (or even the first letter of a
  company name) matters. Use the accounts table to pull the first letter of each
  company name to see the distribution of company names that begin with each letter
  (or number).

my answer:
SELECT LEFT(UPPER(name), 1) first_letter,
      COUNT(*)
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

solution:
SELECT LEFT(UPPER(name), 1) AS first_letter, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

3. Use the accounts table and a CASE statement to create two groups: one group
of company names that start with a number and a second group of those company
names that start with a letter. What proportion of company names start with a letter?

my answer:
SELECT SUM(numbers) numbers, SUM(letter) letters
FROM
(SELECT CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') THEN 1 ELSE 0 END AS numbers,
        CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') THEN 0 ELSE 1 END AS letter
FROM accounts) t1

solution:
SELECT SUM(num) nums, SUM(letter) letters
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9')
                       THEN 1 ELSE 0 END AS num,
         CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9')
                       THEN 0 ELSE 1 END AS letter
      FROM accounts) t1;

4. Consider vowels as a, e, i, o, and u. What proportion of company names start
with a vowel, and what percent start with anything else?

my answer:
SELECT SUM(vowel), COUNT(*)
FROM (SELECT name,
            CASE WHEN LEFT(LOWER(name), 1) IN ('a','e','i','o','u') THEN 1 ELSE 0 END AS vowel
      FROM accounts)

solution:
SELECT SUM(vowels) vowels, SUM(other) other
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U')
                        THEN 1 ELSE 0 END AS vowels,
          CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U')
                       THEN 0 ELSE 1 END AS other
         FROM accounts) t1;
