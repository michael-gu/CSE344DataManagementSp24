-- part A
-- CREATE TABLE Sales (
--     name VARCHAR(16),
--     discount VARCHAR(16),
--     month VARCHAR(16),
--     price INTEGER
-- )

-- part B
-- FDs
-- name -> price
SELECT COUNT(*)
FROM Sales s1, Sales s2
WHERE s1.name =- s2.name AND s1.price != s2.price;

--name and price -> price and discount
SELECT COUNT(*)
FROM Sales s1, Sales s2
WHERE s1.name = s2.name AND s1.price = s2.price AND s1.discount != s2.discount;

-- month and price -> discount and name
SELECT COUNT(*)
FROM Sales s1, Sales s2
WHERE s1.month = s2.month AND s1.price = s2.price AND s1.discount != s2.discount AND s1.name != s2.name;

-- month -> discount
SELECT COUNT(*)
FROM Sales s1, Sales s2
WHERE s1.month = s2.month AND s1.discount != s2.discount;

-- name and discouont -> month and price
SELECT COUNT(*)
FROM Sales s1, Sales s2
WHERE s1.name = s2.name AND s1.discount = s2.discount AND s1.month != s2.month AND s1.price != s2.price;

-- non-FD example: name !-> month
SELECT COUNT(*)
FROM Sales s1, Sales s2
WHERE s1.name = s2.name AND s1.month != s2.month;

-- part C

-- part D