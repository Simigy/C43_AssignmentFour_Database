-- Q1

SELECT DISTINCT orderNumber
FROM orderdetails
WHERE productCode LIKE 'S18%' 
  AND priceEach > 100;


-- Q2

SELECT *
FROM payments
WHERE DAY(paymentDate) IN (5, 6);


-- Q3

SELECT creditLimit
FROM (
  SELECT creditLimit, 
         ROW_NUMBER() OVER (ORDER BY creditLimit DESC) AS row_num
  FROM customers
  WHERE country = 'USA'
    AND phone LIKE '%5555%'
) AS ranked_customers
WHERE row_num = 5;

-- another solution :

SELECT creditLimit
FROM customers
WHERE country = 'USA'
  AND phone LIKE '%5555%'
ORDER BY creditLimit DESC
LIMIT 1 OFFSET 4;


