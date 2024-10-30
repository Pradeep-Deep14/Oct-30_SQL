CREATE TABLE customers (
         customer_id INT PRIMARY KEY, 
         customer_name VARCHAR(100)
     );
     CREATE TABLE orders (
         order_id INT PRIMARY KEY, 
         customer_id INT
     );
     INSERT INTO customers VALUES 
         (1, 'Rajesh'), 
         (2, 'Aditi'), 
         (3, 'Vikram'); 
     INSERT INTO orders VALUES 
         (1, 1), 
         (2, 1), 
         (3, 2), 
         (4, 1);


--Get customers who have made more than 2 orders.

SELECT * FROM CUSTOMERS

SELECT * FROM ORDERS

SELECT C.CUSTOMER_NAME,
	   COUNT(O.*)
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID=O.CUSTOMER_ID
GROUP BY 1
HAVING COUNT(O.*)>2