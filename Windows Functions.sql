USE computer;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100),
    unit_price DECIMAL(10, 2)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity_sold INT,
    sale_amount DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO products (product_id, product_name, category, unit_price) 
VALUES 
    (1, 'Laptop', 'Electronics', 1200.00),
    (2, 'Smartphone', 'Electronics', 800.00),
    (3, 'Headphones', 'Electronics', 100.00),
    (4, 'T-shirt', 'Clothing', 20.00),
    (5, 'Jeans', 'Clothing', 50.00),
    (6, 'Shoes', 'Footwear', 80.00);

INSERT INTO sales (sale_id, product_id, sale_date, quantity_sold, sale_amount) 
VALUES 
    (1, 1, '2024-05-01', 5, 6000.00),
    (2, 2, '2024-05-02', 10, 8000.00),
    (3, 3, '2024-05-03', 15, 1500.00),
    (4, 4, '2024-05-04', 20, 400.00),
    (5, 5, '2024-05-05', 25, 1250.00),
    (6, 6, '2024-05-06', 30, 2400.00),
    (7, 1, '2024-05-07', 5, 6000.00),
    (8, 2, '2024-05-08', 10, 8000.00),
    (9, 3, '2024-05-09', 15, 1500.00);


# Calculate the cumulative sum of sale amounts for each product category over time.
select * from sales;
select * from products;

SELECT 
    sale_date,
    product_id,
    sale_amount,
    category,
    SUM(sale_amount) OVER (PARTITION BY category ORDER BY sale_date) AS cumulative_sale_amount
FROM 
    sales
JOIN 
    products USING (product_id)
ORDER BY 
    category, sale_date;


# Rank products within each category based on their unit price.
SELECT 
    product_id,
    product_name,
    category,
    unit_price,
    RANK() OVER (PARTITION BY category ORDER BY unit_price DESC) AS price_rank
FROM 
    products;


# Calculate the difference in sale amount from the previous sale for each product.
SELECT 
    sale_date,
    product_id,
    sale_amount,
    category,
    sale_amount - LAG(sale_amount, 1, 0) OVER (PARTITION BY product_id ORDER BY sale_date) AS sale_amount_diff
FROM 
    sales
JOIN 
    products USING (product_id)
ORDER BY 
    sale_date;


# Calculate the average sale amount for each product category and compare it with the individual sale amount.
SELECT 
    sale_date,
    product_id,
    sale_amount,
    category,
    AVG(sale_amount) OVER (PARTITION BY category) AS avg_sale_amount_per_category,
    AVG(sale_amount) OVER () AS global_avg_sale_amount
FROM 
    sales
JOIN 
    products USING (product_id)
ORDER BY 
    category, sale_date;


#Row Number
SELECT 
    ROW_NUMBER() OVER (ORDER BY sale_date) AS row_num,
    sale_date,
    sale_amount
FROM 
    sales;


# NTILE - Divides the result set into a specified number of roughly equal-sized groups and assigns a group number
SELECT 
    NTILE(4) OVER (ORDER BY sale_amount) AS quartile,
    product_id,
    sale_amount
FROM 
    sales;


#LEAD - Retrieves the value of a specified column from the next row within the same partition
SELECT 
    product_id,
    sale_date,
    sale_amount,
    LEAD(sale_amount) OVER (ORDER BY sale_date ) AS next_sale_amount
FROM 
    sales;



# FIRST_VALUE() / LAST_VALUE(): Retrieve the value of a specified column from the first or last row within a window frame.
SELECT 
    product_id,
    sale_date,
    sale_amount,
    FIRST_VALUE(sale_amount) OVER (ORDER BY sale_date) AS first_sale_amount,
    LAST_VALUE(sale_amount) OVER (ORDER BY sale_date) AS last_sale_amount
FROM 
    sales;
