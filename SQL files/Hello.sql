
-- Create a database
CREATE DATABASE IF NOT EXISTS instagram;

-- Use Database
USE instagram;

-- Create a table
CREATE TABLE user (
	id INT,
    age INT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    followers INT,
    followings INT,
    CONSTRAINT age_check CHECK (age >= 13),
    PRIMARY KEY(id)
);

-- Insert the values into the table
INSERT INTO user
(id, age, name, email, followers, followings)
VALUES
(1, 14, "Mannu", "mannu@gmail.com", 10, 12),
(2, 14, "Kannu", "kannu@gmail.com", 20, 18);

-- Select the particular columns
SELECT id, name, email FROM user;

-- Select all columns
SELECT * FROM user;

-- Use WHERE Clause  with comparison operators
SELECT *
FROM user
WHERE followers >= 20;

-- Use WHERE Clause  with comparison operators and print particular column
SELECT name
FROM user
WHERE followers >= 20;

-- Insert the values into the table
INSERT INTO user
(id, age, name, email, followers, followings)
VALUES
(3, 14, 'adam', 'adam@yahoo.in', 123, 145),
(4, 15, 'bob', 'bob123@gmail.com', 200, 200),
(5, 16, 'casey', 'casey@email.com', 300, 306),
(6, 17, 'donald', 'donald@gmail.com', 200, 105);

INSERT INTO user
(id, age, name, email, followers, followings)
VALUES
(7, 14, 'Anum', 'anum@yahoo.in', 126, 245);

-- Use WHERE Clause  with comparison operators and Logical Operators
SELECT *
FROM user
WHERE (age > 15 AND followers >= 200);

SELECT name, followers, followings
FROM user
WHERE (age > 15 AND followers >= 200);

SELECT name, followers, followings
FROM user
WHERE (age > 15 OR followers >= 200);

-- Use WHERE Clause  with BETWEEN Operators
SELECT name, followers, followings
FROM user
WHERE age BETWEEN 15 AND 17;

-- Use WHERE clause with In operators
SELECT name, followers, email
FROM user
WHERE email IN ("adam@yahoo.in", "abc@gmail.com", "casey@email.com");

-- Where Need those people and their age mighe be either 14 or 16
SELECT name, age, followers, email
FROM user
WHERE age IN (14, 16);

-- Where Need those people and their age mighe not be either 14 or 16
SELECT name, age, followers, email
FROM user
WHERE age NOT IN (14, 16);

--LIMIT Clause without Conditions
SELECT name, age, email
FROM user
LIMIT 2;

-- LIMIT Clause with Condtion
SELECT name, age, email
FROM user
WHERE age > 14
LIMIT 2;

-- Order By Clause in Ascending Order
SELECT name, age, followers
FROM user
ORDER BY followers ASC;


-- Order By Clause in Decending Order
SELECT name, age, followers
FROM user
ORDER BY followers DESC;


-- Aggregation Functions
SELECT MIN(followers)
FROM user;

SELECT MAX(followers)
FROM user;

SELECT AVG(followers)
FROM user;

SELECT COUNT(followers)
FROM user
WHERE age = 14;

SELECT SUM(followers)
FROM user;

-- Group By Clause
SELECT age, COUNT(id)
FROM user
GROUP BY age;

SELECT age, MAX(followers)
FROM user
GROUP BY age;

-- HAVING Clause
SELECT age, MAX(followers)
FROM user
GROUP BY age
HAVING max(followers) > 100;

SELECT age, MAX(followers)
FROM user
GROUP BY age
HAVING max(followers) > 100
ORDER BY age DESC;

-- SAFE UPDATE mode Disable
SET SQL_SAFE_UPDATES = 0;

-- UPDATE Queries
UPDATE user
SET followers = 120
WHERE age = 14;

-- Print the updated table
SELECT * FROM user;

-- Inser the data into table
INSERT INTO user
(id, age, name, email, followers, followings)
VALUES
(8, 15, "Vijay", "vijay@gmail.com", 130, 140);

-- Print the updated table
SELECT * FROM user;

-- Delete the row
DELETE FROM user
WHERE name = "Vijay";

-- Print the updated table
SELECT * FROM user;

-- ALTER Queries (To Add a column)
ALTER TABLE user
ADD city VARCHAR(30) DEFAULT "Delhi";

SELECT * FROM user;

-- ALTER Queries (To Delete a column)
ALTER TABLE user
DROP COLUMN city;

SELECT * FROM user;

CREATE TABLE post (
	id INT PRIMARY KEY,
    content VARCHAR(100),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- ALTER Queries (To RENAME the table name)
ALTER TABLE user
RENAME TO users;

SELECT * FROM users;
INSERT INTO post
(id, content, user_id)
VALUES
(101, "Hello Guys", 1),
(102, "Hello Prime", 2);

SELECT * FROM post;


