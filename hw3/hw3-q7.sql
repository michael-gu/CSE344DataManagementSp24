-- 3 rows
SELECT DISTINCT c.name AS carrier
FROM FLIGHTS f
JOIN CARRIERS c ON f.carrier_id = c.cid
WHERE f.origin_city = 'Seattle WA' AND f.dest_city = 'New York NY'
ORDER BY carrier ASC;