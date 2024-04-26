-- 256 rows
SELECT DISTINCT f2.dest_city AS city
FROM FLIGHTS AS f1
JOIN FLIGHTS AS f2 ON f1.dest_city = f2.origin_city
WHERE f1.origin_city = 'Seattle WA' AND f2.dest_city != 'Seattle WA' AND NOT EXISTS (SELECT * FROM FLIGHTS f3 WHERE f3.origin_city = 'Seattle WA' AND f3.dest_city = f2.dest_city)
ORDER BY city ASC;
-- use NOT EXISTS to filter out any cities that have a direct flight from Seattle which can also be reached with an intermedidate stop
-- ensure seattle is origin city and not final destination, filter out distinct destinations