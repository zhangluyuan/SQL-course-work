1. find the number of events that occure for each day for each channel

my anser:
SELECT DATE_TRUNC('day', occurred_at) day, channel, COUNT(*) num_events
FROM webevents
GROUP BY 1,2
ORDER BY 1;

solution:
SELECT DATE_TRUNC('day',occurred_at) AS day,
   channel, COUNT(*) as events
FROM web_events
GROUP BY 1,2
ORDER BY 3 DESC;

2. Create a subquery that simply provides all of the data from your first subquery

my answer:
(SELECT DATE_TRUNC('day', occurred_at) day, channle, COUNT(*) num_events
FROM webevents
GROUP BY 1,2
ORDER BY 1
) sub

3. find average number of events for each channel. this is gives you an average per day

my answer:
SELECT channel, AVG(num_events) avg_events_per_day
FROM
(SELECT DATE_TRUNC('day', occurred_at) occurred_at, channel, COUNT(*) num_events
FROM web_events
GROUP BY 1,2
ORDER BY 1
) sub
GROUP BY channel

solution:
SELECT channel, AVG(events) AS average_events
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
             channel, COUNT(*) as events
      FROM web_events
      GROUP BY 1,2) sub
GROUP BY channel
ORDER BY 2 DESC;
