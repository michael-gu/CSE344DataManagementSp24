-- 3 rows
SELECT DISTINCT f.flight_num AS flight_num
FROM FLIGHTS AS f
JOIN CARRIERS AS c ON f.carrier_id = c.cid
JOIN WEEKDAYS AS w ON f.day_of_week_id = w.did
WHERE f.origin_city = 'Seattle WA'
    AND f.dest_city = 'Boston MA'
    AND c.name = 'Alaska Airlines Inc.'
    AND w.day_of_week = 'Monday';