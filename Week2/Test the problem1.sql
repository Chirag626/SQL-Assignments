-- Query 1:  to check successful inserted with given productId , Unitprice and Discount
EXEC InsertOrderDetails @OrderID = 1, @ProductID = 1, @UnitPrice = 12.50, @Quantity = 5, @Discount = 0.1;
SELECT * FROM [Order Details];
SELECT * FROM Product;

-- Query 2: inserted default unitprice and discount
EXEC InsertOrderDetails @OrderID = 2, @ProductID = 2, @Quantity = 5;
SELECT * FROM [Order Details];
SELECT * FROM Product;

-- Query 3: Insufficient Stock
EXEC InsertOrderDetails @OrderID = 3, @ProductID = 2, @Quantity = 100;
SELECT * FROM [Order Details];
SELECT * FROM Product;







