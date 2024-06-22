-- Table for swapping columns (Task 16)
CREATE TABLE SwapColumns ( ColumnA INT, ColumnB INT);

INSERT INTO SwapColumns (ColumnA, ColumnB) VALUES
(1, 2),
(3, 4),
(5, 6);

-- Swap Column Values using UPDATE statement
UPDATE SwapColumns
SET ColumnA = ColumnB,
    ColumnB = ColumnA
WHERE ColumnA != ColumnB;

-- Verify the swap by selecting data
SELECT * FROM SwapColumns;

