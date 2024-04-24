PRAGMA foreign_keys=ON;

CREATE TABLE CARRIERS (cid VARCHAR(7) PRIMARY KEY, name VARCHAR(83));

CREATE TABLE MONTHS (mid INT PRIMARY KEY, month VARCHAR(9));

CREATE TABLE WEEKDAYS (did INT PRIMARY KEY, day_of_week VARCHAR(9));

CREATE TABLE FLIGHTS (
        fid INT PRIMARY KEY,
        month_id INT REFERENCES MONTHS(mid),
        day_of_month INT,
        day_of_week_id INT REFERENCES WEEKDAYS(did),
        carrier_id VARCHAR(7) REFERENCES CARRIERS(cid),
        flight_num INT,
        origin_city VARCHAR(34),
        origin_state VARCHAR(47),
        dest_city VARCHAR(34),
        dest_state VARCHAR(46),
        departure_delay INT,
        taxi_out INT,
        arrival_delay INT,
        canceled INT,
        actual_time INT,
        distance INT,
        capacity INT,
        price INT);