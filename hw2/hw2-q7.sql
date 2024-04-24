-- 1 rows
SELECT SUM(capacity) AS capacity
FROM FLIGHTS AS f
JOIN MONTHS AS m ON f.month_id = m.mid
WHERE ((origin_city = 'San Francisco CA' AND dest_city = 'Seattle WA') OR (origin_city = 'Seattle WA' AND dest_city = 'San Francisco CA') )
    AND m.month = 'July'
    AND day_of_month = 10;