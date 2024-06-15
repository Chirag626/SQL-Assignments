CREATE PROCEDURE GetOrderDetails
    @OrderID INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM [Order Details] WHERE OrderID = @OrderID)
    BEGIN
        PRINT 'The OrderID ' + CAST(@OrderID AS VARCHAR) + ' does not exist';
        RETURN 1;
    END
    ELSE
    BEGIN
        SELECT * FROM [Order Details] WHERE OrderID = @OrderID;
    END
END;

-- Test with existing Orderid
EXEC GetOrderDetails @OrderID = 1;

-- Test with a non-existing OrderID
EXEC GetOrderDetails @OrderID = 4;



