CREATE DATABASE IF NOT EXISTS task2; 
USE task2;

CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT
);

INSERT sales(order_date, count_product)
VALUES 
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);
    
SELECT id,
	IF(count_product < 100, "Маленький заказ",
		IF(count_product >= 100 AND count_product < 300, "Средний заказ", "Большой заказ"))
	AS "Тип заказа"
FROM sales;

CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(10) NOT NULL,
    amount DOUBLE,
    order_status VARCHAR(20)
);

INSERT orders(employee_id, amount, order_status)
VALUES 
	('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');
    
SELECT id, employee_id, amount, order_status,
CASE
	WHEN order_status = 'OPEN' THEN 'Order is in open state'
    WHEN order_status = 'CLOSED' THEN 'Order is closed'
    WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
    END AS full_order_status
FROM orders;