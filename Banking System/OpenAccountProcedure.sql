CREATE PROCEDURE OpenAccount
    @CustomerID INT,
    @AccountType NVARCHAR(50),
    @InitialDeposit DECIMAL(18, 2)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Accounts (CustomerID, AccountType, Balance)
        VALUES (@CustomerID, @AccountType, @InitialDeposit);
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
