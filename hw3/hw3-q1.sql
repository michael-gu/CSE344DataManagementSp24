-- 334 rows
SELECT COUNT(*) FROM (
SELECT f1.origin_city, f1.dest_city, f1.actual_time
FROM FLIGHTS f1
LEFT JOIN FLIGHTS f2
ON f1.origin_city = f2.origin_city AND f1.actual_time < f2.actual_time
WHERE f2.actual_time IS NULL
) AS subquery;