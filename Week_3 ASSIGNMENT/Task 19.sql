CREATE TABLE EMPLOYEES (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2) );


INSERT INTO EMPLOYEES (id, name, salary) VALUES
(1, 'Aman', 5000.00),
(2, 'Bobby', 6000.00),
(3, 'Chirag', 7000.00),
(4, 'Samantha', 8000.00),
(5, 'Deeksha', 9000.00);


-- Determine the Actual Average Salary
SELECT AVG(salary) AS actual_avg_salary FROM EMPLOYEES;

--  Determine the Miscalculated Average Salary
SELECT AVG(CAST(REPLACE(CAST(salary AS CHAR), '0', '') AS DECIMAL(10, 2))) AS miscalculated_avg_salary
FROM EMPLOYEES;

-- Calculate the Difference and Round Up
SELECT CEILING(actual_avg_salary - miscalculated_avg_salary) AS rounded_error
FROM (
    SELECT 
        (SELECT AVG(salary) FROM EMPLOYEES) AS actual_avg_salary,
        (SELECT AVG(CAST(REPLACE(CAST(salary AS CHAR), '0', '') AS DECIMAL(10, 2))) FROM EMPLOYEES) AS miscalculated_avg_salary
) AS subquery;



