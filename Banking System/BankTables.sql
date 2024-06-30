-- Create database
CREATE DATABASE BankingSystem;
GO

USE BankingSystem;
GO

-- Create tables with indexes
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(15) UNIQUE,
    Address NVARCHAR(255),
    City NVARCHAR(50),
    State NVARCHAR(50),
    ZipCode NVARCHAR(10),
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    AccountType NVARCHAR(50),
    Balance DECIMAL(18,2) CHECK (Balance >= 0),
    CreatedAt DATETIME DEFAULT GETDATE(),
    INDEX IX_CustomerID (CustomerID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT FOREIGN KEY REFERENCES Accounts(AccountID),
    TransactionType NVARCHAR(50),
    Amount DECIMAL(18,2),
    TransactionDate DATETIME DEFAULT GETDATE(),
    Notes NVARCHAR(255),
    INDEX IX_AccountID (AccountID)
);
