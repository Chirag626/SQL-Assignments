CREATE TABLE STATION (
    ID INT,
    CITY VARCHAR(21),
    STATE CHAR(2),
    LAT_N FLOAT,
    LONG_W FLOAT
);

INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES 
(1, 'CityA', 'ST', 40.7128, -74.0060),
(2, 'CityB', 'ST', 34.0522, -118.2437),
(3, 'CityC', 'ST', 41.8781, -87.6298),
(4, 'CityD', 'ST', 29.7604, -95.3698),
(5, 'CityE', 'ST', 37.7749, -122.4194);

--Query to compute the Manhattan Distance
SELECT ROUND(ABS(MAX(LAT_N) - MIN(LAT_N)) + ABS(MAX(LONG_W) - MIN(LONG_W)), 4) 
       AS manhattan_distance FROM STATION;