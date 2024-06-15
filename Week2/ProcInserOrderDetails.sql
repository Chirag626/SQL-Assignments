CREATE PROCEDURE InsertOrderDetails
    @OrderID INT,
    @ProductID INT,
    @UnitPrice DECIMAL(10, 2) = NULL,
    @Quantity INT,
    @Discount FLOAT = NULL
AS
BEGIN
    DECLARE @CurrentStock INT;
    DECLARE @ReorderLevel INT;
    DECLARE @ProductUnitPrice DECIMAL(10, 2);

    -- Retrieve current stock, reorder level, and product unit price
    SELECT @CurrentStock = UnitsInStock, @ReorderLevel = ReorderLevel, @ProductUnitPrice = UnitPrice
    FROM Product
    WHERE ProductID = @ProductID;

    -- Use product's UnitPrice if not provided
    SET @UnitPrice = ISNULL(@UnitPrice, @ProductUnitPrice);
    
    -- Set default discount to 0 if not provided
    SET @Discount = ISNULL(@Discount, 0);

    -- Check if there is enough stock
    IF @CurrentStock < @Quantity
    BEGIN
        PRINT 'Not enough stock to place the order. Please try again.';
        RETURN;
    END

    -- Insert the order details
    INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
    VALUES (@OrderID, @ProductID, @UnitPrice, @Quantity, @Discount);

    -- Check if the insert was successful
    IF @@ROWCOUNT = 0
    BEGIN
        PRINT 'Failed to place the order. Please try again.';
        RETURN;
    END

    -- Update the stock
    UPDATE Product
    SET UnitsInStock = UnitsInStock - @Quantity
    WHERE ProductID = @ProductID;

    -- Check if stock falls below reorder level
    IF @CurrentStock - @Quantity < @ReorderLevel
    BEGIN
        PRINT 'Warning: The quantity in stock for ProductID ' + CAST(@ProductID AS VARCHAR) + ' has dropped below its reorder level.';
    END
END;
