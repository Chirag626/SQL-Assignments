-- Test the Procedures

-- 1. Test inserting a customer
-- Customer 1
BEGIN TRY
    EXEC CreateCustomer 'Chirag', 'Chaturvedi', '2003-08-18', 'chirag2@gmail.com', '6568997551', 'H-235 Housing Board', 'Gwalior', 'Madhya Pradesh', '474011';
    PRINT 'Customer created successfully.';
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;


-- Customer 2
BEGIN TRY
    EXEC CreateCustomer 'Deeksha', 'Pandey', '2004-01-11', 'deeksha21@gmail.com', '9268487141', 'B1-22 Sector 82', 'Faridabad', 'Uttar Pradesh', '365844';
    PRINT 'Customer 2 created successfully.';
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;
Select * from Customers;



-- 2. Test opening an account for the customer
-- Open Account for customer 1
BEGIN TRY
    EXEC OpenAccount 3, 'Mutual Funds', 10000.00;
    PRINT 'Account opened successfully.';
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;

-- Open Accoutn for customer 2
BEGIN TRY
    EXEC OpenAccount 6, 'Fixed Deposit', 5000.00;
    PRINT 'Account opened successfully.';
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;

select*from Accounts; -- before balance 10000

-- 3. Test depositing money into the account
BEGIN TRY
    EXEC DepositMoney 1, 5000.00; 
    PRINT 'Money deposited successfully.';
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;

select*from Accounts; -- after deposit

-- 4. -- Test withdrawing money from the account
BEGIN TRY
    EXEC WithdrawMoney 1, 1000.00;
    PRINT 'Money withdrawn successfully.';
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;

select*from Accounts; -- after withdrawing

-- 5. Test transferring money to another account
BEGIN TRY
    EXEC TransferMoney 1, 2, 200.00; -- Assuming AccountID 2 exists
    PRINT 'Money transferred successfully.';
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;

-- 6. Test viewing transaction history
-- Customer 1
BEGIN TRY
    EXEC ViewTransactionHistory 1;
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;

-- Customer 2
BEGIN TRY
    EXEC ViewTransactionHistory 2;
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;
 
 select*from Transactions
