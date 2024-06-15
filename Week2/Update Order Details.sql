CREATE OR ALTER PROCEDURE UpdateOrderDetails
    @OrderID INT,
    @ProductID INT,
    @UnitPrice DECIMAL(10, 2) = NULL,
    @Quantity INT = NULL,
    @Discount FLOAT = NULL
AS
BEGIN
    UPDATE [Order Details]
    SET 
        UnitPrice = ISNULL(@UnitPrice, UnitPrice),
        Quantity = ISNULL(@Quantity, Quantity),
        Discount = ISNULL(@Discount, Discount)
    WHERE OrderID = @OrderID AND ProductID = @ProductID;

    -- Check if the update was successful
    IF @@ROWCOUNT = 0
    BEGIN
        PRINT 'No rows were updated. Please check if the OrderID and ProductID exist.';
    END
    ELSE
    BEGIN
        PRINT 'Update successful.';
    END
END;


--TRUNCATE TABLE [Order Details];
INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (1, 1, 10.00, 5, 0.1),
       (2, 2, 20.00, 10, 0.2),
       (3, 1, 15.00, 20, 0.15);

INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)VALUES (1, 2, 15.00, 5, 0.1)
INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)VALUES (2, 1, 18.00, 5, 0.9)
SELECT * FROM [Order Details];



----- TEST THE PROCEDURE ------
-- SCENARIO 1:  Update the Discount for OrderID 1 and ProductID 2
EXEC UpdateOrderDetails @OrderID = 1, @ProductID = 2, @Discount = 0.5;
SELECT * FROM [Order Details] WHERE OrderID = 1 AND ProductID = 2;

-- SCENARIO 2: Update UnitPrice and Quantity
EXEC UpdateOrderDetails @OrderID = 1, @ProductID = 1, @UnitPrice = 12.00, @Quantity = 7;
SELECT * FROM [Order Details] WHERE OrderID = 1 AND ProductID = 1;






