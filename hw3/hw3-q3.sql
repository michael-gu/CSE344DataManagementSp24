-- 327 rows
SELECT f.origin_city, ISNULL(COUNT(CASE WHEN f.actual_time < 90 THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0), 0) AS percentage
FROM FLIGHTS f
WHERE f.canceled = 0
GROUP BY f.origin_city
ORDER BY percentage ASC, f.origin_city ASC