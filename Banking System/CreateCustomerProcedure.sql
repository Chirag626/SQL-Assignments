-- Creating Customer
CREATE PROCEDURE CreateCustomer
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @DateOfBirth DATE,
    @Email NVARCHAR(100),
    @Phone NVARCHAR(15),
    @Address NVARCHAR(255),
    @City NVARCHAR(50),
    @State NVARCHAR(50),
    @ZipCode NVARCHAR(10)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Customers (FirstName, LastName, DateOfBirth, Email, Phone, Address, City, State, ZipCode)
        VALUES (@FirstName, @LastName, @DateOfBirth, @Email, @Phone, @Address, @City, @State, @ZipCode);
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
