-- 334 rows
SELECT DISTINCT f1.origin_city AS origin_city, f1.dest_city AS dest_city, f1.actual_time AS time
FROM FLIGHTS f1
JOIN (
  SELECT origin_city, MAX(actual_time) AS max_time
  FROM FLIGHTS
  GROUP BY origin_city
) f2 ON f1.origin_city = f2.origin_city AND f1.actual_time = f2.max_time
ORDER BY f1.origin_city ASC, f1.dest_city ASC;
-- subquery gets max duration per origin city
-- join with f1 to return all origin/dest city pairs with max time
-- select distinct to remove duplicates