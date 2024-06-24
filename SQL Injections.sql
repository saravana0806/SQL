
use students;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);


INSERT INTO users (username, password) VALUES
('admin', 'secure_password'),
('alice', 'password123'),
('bob', 'password456');

# Original Query
SELECT * FROM users WHERE username='admin' AND password='any_password';

SELECT * FROM users WHERE username='admin' AND password='any_password' OR '1'='1';
SELECT * FROM users WHERE username='' OR 1=1  AND password='password123';


CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT
);

INSERT INTO products (name, price, description) VALUES
('Laptop', 999.99, 'High-performance laptop with SSD and 16GB RAM'),
('Smartphone', 599.99, 'Latest model with 6.5-inch display and dual cameras'),
('Tablet', 399.99, 'Lightweight tablet with long battery life'),
('Smartwatch', 199.99, 'Fitness tracker with heart rate monitor'),
('Headphones', 149.99, 'Wireless headphones with noise cancellation');


# Original Query
SELECT * FROM products WHERE name LIKE '%input_search_term%';

SELECT * FROM products WHERE name LIKE '%' OR 1=1 -- %'; 
;


SELECT * FROM products WHERE id = 'input_id';

SELECT * FROM products WHERE id = '1' OR '1'='1';


