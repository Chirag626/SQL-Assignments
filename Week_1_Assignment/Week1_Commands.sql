-- 1. List all of customers.
SELECT * FROM Customers;

-- 2. List all of customers where company name ending in N.
SELECT * FROM Customers WHERE CompanyName LIKE '%N';

-- 3. List all customers who live in Berlin or London.
SELECT * FROM Customers WHERE City IN ('Berlin', 'London');

-- 4. List all customers who live in UK or USA.
SELECT * FROM Customers WHERE Country IN ('UK', 'USA');

-- 5. List of all products sorted by product name.
SELECT * FROM Products ORDER BY ProductName;

INSERT INTO Products (ProductID, ProductName, CategoryID, SupplierID, UnitsInStock, UnitsOnOrder, Discontinued, DiscontinuedDate, Cost) VALUES
(6, 'Apple Juice', 1, 1, 50, 0, 0, NULL, 3.00);

-- 6. List of all products where product name starts with an A.
SELECT * FROM Products WHERE ProductName LIKE 'A%';

-- 7/9. List of customers who never placed an order.
SELECT * FROM Customers WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders);

-- 8. List of customers who live in London and have bought chai.
SELECT DISTINCT c.CustomerID, c.CompanyName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE c.City = 'London' AND p.ProductName = 'Chai';

-- 10. List of customers who ordered Tofu.
SELECT DISTINCT c.CustomerID, c.CompanyName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Tofu';

-- 11. Details of Tofu with the order ID and the quantity of items in that order.
SELECT o.OrderID, od.Quantity
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Tofu';

-- 12. Find the details of the most expensive order date.
SELECT TOP 1 o.OrderID, o.OrderDate, SUM(od.UnitPrice * od.Quantity) AS TotalCost
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID, o.OrderDate
ORDER BY TotalCost DESC;

-- 13. For each order get the OrderID and Average quantity of items in that order.
SELECT o.OrderID, AVG(od.Quantity) AS AverageQuantity
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID;

-- 14. For each order get the OrderID, minimum quantity, and maximum quantity for that order.
SELECT o.OrderID, MIN(od.Quantity) AS MinQuantity, MAX(od.Quantity) AS MaxQuantity
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID;

-- 15. Get a list of all managers and the total number of employees who report to them.
SELECT m.EmployeeID AS ManagerID, m.FirstName + ' ' + m.LastName AS ManagerName, COUNT(e.EmployeeID) AS NumberOfReports
FROM Employees e
JOIN Employees m ON e.ReportsTo = m.EmployeeID
GROUP BY m.EmployeeID, m.FirstName, m.LastName;

-- 16. Get the OrderID and the total quantity for each order that has a total quantity of greater than 300.
SELECT o.OrderID, SUM(od.Quantity) AS TotalQuantity
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID
HAVING SUM(od.Quantity) > 300;

-- 17. List all orders placed on or after 1996/12/31.
SELECT * FROM Orders WHERE OrderDate >= '1996-12-31';


-- 18. List of all orders shipped to Canada.
SELECT * FROM Orders WHERE ShipCountry = 'Canada';

-- 19. List of orders with order total > 200.
SELECT o.OrderID, SUM(od.UnitPrice * od.Quantity) AS OrderTotal
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID
HAVING SUM(od.UnitPrice * od.Quantity) > 200;

-- 20. List of all orders and sales made in each country.
SELECT o.OrderID, o.ShipCountry, SUM(od.UnitPrice * od.Quantity) AS TotalSales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID, o.ShipCountry;

-- 21. List of Customer ContactName and number of orders they placed.
SELECT c.ContactName, COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.ContactName;

-- 22. List of customer contact name who have placed more than 3 orders.
SELECT c.ContactName, COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.ContactName
HAVING COUNT(o.OrderID) > 3;

-- 23. List of discontinued products which were produced between 1/1/1997 and 1/1/1998.
SELECT * FROM Products
WHERE Discontinued = 1 AND DiscontinuedDate BETWEEN '1997-01-01' AND '1998-01-01';

-- 24. List of Employee firstname, lastname, supervisor firstname, lastname.
SELECT e.FirstName, e.LastName, s.FirstName AS SupervisorFirstName, s.LastName AS SupervisorLastName
FROM Employees e
LEFT JOIN Employees s ON e.ReportsTo = s.EmployeeID;

-- 25. List of Employees id and total sales achieved by employee.
SELECT e.EmployeeID, SUM(od.UnitPrice * od.Quantity) AS TotalSales
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID;

-- 26. List of employees whose Firstname contains character a.
SELECT * FROM Employees WHERE FirstName LIKE '%a%';

-- 27. List of managers who have more than four people reporting to them.
SELECT m.EmployeeID AS ManagerID, m.FirstName + ' ' + m.LastName AS ManagerName, COUNT(e.EmployeeID) AS NumberOfReports
FROM Employees e
JOIN Employees m ON e.ReportsTo = m.EmployeeID
GROUP BY m.EmployeeID, m.FirstName, m.LastName
HAVING COUNT(e.EmployeeID) > 4;

-- 30. List of orders placed by customers who do not have a Fax number.
SELECT o.*
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Fax IS NULL;

-- 31. List of Country names where the product Tofu was shipped.
SELECT DISTINCT o.ShipCountry
FROM Orders o
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Tofu';

-- 32. List of Product Names that were shipped to France.
SELECT DISTINCT p.ProductName
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.ShipCountry = 'France';

-- 33. List of ProductNames and Categories for the supplier "Specialty Biscuits, Ltd.".
SELECT p.ProductName, c.CategoryName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE s.CompanyName = 'Specialty Biscuits, Ltd.';

-- 34. List of products that were never ordered
SELECT p.ProductName
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
WHERE od.OrderID IS NULL;

-- 35. List of all products where UnitsInStock is less than 10 and Units on order are 0.
SELECT ProductName
FROM Products
WHERE UnitsInStock < 10 AND UnitsOnOrder = 0;

-- 36. List of top 10 countries by sales.
SELECT TOP 10 o.ShipCountry, SUM(od.UnitPrice * od.Quantity) AS TotalSales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.ShipCountry
ORDER BY TotalSales DESC;

-- 37. Number of orders each employee has taken for customers with CustomerID between 1 and 3
SELECT c.CustomerID, p.ProductName, a.Action
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Actions a ON c.CustomerID = a.CustomerID
WHERE c.CustomerID BETWEEN 1 AND 3;

-- 38. Product name and cost of most expensive order.
SELECT TOP 1 p.ProductName, od.UnitPrice
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
ORDER BY od.UnitPrice DESC;

-- 39. Product name and Total Revenue from that product.
SELECT p.ProductName, SUM(od.UnitPrice * od.Quantity) AS TotalRevenue
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY p.ProductName;

-- 40. Supplier id and number of  products offered.
SELECT SupplierID, COUNT(ProductID) AS NumberOfProducts
FROM Products
GROUP BY SupplierID;

-- 41. List of the top 5 selling products.
SELECT TOP 5 p.ProductName, SUM(od.Quantity) AS TotalSold
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC;

-- 42. What is the total revenue of the company.
SELECT SUM(od.UnitPrice * od.Quantity) AS TotalRevenue
FROM OrderDetails od;















































