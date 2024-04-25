-- 3 rows
SELECT DISTINCT f3.dest_city AS city
FROM FLIGHTS AS f1
JOIN FLIGHTS AS f2 ON f1.dest_city = f2.origin_city
JOIN FLIGHTS AS f3 ON f2.dest_city = f3.origin_city
WHERE f1.origin_city = 'Seattle WA' 
    AND f3.dest_city != 'Seattle WA' 
    AND NOT EXISTS (
        SELECT 1 FROM FLIGHTS f4
        WHERE f4.origin_city = 'Seattle WA' 
        AND f4.dest_city = f3.dest_city
    )
    AND NOT EXISTS (
        SELECT 1 FROM FLIGHTS f5
        JOIN FLIGHTS f6 ON f5.dest_city = f6.origin_city
        WHERE f5.origin_city = 'Seattle WA' 
        AND f6.dest_city = f3.dest_city
    )
ORDER BY city ASC;