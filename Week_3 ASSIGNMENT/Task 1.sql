use week3

CREATE TABLE Projects ( Task_ID INT,Start_Date DATE,End_Date DATE );

INSERT INTO Projects (Task_ID, Start_Date, End_Date) VALUES
(1, '2015-10-01', '2015-10-02'),
(2, '2015-10-02', '2015-10-03'),
(3, '2015-10-03', '2015-10-04'),
(4, '2015-10-13', '2015-10-14'),
(5, '2015-10-14', '2015-10-15'),
(6, '2015-10-28', '2015-10-29'),
(7, '2015-10-30', '2015-10-31');

-- Query to find project start and end dates and sort them as required
WITH ProjectGroups AS ( SELECT Task_ID,Start_Date,End_Date,
        DATEADD(day, -ROW_NUMBER() OVER (ORDER BY Start_Date), Start_Date) AS GroupID
    FROM Projects
),
ProjectRanges AS (SELECT MIN(Start_Date) AS Project_Start_Date,
       MAX(End_Date) AS Project_End_Date,
       DATEDIFF(day, MIN(Start_Date), 
	   MAX(End_Date)) + 1 AS Project_Duration FROM ProjectGroups GROUP BY GroupID)

SELECT Project_Start_Date,Project_End_Date FROM ProjectRanges
ORDER BY Project_Duration,Project_Start_Date;