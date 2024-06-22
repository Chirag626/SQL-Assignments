-- Create a table to store prime numbers
CREATE TABLE PrimeNumbers (
    prime INT
);
--step 1
CREATE FUNCTION dbo.IsPrime (@num INT)
RETURNS BIT
AS
BEGIN
    DECLARE @isPrime BIT = 1;
    DECLARE @i INT = 2;

    IF @num < 2
        SET @isPrime = 0;
    ELSE
    BEGIN
        WHILE @i <= SQRT(@num)
        BEGIN
            IF @num % @i = 0
            BEGIN
                SET @isPrime = 0;
                BREAK;
            END
            SET @i = @i + 1;
        END
    END

    RETURN @isPrime;
END

-- step 2
DECLARE @num INT = 2;
WHILE @num <= 1000
BEGIN
    IF dbo.IsPrime(@num) = 1
        INSERT INTO PrimeNumbers (prime) VALUES (@num);
    SET @num = @num + 1;
END

--step 3
SELECT STUFF((
    SELECT ', ' + CAST(prime AS VARCHAR)
    FROM PrimeNumbers
    FOR XML PATH(''), TYPE
).value('.', 'NVARCHAR(MAX)'), 1, 1, '') AS PrimeNumbers;

