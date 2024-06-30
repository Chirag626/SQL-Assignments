CREATE PROCEDURE WithdrawMoney
    @AccountID INT,
    @Amount DECIMAL(18, 2)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        DECLARE @Balance DECIMAL(18, 2);
        SELECT @Balance = Balance FROM Accounts WHERE AccountID = @AccountID;

        IF @Balance < @Amount
        BEGIN
            THROW 50000, 'Insufficient funds.', 1;
        END

        UPDATE Accounts
        SET Balance = Balance - @Amount
        WHERE AccountID = @AccountID;

        INSERT INTO Transactions (AccountID, TransactionType, Amount)
        VALUES (@AccountID, 'Withdrawal', @Amount);

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
