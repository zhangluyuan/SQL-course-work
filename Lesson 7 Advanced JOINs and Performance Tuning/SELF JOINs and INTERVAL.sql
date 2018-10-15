SELF JOINs is useful for fingding events that occurred with a time INTERVAL of each other

Notice that below the 2 tables were joined ON account_id, but compared by occurred_at

1. which accounts made multiples orders within 30 days
SELECT o1.id AS o1_id,
       o1.account_id AS o1_account_id,
       o1.occurred_at AS o1_occurred_at,
       o2.id AS o2_id,
       o2.account_id AS o2_account_id,
       o2.occurred_at AS o2_occurred_at
FROM orders o1
LEFT JOIN orders o2
  ON o1.account_id = o2.account_id
  AND o2.occurred_at > o1.occurred_at
  AND o2.occurred_at <= o1.occurred_at + INTERVAL '28 days'
ORDER BY o1.account_id, o1.occurred_at;


2. Modify the query from above, which is pre-populated in the SQL Explorer below,
to perform the same interval analysis except for the web_events table. Also:
  a.  change the interval to 1 day to find web events that occur within one after
  another within one day
  b.  add a column for the channel variable in both instances of the table in your query

You can find more on the types of INTERVALS (and other date related functionality)
in the Postgres documentation here.


SELECT w1.id AS w1_id,
       w1.account_id AS w1_account_id,
       w1.occurred_at AS w1_occurred_at,
       w1.channel AS w1_channel,
       w2.id AS w2_id,
       w2.account_id AS w2_account_id,
       w2.occurred_at AS w2_occurred_at,
       w2.channel AS w2_channel
  FROM web_events w1
 LEFT JOIN web_events w2
 ON w1.account_id = w2.account_id
AND w2.occurred_at > w1.occurred_at
AND w2.occurred_at <= w1.occurred_at + INTERVAL '1 days'
ORDER BY w1.account_id, w1.occurred_at;
