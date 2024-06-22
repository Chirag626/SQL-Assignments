-- Table for employee headcount (Task 14)

CREATE TABLE EmployeeHeadcount ( SubBand VARCHAR(10),Headcount INT);

INSERT INTO EmployeeHeadcount (SubBand, Headcount) VALUES
('A1', 50),
('A2', 40),
('B1', 30),
('B2', 20),
('C1', 10);

-- Show headcounts of sub band and percentage of headcount
SELECT SubBand, Headcount, 
       (Headcount * 100.0 / (SELECT SUM(Headcount) FROM EmployeeHeadcount)) AS HeadcountPercentage
FROM EmployeeHeadcount;
