CREATE DATABASE IF NOT EXISTS task3;
USE task3;

DROP TABLE IF EXISTS `staff`;

CREATE TABLE IF NOT EXISTS `staff`
(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `firstname` VARCHAR(45),
    `lastname` VARCHAR(45),
    `post` VARCHAR(45),
    `seniority` INT,
    `salary` INT,
    `age` INT
);

INSERT `staff` (`firstname`, `lastname`, `post`, `seniority`, `salary`, `age`)
VALUE
	("Вася", "Васькин", "Начальник", 40, 100000, 60),
	('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
	('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
	('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
	('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
   
-- 1. Задание   
SELECT firstname, id, salary
FROM staff
ORDER BY salary; -- Сортировка по возрастанию 
    
SELECT firstname, id, salary
FROM staff
ORDER BY salary DESC; -- Сортировка по убыванию 
    
-- 2. Задание 
SELECT firstname, id, salary
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 3. Задание 
SELECT post, SUM(salary) Sum_salary
FROM staff
GROUP BY post;

-- 4. Задание 
SELECT post, COUNT(post) Count
FROM staff
WHERE age >= 24 && age <= 49 && post = "Рабочий"
GROUP BY post;

-- 5. Задание 
SELECT COUNT(DISTINCT post) Count
FROM staff;

-- 6. Задание 
SELECT post
FROM staff
GROUP BY post
HAVING AVG(age) <= 30; -- Строго меньше не было возроста в специальнсях

SELECT post
FROM staff
GROUP BY post
HAVING AVG(age) < 40; -- так больше специальнестей вывелось 