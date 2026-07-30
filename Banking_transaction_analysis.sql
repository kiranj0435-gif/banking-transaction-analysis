/*
==========================================================
Project Name : Banking Transaction Analysis
Author       : Kiran J
Database     : MySQL 8.0

Description:
This project analyzes banking transactions using SQL.

Topics Covered:
✔ DDL
✔ DML
✔ Joins
✔ Aggregate Functions
✔ GROUP BY
✔ HAVING
✔ CASE
✔ Business KPIs
✔ Fraud Detection
==========================================================
*/


-- =====================================
-- Database Creation
-- =====================================
CREATE DATABASE banking_dp;
use banking_db;
CREATE TABLE  customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
gender varchar(10),
city varchar(50),
account_opening_date DATE
);

CREATE TABLE accounts(
account_id INT PRIMARY KEY,
customer_id INT,
account_type VARCHAR(30),
branch_name VARCHAR(100),
opening_balance DECIMAL(12,2),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE transactions (
transaction_id INT PRIMARY KEY,
account_id int,
transaction_date TIMESTAMP,
transaction_type varchar(20),
amount DECIMAL(12,2),
FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
-- =====================================
-- Data Insertion
-- =====================================
-- inserting data into customers table
INSERT INTO customers  (customer_id, customer_name, gender, city, account_opening_date)
VALUES
(101,'Rahul Sharma','Male','Hyderabad','2021-03-15'),
(102,'Priya Reddy','Female','Bengaluru','2022-01-18'),
(103,'Amit Kumar','Male','Chennai','2020-09-10'),
(104,'Sneha Patel','Female','Mumbai','2023-02-20'),
(105,'Vikram Singh','Male','Delhi','2021-11-12'),
(106,'Anjali Verma','Female','Pune','2022-07-25'),
(107,'Rohit Gupta','Male','Hyderabad','2020-06-30'),
(108,'Neha Joshi','Female','Ahmedabad','2021-08-19'),
(109,'Kiran Rao','Male','Visakhapatnam','2023-01-05'),
(110,'Pooja Nair','Female','Kochi','2022-10-16'),
(111,'Arjun Das','Male','Kolkata','2020-05-11'),
(112,'Meera Iyer','Female','Chennai','2021-12-09'),
(113,'Suresh Yadav','Male','Lucknow','2022-04-22'),
(114,'Divya Sharma','Female','Jaipur','2023-06-18'),
(115,'Manoj Kumar','Male','Hyderabad','2021-01-28');

-- INSERTING VALUES INTO ACCOUNTS TABLE 

INSERT INTO accounts (account_id, customer_id, account_type, branch_name, opening_balance)
VALUES
(1001,121,'Savings','Hyderabad Main',95000),
(1002,102,'Savings','Bengaluru MG Road',120000),
(1003,103,'Current','Chennai Central',350000),
(1004,104,'Savings','Mumbai Andheri',60000),
(1005,105,'Current','Delhi Connaught',500000),
(1006,106,'Savings','Pune Camp',95000),
(1007,107,'Savings','Hyderabad Kukatpally',45000),
(1008,108,'Savings','Ahmedabad CG Road',135000),
(1009,109,'Savings','Vizag Beach Road',70000),
(1010,110,'Current','Kochi Marine',420000),
(1011,111,'Savings','Kolkata Salt Lake',88000),
(1012,112,'Savings','Chennai T Nagar',110000),
(1013,113,'Current','Lucknow Hazratganj',280000),
(1014,114,'Savings','Jaipur MI Road',92000),
(1015,115,'Savings','Hyderabad Gachibowli',150000);


-- INSERT VALUES INTO TRANSACTIONS TABLE
INSERT INTO transactions (transaction_id, account_id, transaction_date, transaction_type, amount)
VALUES
(56,1001,'2025-07-29 09:15:00','Deposit',1000000),
(2,1001,'2025-01-05 18:20:00','Withdrawal',3000),
(3,1001,'2025-01-10 10:10:00','Deposit',45000),
(4,1001,'2025-01-20 14:30:00','Withdrawal',12000),

(5,1002,'2025-01-04 11:25:00','Deposit',70000),
(6,1002,'2025-01-08 13:10:00','Withdrawal',6000),
(7,1002,'2025-01-18 16:40:00','Withdrawal',12000),
(8,1002,'2025-01-25 09:30:00','Deposit',30000),

(9,1003,'2025-01-05 10:15:00','Deposit',200000),
(10,1003,'2025-01-09 17:45:00','Withdrawal',45000),
(11,1003,'2025-01-21 12:50:00','Deposit',80000),
(12,1003,'2025-01-28 15:20:00','Withdrawal',20000),

(13,1004,'2025-01-02 08:40:00','Deposit',25000),
(14,1004,'2025-01-11 18:10:00','Withdrawal',3500),
(15,1004,'2025-01-22 13:30:00','Deposit',18000),

(16,1005,'2025-01-06 09:50:00','Deposit',300000),
(17,1005,'2025-01-12 15:45:00','Withdrawal',100000),
(18,1005,'2025-01-29 11:15:00','Deposit',85000),

(19,1006,'2025-01-03 12:00:00','Deposit',50000),
(20,1006,'2025-01-09 16:40:00','Withdrawal',7000),
(21,1006,'2025-01-26 10:25:00','Deposit',22000),

(22,1007,'2025-01-07 14:45:00','Deposit',28000),
(23,1007,'2025-01-17 18:30:00','Withdrawal',4500),
(24,1007,'2025-01-24 11:50:00','Withdrawal',3500),

(25,1008,'2025-01-08 10:20:00','Deposit',60000),
(26,1008,'2025-01-18 15:10:00','Withdrawal',12000),
(27,1008,'2025-01-27 09:30:00','Deposit',40000),

(28,1009,'2025-01-09 11:40:00','Deposit',30000),
(29,1009,'2025-01-14 17:20:00','Withdrawal',4500),
(30,1009,'2025-01-22 09:15:00','Deposit',15000),

(31,1010,'2025-01-04 09:10:00','Deposit',250000),
(32,1010,'2025-01-13 16:00:00','Withdrawal',50000),
(33,1010,'2025-01-24 13:15:00','Deposit',90000),

(34,1011,'2025-01-06 10:30:00','Deposit',35000),
(35,1011,'2025-01-16 18:00:00','Withdrawal',4500),
(36,1011,'2025-01-29 15:20:00','Deposit',12000),

(37,1012,'2025-01-05 09:50:00','Deposit',65000),
(38,1012,'2025-01-18 12:40:00','Withdrawal',8000),
(39,1012,'2025-01-26 14:15:00','Deposit',25000),

(40,1013,'2025-01-02 11:25:00','Deposit',180000),
(41,1013,'2025-01-14 17:35:00','Withdrawal',40000),
(42,1013,'2025-01-30 10:15:00','Deposit',70000),

(43,1014,'2025-01-07 09:20:00','Deposit',55000),
(44,1014,'2025-01-19 13:40:00','Withdrawal',5000),
(45,1014,'2025-01-28 16:30:00','Deposit',22000),

(46,1015,'2025-01-03 10:15:00','Deposit',85000),
(47,1015,'2025-01-12 14:20:00','Withdrawal',15000),
(48,1015,'2025-01-31 17:10:00','Deposit',35000),
(49,1001,'2025-02-03 09:15:00','Deposit',50000);

-- =====================================
-- Business KPI Queries
-- =====================================

SELECT COUNT(*) as total_customers 
FROM customers;

-- how many accounts are there ?
SELECT count(*) as total_accounts
FROM accounts;

-- total opening_balance in the bank
SELECT SUM(opening_balance) as total_bank_balance
from accounts;
 
 -- average opening balance in the bank
 SELECT AVG(opening_balance) as average_bank_balance
 FROM accounts;
 
 -- Highest opening balance
 SELECT MAX(opening_balance) as highest_bank_balance
 FROM accounts;
 
 -- lowerst opening balance
 SELECT MIN(opening_balance) as lowest_bank_balance
 FROM accounts;
 
 --  no of saving and current accounts in the bank
 SELECT account_type as account_type, COUNT(*) no_of_accounts
 FROM accounts
 GROUP BY  account_type;

-- No of cx in each city
SELECT city, count(*) as no_of_customers
FROM customers
group by city
order by no_of_customers DESC;

-- TOTAL DEPOSIT AMOUNT
select suM(amount) AS total_deposit_amount
FROM transactions
WHERE transaction_type = "Deposit";

-- total withdrwal amount
SELECT SUM(amount) AS total_withdrawl_amount
FROM transactions
where transaction_type = "Withdrawal";

-- net cashflow
SELECT SUM( CASE WHEN transaction_type = "Deposit" THEN amount ELSE 0 END) AS total_deposits,
	   SUM(CASE WHEN transaction_type = "Withdrawal" THEN amount ELSE 0 END) AS total_withdrawls,
	   SUM(CASE WHEN transaction_type = "Deposit" THEN amount ELSE -amount END) AS net_cashflows
FROM transactions;

-- Which customer deposited the most money?
SELECT c.customer_name , SUM(t.amount) AS total_amount_deposited
FROM customers c 
JOIN accounts a ON a.customer_id = c.customer_id
JOIN transactions t ON t.account_id = a.account_id
WHERE transaction_type = "Deposit"
GROUP BY   customer_name
ORDER BY total_amount_deposited desc;

-- Which cx withdraw most money or high value cx 
SELECT c.customer_name, SUM(t.amount) as total_withdrawl_amount
FROM customers c 
JOIN accounts a ON a.customer_id = c.customer_id
JOIN transactions t ON t.account_id = a.account_id
WHERE transaction_type = "Withdrawal"
GROUP BY c.customer_name
ORDER BY total_withdrawl_amount DESC;

-- BRANCH WISE OPENING BALANCE
SELECT a.branch_name as branch, SUM(a.opening_balance) as total_bank_balance
FROM accounts a
GROUP BY a.branch_name
ORDER BY total_bank_balance DESC;
	
-- CITY WISE TOTAL BALANCE
SELECT c.city, SUM(a.opening_balance) as total_bank_balance
FROM customers c
JOIN accounts a ON a.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_bank_balance;

-- display cx details with account details
SELECT c.customer_name,
		c.city,
        a.branch_name,
        a.account_type,
        a.opening_balance
FROM customers c 
JOIN accounts a ON a.customer_id = c.customer_id;

-- display every transaction with cx details
SELECT c.customer_name,
	   a.account_id,
       t.transaction_date,
       t.transaction_type,
       t.amount
FROM customers c 
JOIN accounts a on c.customer_id = a.customer_id
JOIN transactions t on t.account_id = a.account_id;
	
-- average transaction amount
use banking_db;
SELECT AVG(t.amount) as avg_transaction_amount
from transactions t;
-- number of deposits vs withdrawls
SELECT transaction_type , count(transaction_id)
from transactions
group by transaction_type;

-- highest transactions amount
SELECT MAX(amount) as highest_transaction_amount
from transactions;

-- monthly deposits 
SELECT MONTH(transaction_date)as month_mo ,
sum(amount) as transaction_amount
from transactions
group by 1;

-- monthly withdrawls
SELECT MONTH(transaction_date) AS trx_month,
SUM(amount) as withdrawl_ammount
FROM transactions
WHERE transaction_type = "Withdrawal" 
group by 1;

-- top 5 customers by total tnx amount
SELECT c.customer_name,
SUM(t.amount) AS total_amount
FROM customers c
JOIN accounts a on a.customer_id = c.customer_id
JOIN transactions t on t.account_id = a.account_id
group by 1
order by total_amount desc
limit 5;

-- cx with more than 3 transactions
SELECT c.customer_name, 
COUNT(t.transaction_id) as transactions
FROM customers c
JOIN accounts a ON a.customer_id = c.customer_id
JOIN transactions t on t.account_id = a.account_id
GROUP BY c.customer_name
HAVING transactions > 3;

-- branch wiht highest deposits 
SELECT a.branch_name, sum(t.amount) AS totl_deposit
FROM accounts a
JOIN  transactions t ON t.account_id = a.account_id
 WHERE transaction_type = "Deposit"
GROUP BY a.branch_name
ORDER BY totl_deposit DESC;

-- KEY BUSINESS METRICS
-- CURRENT ACCOUNT BALANCE
SELECT (select sum(opening_balance) from accounts ) + sum(
case when t.transaction_type = 'Deposit' then t.amount 
	 else - t.amount 
     END
     ) as current_account_balance
FROM accounts a
JOIN transactions t ON t.account_id = a.account_id;
use banking_db;

-- AVERAGE TRANSACTION AMOUNT
SELECT AVG(t.amount)
FROM transactions t;
-- AVERAGE TRANSACTION AMOUNT V2
SELECT SUM(t.amount)/ COUNT(t.transaction_id) AS avg_transaction_amount
FROM transactions t;
 
-- Daily transaction Volume
SELECT  DAY(t.transaction_date) AS DAY_OF_MONTH , COUNT(t.transaction_id) AS transaction_volume
FROM transactions t
GROUP BY 1
ORDER BY  1 ;

-- MONTHLY TRANSACTION TREND
-- 1
SELECT MONTH(t.transaction_date) MONTH_OF_YEAR ,COUNT(t.transaction_id) as no_of_transactions
FROM transactions t
GROUP BY 1;

WITH monthly_tnx_data AS 
(SELECT MONTH(t.transaction_date) AS months , sum(t.amount) AS total_amount
FROM transactions t 
GROUP BY MONTH(t.transaction_date) 
ORDER BY MONTH(t.transaction_date)  ASC)

SELECT months, 
total_amount, 
LAG(total_amount) OVER (ORDER BY MONTHS ASC) AS previous_month_total ,
total_amount - LAG(total_amount) OVER (ORDER BY MONTHS ASC)  AS mom_trend
FROM monthly_tnx_data;

-- Branch-wise Transactions  
SELECT a.branch_name AS branch, sum(t.amount) as total_amount
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
GROUP BY a.branch_name;

-- Account type analysis
SELECT a.account_type, count(a.account_id) AS no_of_accounts, 
sum(a.opening_balance) as balance,
AVG(a.opening_balance) as avg_balance,
MAX(a.opening_balance) as max_balance,
MIN(a.opening_balance) as min_balance
FROM accounts a
GROUP BY 1;

-- top cx by transaction value
SELECT c.customer_id as cx_id ,c.customer_name as cx_name, sum(t.amount) as total_tnx_value
FROM customers c
JOIN accounts a ON a.customer_id = c.customer_id
JOIN transactions t ON t.account_id = a.account_id
GROUP BY 1,c.customer_name 
ORDER BY total_tnx_value DESC 
limit 1;

-- most active cx
SELECT c.customer_id, c.customer_name, COUNT(t.transaction_id)
FROM customers c
JOIN accounts a on a.customer_id = c.customer_id
JOIN transactions t on t.account_id = a.account_id
GROUP BY 1,2 
limit 1;

-- dormant accounts
SELECT c.customer_id, c.customer_name ,a.account_id
FROM accounts a
left JOIN customers c on a.customer_id = c.customer_id
LEFT JOIN transactions t on t.account_id = a.account_id
WHERE t.transaction_id is NUll;

use banking_db;
-- deposit vs withdrawl ratio
SELECT count(case when transaction_type = "Deposit" then 1 else null end),
count(case when transaction_type = "Withdrawal" then 1 else null end),
count(case when transaction_type = "Deposit" then 1 else null end) / count(case when transaction_type = "Withdrawal" then 1 else null end) as dp_wi_ratio
FROM transactions t;

-- CASA ratio
SELECT  ( SUM( CASE WHEN account_type = "Savings" then opening_balance else 0 end ) 
		+ sum(CASE WHEN account_type = "Current" then opening_balance else 0 end ) 
        ) / sum(opening_balance) as casa_ratio
FROM accounts;


-- Fraud detection Alert 
-- MORE THAN 3 WITHDRAWLS IN SAME DAY
SELECT a.account_id, DATE(t.transaction_date) as tnx_date, COUNT(*) AS no_of_withdrawls
FROM transactions t
JOIN accounts a on t.account_id = a.account_id
WHERE  transaction_type = "Withdrawal"
GROUP BY a.account_id, DATE(t.transaction_date)
HAVING COUNT(*) > 3;

-- Fraud detection Alert 
-- MORE THAN 1L deposit in account in same day from same account
SELECT *
FROM transactions t
JOIN accounts a ON a.account_id = t.account_id
WHERE t.transaction_type = "Deposit" and t.amount > 100000;

-- transaction sucess rate 
SELECT 100 * SUM( CASE WHEN transaction_status = "Success" THEN 1 END)/ COUNT(*)
FROM transactions t 
