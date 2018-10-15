Full outer join that includes everything from both LEFT and RIGHT tables:

SELECT *
FROM accounts a
FULL OUTER JOIN sales_reps s
ON a.sales_rep_id=s.id
ORDER BY a.id

FULL outer join that excludes the part in inner join:

SELECT *
FROM accounts a
FULL OUTER JOIN sales_reps s
ON a.sales_rep_id=s.id
WHERE a.sales_rep_id IS NULL or s.id IS NULL
ORDER BY a.id
