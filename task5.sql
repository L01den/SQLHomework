CREATE DATABASE IF NOT EXISTS task5;
USE task5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

CREATE OR REPLACE VIEW view_cars AS
SELECT name, cost
FROM cars 
WHERE cost < 25000;

ALTER VIEW view_cars AS
SELECT *
FROM cars
WHERE cost < 30000;

SELECT *
FROM view_cars;

CREATE OR REPLACE VIEW cars_audi_skoda AS
SELECT name, cost
FROM cars 
WHERE name = "Audi" || name = "Skoda";

SELECT *
FROM cars_audi_skoda;


DROP TABLE IF EXISTS train;
CREATE TABLE train
(
	trein_id INT NOT NULL,
    stantion VARCHAR(45),
    station_time TIME
);

INSERT train
VALUES
	(110, 'San Francisco', '10:00:00'),
    (110, 'Redwood City', '10:54:00'),
    (110, 'Palo Alto', '11:02:00'),
    (110, 'San Jose', '12:35:00'),
    (120, 'San Francisco', '11:00:00'),
    (120, 'Palo Alto', '12:49:00'),
    (120, 'San Jose', '13:30:00');
    
SELECT *
FROM train;

SELECT trein_id, stantion, station_time,
	TIMEDIFF(LEAD(station_time) OVER(PARTITION BY trein_id ORDER BY trein_id), station_time) AS 'time_to_next_station'
FROM train;

