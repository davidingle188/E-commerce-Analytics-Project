-- Create the payments table
CREATE TABLE payment (
    payment_id int PRIMARY KEY,
    order_id int NOT NULL,
    amount DECIMAL(10.2) NOT NULL,
    payment_date DATETIME NOT NULL,
    payment_method VARCHAR(255) NOT NULL);

-- Insert sample payment data
INSERT INTO payment (payment_id, order_id, amount, payment_date, payment_method)
VALUES
(2001, 501, 1500, '2024-01-15 11:00:00', 'Credit Card'),
(2002, 502, 400, '2024-01-16 13:00:00', 'PayPal'),
(2003, 503, 900, '2024-01-17 15:00:00', 'Debit Card'),
(2004, 504, 300, '2024-01-18 09:30:00', 'Google Pay'),
(2005, 505, 1200, '2024-01-19 17:00:00', 'Apple Pay'),
(2006, 506, 600, '2024-01-20 12:00:00', 'Credit Card'),
(2007, 507, 750, '2024-01-21 14:00:00', 'Debit Card'),
(2008, 508, 450, '2024-01-22 09:00:00', 'PayPal');

-- Create the Order_items table
CREATE TABLE Order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity int NOT NULL,
    item_price DECIMAL(10,2) NOT NULL
);

-- Insert sample order items data
INSERT INTO order_items ( order_item_id, order_id, product_id, quantity, item_price)
VALUES 
(1001, 501, 101, 2, 800),
(1002, 501, 103, 5, 50),
(1003, 502, 102, 1, 500),
(1004, 503, 104, 3, 100),
(1005, 504, 105, 2, 80),
(1006, 505, 101, 1, 800),
(1007, 505, 102, 2, 500),
(1008, 506, 106, 1, 300),
(1009, 507, 107, 1, 1000),
(1010, 508, 108, 2, 150);

-- Create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    amount DECIMAL(10,2) NOT NULL
);

-- Insert sample order data
INSERT INTO orders (order_id, customer_id, order_date, amount)
VALUES
(501, 1, '2024-01-15 10:30:00', 1500),
(502, 2, '2024-01-16 12:45:00', 400),
(503, 3, '2024-01-17 14:20:00', 900),
(504, 1, '2024-01-18 09:10:00', 300),
(505, 4, '2024-01-19 16:30:00', 1200),
(506, 5, '2024-01-20 11:15:00', 600),
(507, 2, '2024-01-21 13:45:00', 750),
(508, 6, '2024-01-22 08:30:00', 450);

-- Create the products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL UNIQUE,
    category VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT
);

-- Insert sample product data
INSERT INTO products ( product_id, product_name, category, price, stock_quantity)
VALUES 
(101, 'Laptop', 'Electronics', 800, 50),
(102, 'Smartphone', 'Electronics', 500, 100),
(103, 'Backpack', 'Fashion', 50, 200),
(104, 'Coffee Maker', 'Appliances', 100, 30),
(105, 'Running Shoes', 'Sports', 80, 75),
(106, 'Digital Camera', 'Electronics', 300, 20),
(107, 'Smart TV', 'Electronics', 1000, 15),
(108, 'Leather Jacket', 'Fashion', 150, 40),
(109, 'Microwave Oven', 'Appliances', 200, 25),
(110, 'Fitness Tracker', 'Sports', 50, 60);

-- Create the customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(22) NOT NULL
);

-- Insert sample customer data
INSERT INTO customers ( customer_id, customer_name, email, address, phone )
VALUES
(1, 'John Doe', 'john.doe@email.com', '123 Main St, Cityville', '555-123-4567'),
(2, 'Jane Smith', 'jane.smith@email.com', '456 Oak St, Townburg', '555-987-6543'),
(3, 'Bob Johnson', 'bob.johnson@email.com', '789 Pine St, Villagetown', '555-321-6789'),
(4, 'Alice Brown', 'alice.brown@email.com', '101 Cedar St, Hamletville', '555-555-5555'),
(5, 'David Miller', 'david.miller@email.com', '202 Elm St, Riverside', '555-234-5678'),
(6, 'Emily White', 'emily.white@email.com', '303 Maple St, Hillside', '555-876-5432'),
(7, 'Michael Davis', 'michael.davis@email.com', '404 Birch St, Parkville', '555-345-6789'),
(8, 'Olivia Wilson', 'olivia.wilson@email.com', '505 Cedar St, Lakeside', '555-987-6543');

-- Add foreign key to orders table referencing customers table
ALTER TABLE orders ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id);

-- Add foreign key to order_items table referencing products table
ALTER TABLE order_items ADD FOREIGN KEY(product_id) REFERENCES products(product_id);

-- Add foreign key to order_items table referencing orders table
ALTER TABLE order_items ADD FOREIGN KEY(order_id) REFERENCES orders(order_id);

-- Add foreign key to payments table referencing orders table
ALTER TABLE payment ADD FOREIGN KEY(order_id) REFERENCES orders(order_id);



