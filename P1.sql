CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    position TEXT,
    department TEXT,
    salary NUMERIC
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name TEXT NOT NULL,
    city TEXT
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT REFERENCES customers(customer_id),
    total_amount NUMERIC
);

CREATE TABLE inventories (
    product_id SERIAL PRIMARY KEY,
    product_name TEXT NOT NULL,
    quantity INT,
    price NUMERIC
);

CREATE TABLE sales (
    order_id INT REFERENCES orders(order_id),
    customer_id INT REFERENCES customers(customer_id),
    product_id INT REFERENCES inventories(product_id),
    quantity INT,
    sale_date DATE
);

INSERT INTO employees (name, position, department, salary)
VALUES 
('Alice', 'Manager', 'Sales', 60000),
('Bob', 'Analyst', 'IT', 50000),
('Charlie', 'Developer', 'IT', 55000);

INSERT INTO customers (customer_name, city)
VALUES
('John Doe', 'New York'),
('Jane Smith', 'Los Angeles'),
('Michael Brown', 'New York');

INSERT INTO inventories (product_name, quantity, price)
VALUES
('Laptop', 10, 1200),
('Mouse', 50, 25),
('Keyboard', 30, 45);

INSERT INTO orders (order_date, customer_id, total_amount)
VALUES
('2025-08-01', 1, 1500),
('2025-08-03', 3, 1000);

INSERT INTO sales (order_id, customer_id, product_id, quantity, sale_date)
VALUES
(1, 1, 1, 1, '2025-08-01'),
(2, 3, 2, 2, '2025-08-03');
