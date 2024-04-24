-- 1 rows
SELECT w.day_of_week AS day_of_week, AVG(f.arrival_delay) AS delay
FROM FLIGHTS AS f
JOIN WEEKDAYS AS w ON f.day_of_week_id = w.did
GROUP BY w.day_of_week
ORDER BY delay DESC
LIMIT 1;