-- Table for weighted average cost (Task 18)
CREATE TABLE EmployeeCosts (
    Month VARCHAR(10),
    BU VARCHAR(50),
    EmployeeID INT,
    Cost DECIMAL(10, 2)
);

INSERT INTO EmployeeCosts (Month, BU, EmployeeID, Cost) VALUES
('January', 'BU1', 1, 1000),
('January', 'BU1', 2, 1500),
('February', 'BU1', 1, 1100),
('February', 'BU1', 2, 1600),
('January', 'BU2', 3, 900),
('January', 'BU2', 4, 1400),
('February', 'BU2', 3, 950),
('February', 'BU2', 4, 1450);

-- Find Weighted average cost of employees month on month in a BU
SELECT Month, BU, SUM(Cost) / COUNT(EmployeeID) AS WeightedAvgCost
FROM EmployeeCosts
GROUP BY Month, BU;
