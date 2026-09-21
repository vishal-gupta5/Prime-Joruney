
-- Create a table customers
CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

-- Insert data into table
INSERT INTO customers VALUES
(1, "Alice", "Mumbai"),
(2, "Bob", "Delhi"),
(3, "Carlie", "Banglore"),
(4, "David", "Mumbai");

-- Watch the data into table
SELECT * FROM customers;

-- Create a table orders
CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT
);

-- Insert data into orders
INSERT INTO orders 
(order_id, customer_id, amount)
VALUES
(101, 1, 500),
(102, 1, 900),
(103, 2, 300),
(104, 5, 700);

SELECT * FROM customers;
SELECT * FROM orders;

-- SubQuery (Inner or Nested Query)

-- With Where
SELECT *
FROM orders
WHERE amount > (
	SELECT AVG(amount)
    FROM orders
);

-- With Select

SELECT name,
	(
		SELECT COUNT(*)
        FROM orders o 
        WHERE o.customer_id = c.customer_id
    ) AS order_count
FROM customers c;


-- with From

SELECT 
	summary.customer_id,
    summary.avg_amount
FROM
	(
		SELECT 
			customer_id,
            AVG(amount) AS avg_amount
            FROM orders
            GROUP BY customer_id
    ) AS summary;
    
    
    
    