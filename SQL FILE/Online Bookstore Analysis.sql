CREATE DATABASE bookstore;
 
USE bookstore;







CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    price DECIMAL(10,2)
);


CREATE TABLE order_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    action VARCHAR(50),
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO books VALUES
(1, 'Book 1', 'Author 1', 10.99),
(2, 'Book 2', 'Author 2', 12.99),
(3, 'Book 3', 'Author 3', 9.99),
(4, 'Book 4', 'Author 4', 15.99),
(5, 'Book 5', 'Author 5', 8.99);

INSERT INTO customers VALUES
(1, 'Customer 1', 'customer1@example.com', 'Address 1'),
(2, 'Customer 2', 'customer2@example.com', 'Address 2'),
(3, 'Customer 3', 'customer3@example.com', 'Address 3'),
(4, 'Customer 4', 'customer4@example.com', 'Address 4'),
(5, 'Customer 5', 'customer5@example.com', 'Address 5');

INSERT INTO orders VALUES
(1, 1, 1, 2, '2023-06-01'),
(2, 2, 3, 1, '2023-06-02'),  -- fixed date
(3, 3, 2, 3, '2023-06-03'),
(4, 4, 4, 2, '2023-06-04'),
(5, 5, 5, 1, '2023-06-05');

INSERT INTO payments VALUES
(1, 1, '2023-06-02', 21.98),
(2, 2, '2023-06-03', 9.99),
(3, 3, '2023-06-04', 38.97),
(4, 4, '2023-06-05', 31.98),
(5, 5, '2023-06-06', 8.99);



SELECT * FROM customers;

SELECT title, author FROM books;

SELECT SUM(quantity) AS total_books_sold FROM orders;

SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;


SELECT SUM(amount) AS total_revenue FROM payments;

SELECT c.name, p.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
ORDER BY p.amount DESC
LIMIT 1;

SELECT title, price
FROM books
ORDER BY price DESC
LIMIT 1;


DELIMITER $$

CREATE TRIGGER after_order_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_log(order_id, action)
    VALUES (NEW.order_id, 'INSERT');
END$$

DELIMITER ;




DELIMITER $$

CREATE TRIGGER after_order_update
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_log(order_id, action)
    VALUES (NEW.order_id, 'UPDATE');
END$$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER after_order_delete
AFTER DELETE ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_log(order_id, action)
    VALUES (OLD.order_id, 'DELETE');
END$$

DELIMITER ;



INSERT INTO orders VALUES (6, 1, 2, 1, '2023-06-06');

SELECT * FROM order_log;


DELIMITER $$

CREATE PROCEDURE GetCustomerOrders(IN cust_id INT)
BEGIN
    SELECT o.order_id, b.title, o.quantity, o.order_date
    FROM orders o
    JOIN books b ON o.book_id = b.book_id
    WHERE o.customer_id = cust_id;
END$$

DELIMITER ;

CALL GetCustomerOrders(1);



CREATE USER 'book_user'@'localhost' IDENTIFIED BY '12345';

GRANT SELECT, INSERT, ALTER ON bookstore.* TO 'book_user'@'localhost';

FLUSH PRIVILEGES;




-- =====================================================
-- THEORY QUESTIONS AND ANSWERS
-- =====================================================

-- 7. DIFFERENCE BETWEEN SQL AND MYSQL

-- SQL (Structured Query Language) is a language used
-- to create, retrieve, update and manage data in a database.

-- MySQL is a Relational Database Management System (RDBMS)
-- that uses SQL to store and manage data.

-- In simple terms:
-- SQL is the language, while MySQL is the software.


-- =====================================================

-- 8. WHY ARE TRIGGERS CREATED IN A DATABASE?

-- Triggers are created to automatically execute a set
-- of instructions whenever an INSERT, UPDATE, or DELETE
-- operation occurs on a table.

-- Advantages:
-- 1. Automates repetitive tasks.
-- 2. Maintains data integrity.
-- 3. Tracks changes made to data.
-- 4. Improves database auditing.

-- =====================================================

-- 9. DIFFERENCE BETWEEN PRIMARY KEY AND FOREIGN KEY

-- PRIMARY KEY:
-- 1. Uniquely identifies each record in a table.
-- 2. Cannot contain duplicate values.
-- 3. Cannot be NULL.

-- FOREIGN KEY:
-- 1. Creates a relationship between tables.
-- 2. References a Primary Key in another table.
-- 3. May contain duplicate values.

-- Example:
-- customer_id in customers table is a Primary Key.
-- customer_id in orders table is a Foreign Key.

-- =====================================================

-- 10. DIFFERENCE BETWEEN DBMS AND RDBMS

-- DBMS (Database Management System):
-- Stores and manages data.

-- RDBMS (Relational Database Management System):
-- Stores data in related tables using keys.

-- Examples of RDBMS:
-- MySQL, Oracle, PostgreSQL, SQL Server.

-- =====================================================

-- CONCLUSION

-- The Online Bookstore Database was developed using MySQL.
-- The database contains Books, Customers, Orders and Payments
-- tables linked through Primary Keys and Foreign Keys.

-- SQL queries were used to retrieve data, while triggers,
-- stored procedures, user privileges and backup operations
-- were implemented to improve automation, security and
-- database management.