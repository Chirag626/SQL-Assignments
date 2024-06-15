IF OBJECT_ID('Order Details', 'U') IS NOT NULL
    DROP TABLE [Order Details];

-- Create the Order Details table
CREATE TABLE [Order Details] (
    OrderID INT,
    ProductID INT,
    UnitPrice DECIMAL(10, 2),
    Quantity INT,
    Discount FLOAT,
    PRIMARY KEY (OrderID, ProductID)
);

-- Verify the table structure
SELECT * FROM [Order Details];
