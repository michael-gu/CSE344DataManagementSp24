-- 3 rows
SELECT DISTINCT c.name AS carrier
FROM CARRIERS c
WHERE c.cid IN (
  SELECT f.carrier_id
  FROM FLIGHTS f
  WHERE f.origin_city = 'Seattle WA' AND f.dest_city = 'New York NY'
)
ORDER BY carrier ASC;