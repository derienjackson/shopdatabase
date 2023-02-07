CREATE TABLE customers (
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50)
);

CREATE TABLE orders (
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
amount DECIMAL(8,2),
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Bo', 'Richard', 'brich@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('Dave', 'Johnson', 'dj@gmail.com'),
       ('August', 'Jackson', 'ajacks@gmail.com'),
       ('Stevie', 'Wonders', 'stevewon@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

SELECT * FROM orders WHERE customer_id = 
(SELECT id FROM customers WHERE last_name = 'George');

SELECT first_name,last_name,amount FROM customers
JOIN orders ON orders.customer_id = customers.id;

SELECT first_name, last_name, SUM(amount) AS total FROM customers
JOIN orders ON orders.customer_id = customers.id
GROUP BY first_name, last_name
ORDER BY total DESC;










