CREATE PROCEDURE ViewTransactionHistory
    @AccountID INT
AS
BEGIN
    BEGIN TRY
        -- Check if the AccountID exists
        IF NOT EXISTS (SELECT 1 FROM Accounts WHERE AccountID = @AccountID)
        BEGIN
            THROW 50001, 'Account ID does not exist.', 1;
        END

        -- If the AccountID exists, retrieve the transaction history
        SELECT TransactionID, TransactionDate, TransactionType, Amount
        FROM Transactions
        WHERE AccountID = @AccountID
        ORDER BY TransactionDate DESC;
    END TRY
    BEGIN CATCH
        -- Capture and print error message
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
