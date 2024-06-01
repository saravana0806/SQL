-- Single-Column Index
CREATE INDEX idx_lastname ON employees(last_name);

-- Composite Index
CREATE INDEX idx_fullname ON employees(last_name, first_name);

-- Unique Index
CREATE UNIQUE INDEX idx_employee_id ON employees(employee_id);

-- Index with sorting order ASC for order_date
CREATE INDEX idx_order_date ON orders(order_date);

-- Non-Clustered Index
CREATE INDEX idx_customer_id ON orders(customer_id);

