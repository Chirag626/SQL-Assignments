CREATE PROCEDURE DeleteOrderDetails
    @OrderID INT,
    @ProductID INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM [Order Details] WHERE OrderID = @OrderID)
    BEGIN
        PRINT 'Invalid OrderID';
        RETURN -1;
    END
    IF NOT EXISTS (SELECT * FROM [Order Details] WHERE OrderID = @OrderID AND ProductID = @ProductID)
    BEGIN
        PRINT 'Invalid ProductID for the given OrderID';
        RETURN -1;
    END
    
    DELETE FROM [Order Details]
    WHERE OrderID = @OrderID AND ProductID = @ProductID;
END;


select*from[Order Details]
-- Test with a valid OrderID and ProductID
EXEC DeleteOrderDetails @OrderID = 2, @ProductID = 2;

-- Test with an invalid OrderID
EXEC DeleteOrderDetails @OrderID = 999, @ProductID = 456;

-- Test with a valid OrderID but invalid ProductID
EXEC DeleteOrderDetails @OrderID = 1, @ProductID = 999;
