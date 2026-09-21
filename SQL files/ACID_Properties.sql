CREATE DATABASE IF NOT EXISTS prime;
USE prime;

CREATE TABLE accounts (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    balance DECIMAL(10, 2)
);

INSERT INTO accounts (id, name, balance) VALUES
(1, "Adam", 400),
(2, "Bob", 300),
(3, "Alice", 200);

SELECT * FROM accounts;


-- Transactions

-- COMMIT
START TRANSACTION;
UPDATE accounts SET balance = balance - 50 WHERE id = 1;
UPDATE accounts SET balance = balance + 50 WHERE id = 2;
COMMIT;

SELECT * FROM accounts;

-- Rollback
START TRANSACTION;
UPDATE accounts SET balance = balance - 50 WHERE id = 1;
COMMIT;
UPDATE accounts SET balance = balance + 50 WHERE id = 2;
ROLLBACK;

SELECT * FROM accounts;


-- SAVEPOINT
UPDATE accounts SET balance = balance + 1000 WHERE id = 1;
SAVEPOINT after_walllet_topup;

UPDATE accounts SET balance = balance + 10 WHERE id = 1;
ROLLBACK TO after_wallet_topup;
COMMIT;

SELECT * FROM accounts;

