-- 22 rows
SELECT c.name AS name, SUM(f.departure_delay) AS delay
FROM FLIGHTS AS f
JOIN CARRIERS AS c ON f.carrier_id = c.cid
GROUP BY c.name;