-- Table for employee salaries (Task 15)
CREATE TABLE EmployeeSalaries ( EmployeeID INT, Salary DECIMAL(10, 2));

INSERT INTO EmployeeSalaries (EmployeeID, Salary) VALUES
(1, 50000),
(2, 60000),
(3, 70000),
(4, 80000),
(5, 90000),
(6, 40000);


-- Find top 5 employees according to salary (without order by)
SELECT EmployeeID, Salary 
FROM EmployeeSalaries a
WHERE 5 > (SELECT COUNT(*) FROM EmployeeSalaries b WHERE b.Salary > a.Salary);


