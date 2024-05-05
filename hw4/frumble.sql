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
-- We have R(month, name, price, discount), which we'll simplify to R(M, N, P, D). We have closures
-- M+ = {M, D}, N+ = {N, P}, M, P+ = {M, N, P, D}, and N, D+ = {M, N, P, D}
-- 
-- Let's use N+ to decompose R into R1 = {N, P} and R2 = {N, D, M} as N+ is non-trivial
-- We now see that M+ is not trivial for R2, so we have to decompose R2 using it. Note that R1 is 
-- compliant as N is a super key as well as the fact that all of the other relevant closures are trivial.
--
-- Using M+, we have R3 = {M, N} and R4 = {M, D}.
-- For both R3 and R4, all closures are trivial, and we know that M is a superkey for R4.
-- Since all conditions are met, we know that all decomposed portions are in BCNF. 

-- So, now we must convert R1 = {N, P}, R3 = {M, N} and R4 = {M, D} into SQL queries.
-- For the sake of naming, I just named by the primary key of the table.
--
CREATE TABLE Name (
    name VARCHAR(16) PRIMARY KEY,
    price INTEGER
);

CREATE TABLE Month (
    month VARCHAR(16) PRIMARY KEY,
    discount VARCHAR(16)
);

CREATE TABLE NameMonth (
    name VARCHAR(16) references Name,
    month VARCHAR(16) references Month,
    PRIMARY KEY (name, month)
);


-- part D
-- Rows: 37
INSERT INTO Name
SELECT DISTINCT name, price
FROM Sales;

-- Rows: 13
INSERT INTO Month
SELECT DISTINCT month, discount
FROM Sales;

-- Rows: 427
INSERT INTO NameMonth
SELECT DISTINCT month, name
FROM Sales;
