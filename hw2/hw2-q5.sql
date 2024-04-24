-- 6 rows
SELECT c.name AS name, (SUM(f.canceled) * 100.0 / COUNT(*)) AS percentage
FROM FLIGHTS AS f
JOIN CARRIERS AS c ON f.carrier_id = c.cid
WHERE f.origin_city = 'Seattle WA'
GROUP BY c.name
HAVING percentage > 0.5
ORDER BY percentage ASC;
