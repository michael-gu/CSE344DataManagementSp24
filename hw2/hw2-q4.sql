-- 12 rows
SELECT DISTINCT c.name AS name 
FROM FLIGHTS AS f
JOIN CARRIERS AS c ON f.carrier_id = c.cid
GROUP BY c.name, f.day_of_month, f.month_id
HAVING COUNT(f.flight_num) > 1000;