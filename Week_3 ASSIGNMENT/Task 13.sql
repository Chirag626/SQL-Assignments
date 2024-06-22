-- Table for BU costs and revenue (Task 13)
CREATE TABLE BUFinance (
    Month VARCHAR(10),
    BU VARCHAR(50),
    Cost DECIMAL(10, 2),
    Revenue DECIMAL(10, 2) );

INSERT INTO BUFinance (Month, BU, Cost, Revenue) VALUES
('January', 'BU1', 100000, 150000),
('February', 'BU1', 110000, 160000),
('January', 'BU2', 90000, 140000),
('February', 'BU2', 95000, 145000);

--  Find ratio of cost and revenue of a BU month on month
SELECT Month, BU, (Cost / Revenue) AS CostRevenueRatio
FROM BUFinance;
