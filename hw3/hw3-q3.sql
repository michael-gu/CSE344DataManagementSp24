-- 327 rows
SELECT origin_city, ISNULL(COUNT(CASE WHEN actual_time < 90 THEN 1 END) * 100.0 / ISNULL(COUNT(*), 0), 0) AS percentage
FROM FLIGHTS
WHERE canceled = 0
GROUP BY origin_city
ORDER BY percentage ASC, origin_city ASC;
-- for all non-canceled flights, we calculate the percentage of flights that are less than 90 minutes
-- use ISNULL to ensure that if we hit a null value, we simply set as 0, per problem constraints
-- also use ISNULL again to ensure we don't divide by 0, and we perform math to get a percentage value