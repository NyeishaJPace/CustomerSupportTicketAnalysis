CREATE TABLE tickets (
	Ticket_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(255),
    Customer_Email VARCHAR(255),
    Customer_Age INT,
    Customer_Gender VARCHAR(10),
    Product_Purchased VARCHAR(255),
    Date_of_Purchase date,
    Ticket_Type VARCHAR(255),
    Ticket_Subject VARCHAR(255),
    Ticket_Description TEXT,
    Ticket_Status VARCHAR(50),
    Resolution TEXT,
    Ticket_Priority VARCHAR(50),
    Ticket_Channel VARCHAR(50),
    First_Response_Time DATETIME,
    Time_to_Resolution DATETIME,
    Customer_Satisfaction_Rating FLOAT
    );