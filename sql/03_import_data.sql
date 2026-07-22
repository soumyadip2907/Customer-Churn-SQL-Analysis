/*
=========================================================
Project : Customer Churn Analysis
Author  : Soumyadip Sinha Roy
Database: PostgreSQL
Tool    : pgAdmin 4

Purpose : Import customer data from the IBM Telco Customer
		  Churn CSV file into the customers table.

Dataset : IBM Telco Customer Churn Dataset

Source File : Telco-Customer-Churn.csv
=========================================================
*/

-- Import data into customers table.
COPY customers (customer_id, gender, senior_citizen, partner, dependents, tenure,
				phone_service, multiple_lines, internet_service, online_security,
				online_backup, device_protection, tech_support, streaming_tv,
				streaming_movies, contract, paperless_billing, payment_method,
				monthly_charges, total_charges, churn)
FROM 'C:\Users\soumy\Desktop\Churn_SQL_Project\dataset\Telco-Customer-Churn.csv'
DELIMITER ','
CSV HEADER;

-- Preview imported table.
SELECT * FROM customers
LIMIT 10;