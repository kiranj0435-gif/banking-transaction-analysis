# 🏦 Banking Transaction Analysis using SQL

## 📌 Project Overview

This project demonstrates how SQL can be used to analyze banking data and generate meaningful business insights. It covers database creation, data manipulation, business KPIs, fraud detection, and customer transaction analysis using MySQL.

The project simulates a real-world banking environment with Customers, Accounts, and Transactions tables.

---

## 🎯 Objectives

- Analyze customer banking behavior
- Calculate key banking KPIs
- Detect suspicious transactions
- Perform branch-wise and account-wise analysis
- Practice SQL interview questions using real business scenarios

---

## 🗂 Database Schema

The project consists of three tables:

### 1. Customers
- Customer ID
- Customer Name
- Gender
- City
- Account Opening Date

### 2. Accounts
- Account ID
- Customer ID
- Account Type
- Branch Name
- Opening Balance

### 3. Transactions
- Transaction ID
- Account ID
- Transaction Date
- Transaction Type
- Amount
- Transaction Status

---

# 📊 Business KPIs

The following banking KPIs were analyzed:

- Total Customers
- Total Accounts
- Total Transactions
- Total Deposits
- Total Withdrawals
- Net Cash Flow
- Current Account Balance
- Average Transaction Amount
- Daily Transaction Volume
- Monthly Transaction Trend
- Branch-wise Transactions
- Account Type Analysis
- Top Customers by Transaction Value
- Most Active Customers
- Dormant Accounts
- High Value Transactions
- Deposit vs Withdrawal Ratio
- Fraud Detection Alerts
- Transaction Success Rate
- Peak Transaction Hours

---

# 🚨 Fraud Detection Queries

Implemented SQL queries to identify:

- High-value transactions (> ₹1,00,000)
- More than 3 withdrawals on the same day
- Customers with unusually high withdrawals
- Suspicious transaction patterns

---

# 💻 SQL Concepts Used

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- Aggregate Functions
- INNER JOIN
- CASE WHEN
- Subqueries
- Common Table Expressions (CTE)
- Window Functions (Planned)

---

# 🛠 Technologies Used

- MySQL 8.0
- MySQL Workbench

---

# 📷 Sample Outputs

## Total Deposits




## Branch-wise Transactions



## Fraud Detection




# 📈 Business Insights

- Identified the branches with the highest transaction volumes.
- Calculated deposit and withdrawal trends.
- Detected suspicious withdrawal activities.
- Evaluated customer transaction behavior.

---

# 📁 Repository Structure

```
Banking-Transaction-Analysis/
│
├── Banking_Transaction_Analysis.sql
├── README.md
├── Database_Schema.png
├── ER_Diagram.png
└── Screenshots/
      ├── Total_Deposits.png
      ├── Fraud_Detection.png
      ├── Branch_Analysis.png
      └── Transaction_Success.png

# 👨‍💻 Author

**Kiran J**

📧 Email: kiran.j0435@gmail.com

🔗 LinkedIn: 

💻 GitHub: https://github.com/kiranj0435-gif

---

⭐ If you found this project helpful, consider giving it a star!
