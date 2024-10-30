CREATE TABLE bank_transactions (transaction_id SERIAL PRIMARY KEY,
	bank_id INT,
	customer_id INT,
	transaction_amount DECIMAL(10, 2),
	transaction_type VARCHAR(10),
	transaction_date DATE);

INSERT INTO bank_transactions (bank_id, customer_id, transaction_amount, transaction_type, transaction_date) VALUES (1, 101, 500.00, 'credit', '2024-01-01'), (1, 101, 200.00, 'debit', '2024-01-02'), (1, 101, 300.00, 'credit', '2024-01-05'), (1, 101, 150.00, 'debit', '2024-01-08'), (1, 102, 1000.00, 'credit', '2024-01-01'), (1, 102, 400.00, 'debit', '2024-01-03'), (1, 102, 600.00, 'credit', '2024-01-05'), (1, 102, 200.00, 'debit', '2024-01-09');


SELECT * FROM BANK_TRANSACTIONS

/*
Write a query to return each customer_id and their bank balance. Note that bank balance is calculated as Total Credit - Total Debit.
*/

--CUSTOMER_ID
--BANK_BALANCE

--APPROACH 1

WITH CTE1 AS
(
SELECT CUSTOMER_ID,
       SUM(TRANSACTION_AMOUNT)AS CREDIT_SUM
FROM BANK_TRANSACTIONS
WHERE TRANSACTION_TYPE= 'credit'
GROUP BY 1
),CTE2 AS
(	
SELECT CUSTOMER_ID,
       SUM(TRANSACTION_AMOUNT)AS DEBIT_SUM
FROM BANK_TRANSACTIONS
WHERE TRANSACTION_TYPE= 'debit'
GROUP BY 1
)
SELECT CTE1.CUSTOMER_ID,
      (CTE1.CREDIT_SUM - CTE2.DEBIT_SUM) AS BANK_BALANCE
FROM CTE1
JOIN CTE2 
ON CTE1.CUSTOMER_ID=CTE2.CUSTOMER_ID

--Approach 2

SELECT 
    CUSTOMER_ID,
    SUM(CASE WHEN TRANSACTION_TYPE = 'credit' THEN TRANSACTION_AMOUNT ELSE 0 END) AS CREDIT_SUM,
    SUM(CASE WHEN TRANSACTION_TYPE = 'debit' THEN TRANSACTION_AMOUNT ELSE 0 END) AS DEBIT_SUM,
    SUM(CASE WHEN TRANSACTION_TYPE = 'credit' THEN TRANSACTION_AMOUNT ELSE 0 END) - 
    SUM(CASE WHEN TRANSACTION_TYPE = 'debit' THEN TRANSACTION_AMOUNT ELSE 0 END) AS BANK_BALANCE
FROM 
    BANK_TRANSACTIONS
GROUP BY 
    CUSTOMER_ID;

       