-- 133 rows
SELECT DISTINCT origin_city AS city
FROM FLIGHTS
WHERE origin_city NOT IN (
    SELECT DISTINCT origin_city
    FROM FLIGHTS
    WHERE actual_time > 240 AND canceled = 0
)
ORDER BY city ASC;