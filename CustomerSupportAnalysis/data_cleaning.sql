SELECT Ticket_Type, COUNT(*) AS Ticket;

SELECT * FROM tickets LIMIT 5;

-- View unique genders
SELECT DISTINCT Customer_Gender
FROM tickets;

-- # of "Other" records existing
SELECT COUNT(*)
FROM tickets
WHERE Customer_Gender = 'Other';

-- Updating "Other" to "Unknown"
UPDATE tickets
SET Customer_Gender = 'Unknown'
WHERE Customer_Gender = 'Other';

-- Verifying the update
SELECT DISTINCT Customer_Gender
FROM tickets;

-- Checking for any null values in the "Resolution" column
-- Insight: There are missing values in the "Resolution" column
SELECT *
FROM tickets
WHERE Resolution IS NULL OR Resolution = '';

-- Checking for the # of missing values in the Resolution column
SELECT COUNT(*)
FROM tickets
WHERE Resolution IS NULL OR Resolution = '';

-- Updating the missing values in the "Resolution" column
-- Insight: I checked for null values when I needed to check for empty strings instead.
UPDATE tickets
SET Resolution = 'Not Provided'
WHERE Resolution = '';

-- Verifying the update
SELECT DISTINCT Resolution
FROM tickets;

SELECT COUNT(*)
FROM tickets
WHERE Resolution = '';

-- Changing the column data type to DATE
ALTER TABLE tickets
MODIFY COLUMN First_Response_Time DATE;

ALTER TABLE tickets
MODIFY COLUMN Time_to_Resolution DATE;

-- Checking the table structure
DESC tickets;

-- Run this query if you receive error regarding "incorrect date value"
SET sql_mode = '';

-- Checking for missing values in all columns
SELECT 
COUNT(*) - COUNT(NULLIF(Ticket_ID, '')) AS missing_Ticket_ID, 
COUNT(*) - COUNT(NULLIF(Customer_Name, '')) AS missing_Customer_Name,
COUNT(*) - COUNT(NULLIF(Customer_Email, '')) AS missing_Customer_Email,
COUNT(*) - COUNT(NULLIF(Customer_Age, '')) AS missing_Customer_Age,
COUNT(*) - COUNT(NULLIF(Customer_Gender, '')) AS missing_Customer_Gender,
COUNT(*) - COUNT(NULLIF(Product_Purchased, '')) AS missing_Product_Purchased,
COUNT(*) - COUNT(NULLIF(Ticket_Type, '')) AS missing_Ticket_Type,
COUNT(*) - COUNT(NULLIF(Ticket_Subject, '')) AS missing_Ticket_Subject,
COUNT(*) - COUNT(NULLIF(Ticket_Description, '')) AS missing_Ticket_Description,
COUNT(*) - COUNT(NULLIF(Ticket_Status, '')) AS missing_Ticket_Status,
COUNT(*) - COUNT(NULLIF(Resolution, '')) AS missing_Resolution,
COUNT(*) - COUNT(NULLIF(Ticket_Priority, '')) AS missing_Ticket_Priority,
COUNT(*) - COUNT(NULLIF(Ticket_Channel, '')) AS missing_Ticket_Channel,

-- Handling missing dates 
COUNT(*) - COUNT(NULLIF(Date_of_Purchase, '0000-00-00')) AS missing_Date_of_Purchase,
COUNT(*) - COUNT(NULLIF(First_Response_Time, '0000-00-00')) AS missing_First_Response_Time,
COUNT(*) - COUNT(NULLIF(Time_to_Resolution, '0000-00-00')) AS missing_Time_to_Resolution,
COUNT(*) - COUNT(NULLIF(Customer_Satisfaction_Rating, '')) AS missing_Customer_Satisfaction_Rating
FROM tickets;

/* Changing the missing values for column "Customer_Satisfaction_Rating" to NULL value */

UPDATE tickets 
SET Customer_Satisfaction_Rating = NULL 
WHERE Customer_Satisfaction_Rating = '';
