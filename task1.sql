CREATE DATABASE IF NOT EXISTS task1;
USE task1;

SELECT ProductName, Manufacturer, Price
FROM product
WHERE ProductCount > 2;

SELECT ProductName, Manufacturer, Price
FROM product
WHERE Manufacturer = "Samsung";

