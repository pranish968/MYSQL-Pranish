-- ACTIDADE 1 17/10/2024
-- create a database whose purpose is to store products; create a table like the one on the side;
-- in blank values ​​it must be declared with the possibility of being null;
-- consult the table.
-- add the created table, the values ​​next to it;

CREATE DATABASE ProductsDB;
USE ProductsDB;

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT,
    description TEXT
);

INSERT INTO Products (product_name, category, price, stock_quantity, description)
VALUES 
('Laptop', 'Electronics', 999.99, 20, 'High-performance laptop'),
('Coffee Mug', 'Kitchen', 5.99, 50, 'Ceramic mug'),
('Book', NULL, 10.99, NULL, NULL);


drop database productsDB;

SELECT * FROM Products;
