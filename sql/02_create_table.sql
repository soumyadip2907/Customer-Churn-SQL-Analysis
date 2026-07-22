/*
=========================================================
Project : Customer Churn Analysis
Author  : Soumyadip Sinha Roy
Database: PostgreSQL
Tool    : pgAdmin 4

Purpose : Create the customer table for the IBM Telco Customer
		  Churn dataset before importing the CSV data.

Dataset : IBM Telco Customer Churn Dataset

Table : customers

Description : This table stores customer demographic information,
    		  subscribed services, billing details, contract
    		  information, and churn status. Each record
    		  represents one customer.
=========================================================
*/

-- Drop the customers table if it already exists.
DROP TABLE IF EXISTS customers;

-- Create the customers table.
CREATE TABLE customers (
		customer_id VARCHAR(20) PRIMARY KEY,
		gender VARCHAR(10) NOT NULL,
		senior_citizen INT NOT NULL,
		partner VARCHAR(3) NOT NULL,
		dependents VARCHAR(3) NOT NULL,
		tenure INT NOT NULL,
		phone_service VARCHAR(3) NOT NULL,
		multiple_lines VARCHAR(20) NOT NULL,
		internet_service VARCHAR(20) NOT NULL,
		online_security VARCHAR(20) NOT NULL,
		online_backup VARCHAR(20) NOT NULL,
		device_protection VARCHAR(20) NOT NULL,
		tech_support VARCHAR(20) NOT NULL,
		streaming_tv VARCHAR(20) NOT NULL,
		streaming_movies VARCHAR(20) NOT NULL,
		contract VARCHAR(20) NOT NULL,
		paperless_billing VARCHAR(3) NOT NULL,
		payment_method VARCHAR(50) NOT NULL,
		monthly_charges NUMERIC(10,2) NOT NULL,
		total_charges VARCHAR(20) NOT NULL, -- Imported as VARCHAR due to blank values in the source dataset.
		churn VARCHAR(3) NOT NULL
);

-- Preview customers table.
SELECT * FROM customers;