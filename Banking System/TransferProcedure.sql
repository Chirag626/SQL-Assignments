CREATE PROCEDURE TransferMoney
    @FromAccountID INT,
    @ToAccountID INT,
    @Amount DECIMAL(18, 2)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DECLARE @FromBalance DECIMAL(18, 2);
        SELECT @FromBalance = Balance FROM Accounts WHERE AccountID = @FromAccountID;

        IF @FromBalance < @Amount
        BEGIN
            THROW 50000, 'Insufficient funds.', 1;
        END

        UPDATE Accounts
        SET Balance = Balance - @Amount
        WHERE AccountID = @FromAccountID;

        UPDATE Accounts
        SET Balance = Balance + @Amount
        WHERE AccountID = @ToAccountID;

        INSERT INTO Transactions (AccountID, TransactionType, Amount)
        VALUES (@FromAccountID, 'Transfer Out', @Amount),
               (@ToAccountID, 'Transfer In', @Amount);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
