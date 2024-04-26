-- 133 rows
SELECT DISTINCT origin_city AS city
FROM FLIGHTS
WHERE origin_city NOT IN (
    SELECT DISTINCT origin_city
    FROM FLIGHTS
    WHERE actual_time > 240 AND canceled = 0
)
ORDER BY city ASC;
-- subquery finds all origin cities with any flight that is over 4 hours and is not cancelled
-- main query finds all distinct origin cities that are not in the subquery