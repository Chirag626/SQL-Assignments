-- Test Cases with opposite entries

-- 1. Try to insert a customer with an existing email
BEGIN TRY
    EXEC CreateCustomer 'Raju', 'Rastogi', '1980-01-01', 'chirag2@gmail.com', '8745498710', '586 TulsiNagar', 'Mumbai', 'Maharashtra', '897454';
    PRINT 'Customer created successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error creating customer: ' + ERROR_MESSAGE();
END CATCH;

SELECT*FROM Customers

-- 2. Try to open an account with a non-existent CustomerID
BEGIN TRY
    EXEC OpenAccount 999, 'Checking', 1000.00;
    PRINT 'Account opened successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error opening account Please Enter Valid CustomerId: ' + ERROR_MESSAGE();
END CATCH;


-- 3. Test Depositing Money to a Non-existing Account
BEGIN TRY
    EXEC DepositMoney 999, 500.00;
    PRINT 'Money deposited successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error depositing money Account Id does not exist...'  + ERROR_MESSAGE();
END CATCH;


-- 4.     Intentionally trying to withdraw more money than available to trigger an error
BEGIN TRY
    EXEC WithdrawMoney 1, 1000000.00; -- Assuming AccountID 1 exists but doesn't have enough balance
    PRINT 'Money withdrawn successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error withdrawing money : ' + ERROR_MESSAGE();
END CATCH;

-- 5. Test Transferring Money to a Non-existing Account
BEGIN TRY
    EXEC TransferMoney 1, 11, 200.00; -- Assuming FromAccountID 1 exists
    PRINT 'Money transferred successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error transferring money : Account Id Does not exist...' + ERROR_MESSAGE();
END CATCH;

-- 6. Test Viewing Transaction History for a Non-existing Account

BEGIN TRY
    EXEC ViewTransactionHistory 11; -- Assuming AccountID 11 does not exist
    PRINT 'Transaction history retrieved successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error viewing transaction history: ' + ERROR_MESSAGE();
END CATCH;

-- 7. Test Depositing Negative Amount
EXEC DepositMoney
    @AccountID = 1, 
    @Amount = -1000.00
PRINT 'Negative Amount Cannot Be Deposited';

Select*from Transactions

