-- Step 1: Create the Tables

CREATE TABLE table_old ( id INT PRIMARY KEY, data VARCHAR(100) );

CREATE TABLE table_new (id INT PRIMARY KEY,data VARCHAR(100) );

-- Step 2: Insert Sample Data into table_new
INSERT INTO table_new (id, data) VALUES
(1, 'new_data_1'),
(2, 'new_data_2'),
(3, 'new_data_3');

-- Step 3: Copy Data from table_new to table_old
INSERT INTO table_old (id, data)
SELECT id, data
FROM table_new;


-- Check the data is copied or not.	
SELECT * FROM table_new

SELECT * FROM table_old
 -- IT WORKS FINE AND DATA COPIED SUCCESSFULLY.