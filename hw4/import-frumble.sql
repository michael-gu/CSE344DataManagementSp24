DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
    name VARCHAR(16),
    discount VARCHAR(16),
    month VARCHAR(16),
    price INTEGER
);

.mode tabs
.import .\hw4\mrFrumbleData.txt Sales