/*
=============================================================
Data Cleaning and Validation
=============================================================
Project : Customer Churn Analysis using PostgreSQL
Purpose : Clean the imported dataset, handle missing values,
          validate data consistency, and prepare the data
          for business analysis.
=============================================================
*/

/*
=============================================================
Data Overview
=============================================================
Purpose: Understand the overall structure and size of the
         imported dataset before performing data cleaning.
=============================================================
*/

-- Count the total number of customer records.
SELECT COUNT(*) AS total_customers
FROM customers;

-- Preview the first 10 records.
SELECT * FROM customers
LIMIT 10;

/*
=============================================================
Duplicate Check
=============================================================
Purpose: Verify that customer_id values are unique and that
         no duplicate customer records exist.
=============================================================
*/

-- Check for duplicate customer IDs.
SELECT customer_id, COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

/*
=============================================================
Missing Values Check
=============================================================
Purpose: Identify blank or whitespace-only values before
         cleaning the dataset.
=============================================================
*/

-- Check for blank or whitespace-only values in total_charges.
SELECT COUNT(*) AS blank_total_charges
FROM customers
WHERE TRIM(total_charges) = '';

/*
=============================================================
Schema Modification
=============================================================
Purpose: Modify the table schema to support the data cleaning
         process.
=============================================================
*/

-- Remove the NOT NULL constraint.
ALTER TABLE customers
ALTER COLUMN total_charges DROP NOT NULL;

/*
=============================================================
Data Cleaning
=============================================================
Purpose: Replace blank or whitespace-only values with NULL
         to ensure proper handling of missing data.
=============================================================
*/

-- Update the blank values to NULL.
UPDATE customers
SET total_charges = NULL
WHERE TRIM(total_charges) = '';

-- Check the number of NULL values.
SELECT COUNT(*) AS null_total_charges
FROM customers
WHERE total_charges IS NULL;

/*
=============================================================
Data Type Conversion
=============================================================
Purpose: Convert total_charges from text to a numeric data
         type for accurate calculations and analysis.
=============================================================
*/

-- Convert total_charges from VARCHAR to NUMERIC.
ALTER TABLE customers
ALTER COLUMN total_charges
TYPE NUMERIC(10,2)
USING total_charges::NUMERIC;

-- Verify the data type of total_charges.
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'customers'
AND column_name = 'total_charges';

-- Verify NULL values after data type conversion.
SELECT COUNT(*) AS null_total_charges
FROM customers
WHERE total_charges IS NULL;

/*
=============================================================
Data Consistency Validation
=============================================================
Purpose: Verify that categorical columns contain only the
         expected business values before performing analysis.
=============================================================
*/

-- Validate customer distribution by gender.
SELECT gender, COUNT(*) AS customer_count
FROM customers
GROUP BY gender
ORDER BY customer_count DESC;

-- Validate customer distribution by internet service.
SELECT internet_service, COUNT(*) AS customer_count
FROM customers
GROUP BY internet_service
ORDER BY customer_count DESC;

-- Validate customer distribution by contract type.
SELECT contract, COUNT(*) AS customer_count
FROM customers
GROUP BY contract
ORDER BY customer_count DESC;

-- Validate customer distribution by payment method.
SELECT payment_method, COUNT(*) AS customer_count
FROM customers
GROUP BY payment_method
ORDER BY customer_count DESC;

-- Validate customer distribution by churn status.
SELECT churn, COUNT(*) AS customer_count
FROM customers
GROUP BY churn
ORDER BY customer_count DESC;

/*
=============================================================
Final Validation
=============================================================
Purpose: Perform final quality checks after data cleaning to
         ensure the dataset is ready for business analysis.
=============================================================
*/

-- Verify that the total number of customer records remains unchanged.
SELECT COUNT(*) AS total_customers
FROM customers;

-- Verify the number of NULL values in total_charges after cleaning.
SELECT COUNT(*) AS null_total_charges
FROM customers
WHERE total_charges IS NULL;

-- Verify that total_charges has been successfully converted to NUMERIC.
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'customers'
AND column_name = 'total_charges';
