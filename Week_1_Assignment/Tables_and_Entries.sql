CREATE DATABASE Week1;

USE Week1;

-- Table 1
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CompanyName NVARCHAR(50),
    ContactName NVARCHAR(50),
    City NVARCHAR(50),
    Country NVARCHAR(50),
    Fax NVARCHAR(50)
);

-- Table 2
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    ReportsTo INT,
    FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
);

-- Table 3
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(50),
    CategoryID INT,
    SupplierID INT,
    UnitsInStock INT,
    UnitsOnOrder INT,
    Discontinued BIT,
    DiscontinuedDate DATE,
    Cost DECIMAL(10, 2)
);

-- Table 4
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR(50)
);

-- Table 5
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ShipCountry NVARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table 6
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    UnitPrice DECIMAL(10, 2),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Table 7
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName NVARCHAR(50)
);

-- Table 8 (query 38)
CREATE TABLE Actions (
    ActionID INT PRIMARY KEY,
    CustomerID INT,
    Action NVARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);



-- Insert data into Customers
INSERT INTO Customers (CustomerID, CompanyName, ContactName, City, Country, Fax) VALUES
(1, 'Celebal Technologies', 'Chirag Chaturvedi', 'Mumbai', 'India', NULL),
(2, 'Foodies', 'Sumit Srivastava', 'Berlin', 'Germany', '1234567890'),
(3, 'Linkedin', 'Rianchal Jha', 'London', 'UK', NULL),
(4, 'Fashion Hub', 'Sakshi Singh', 'New York', 'USA', '0987654321'),
(5, 'Health First', 'Ravi Sharma', 'Berlin', 'Germany', NULL),
(6, 'Amazon', 'Priya Jain', 'Mumbai', 'India', '1122334455');

-- Insert data into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShipCountry, EmployeeID) VALUES
(1, 1, '2023-05-01', 'India', 1),
(2, 2, '2023-05-02', 'Germany', 2),
(3, 3, '2023-05-03', 'UK', 3),
(4, 4, '2023-05-04', 'USA', 4),
(5, 5, '2023-05-05', 'Germany', 5),
(6, 6, '2023-05-06', 'India', 6);

-- Insert data into Products
INSERT INTO Products (ProductID, ProductName, CategoryID, SupplierID, UnitsInStock, UnitsOnOrder, Discontinued, DiscontinuedDate, Cost) VALUES
(1, 'Chai', 1, 1, 20, 0, 0, NULL, 10.00),
(2, 'Tofu', 2, 2, 15, 0, 0, NULL, 5.00),
(3, 'Biscuits', 3, 3, 30, 5, 1, '1997-06-01', 2.50),
(4, 'Sports Drink', 4, 4, 25, 10, 0, NULL, 8.00),
(5, 'Health Supplement', 5, 5, 10, 0, 0, NULL, 12.00);

-- Insert data into OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, UnitPrice, Quantity) VALUES
(1, 1, 1, 10.00, 5),
(2, 2, 2, 5.00, 10),
(3, 3, 3, 2.50, 20),
(4, 4, 4, 8.00, 15),
(5, 5, 5, 12.00, 10),
(6, 6, 2, 5.00, 8);

-- Insert data into Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, ReportsTo) VALUES
(1, 'Amit', 'Shah', NULL),
(2, 'Chirag', 'Chaturvedi', 1),
(3, 'Raj', 'Mehta', 1),
(4, 'Sneha', 'Desai', 2),
(5, 'Rohit', 'Verma', 2),
(6, 'Anil', 'Kapoor', 3);

-- Insert data into Categories
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Beverages'),
(2, 'Condiments'),
(3, 'Confections'),
(4, 'Dairy Products'),
(5, 'Grains/Cereals');

-- Insert data into Suppliers
INSERT INTO Suppliers (SupplierID, CompanyName) VALUES
(1, 'ABC Suppliers'),
(2, 'Global Foods'),
(3, 'Specialty Biscuits, Ltd.'),
(4, 'Sports Supplies Co.'),
(5, 'Health Goods Inc.');

-- Insert data into Actions (to match query 38)
INSERT INTO Actions (ActionID, CustomerID, Action) VALUES
(1, 1, 'Order Placed'),
(2, 2, 'Returned Item'),
(3, 3, 'Order Placed'),
(4, 4, 'Feedback Given'),
(5, 5, 'Order Placed'),
(6, 6, 'Order Placed');


-- Extra entries for queries.
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShipCountry, EmployeeID) VALUES
(7, 3, '2023-06-01', 'UK', 3);
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, UnitPrice, Quantity) VALUES
(7, 7, 1, 10.00, 3);

--for query 16
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShipCountry, EmployeeID) VALUES
(8, 1, '2023-06-01', 'India', 1);
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, UnitPrice, Quantity) VALUES
(8, 8, 1, 10.00, 301);

-- for query 18
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShipCountry, EmployeeID) VALUES
(9, 2, '2023-06-02', 'Canada', 2);

-- for query 22.
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShipCountry, EmployeeID) VALUES
(10, 1, '2023-06-01', 'India', 1),
(11, 1, '2023-06-01', 'India', 1),
(12, 1, '2023-06-01', 'India', 1);

-- for query 27.
INSERT INTO Employees (EmployeeID, FirstName, LastName, ReportsTo) VALUES
(7, 'Nina', 'Singh', 1),
(8, 'Karan', 'Patel', 1),
(9, 'Sonia', 'Mehta', 1);

-- for query 32.
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShipCountry, EmployeeID) VALUES
(14, 1, '2023-06-03', 'France', 1);
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, UnitPrice, Quantity) VALUES
(14, 14, 2, 15.00, 10);

-- for query 33.
INSERT INTO Suppliers (SupplierID, CompanyName) VALUES
(3, 'Specialty Biscuits, Ltd.');
INSERT INTO Products (ProductID, ProductName, CategoryID, SupplierID, UnitsInStock, UnitsOnOrder, Discontinued, DiscontinuedDate, Cost) VALUES
(15, 'Ginger Biscuits', 2, 3, 150, 0, 0, NULL, 4.50);

-- for query 35.
INSERT INTO Products (ProductID, ProductName, CategoryID, SupplierID, UnitsInStock, UnitsOnOrder, Discontinued, DiscontinuedDate, Cost) VALUES
(16, 'Eggs', 2, 3, 8, 0, 0, NULL, 7.50);
INSERT INTO Products (ProductID, ProductName, CategoryID, SupplierID, UnitsInStock, UnitsOnOrder, Discontinued, DiscontinuedDate, Cost) VALUES
(17, 'Brown Bread', 2, 3, 6, 0, 0, NULL, 8.50);

