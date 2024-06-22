-- Table for job family costs (Task 12)
CREATE TABLE JobFamilyCosts (
    JobFamily VARCHAR(50),
    Region VARCHAR(50),
    Cost DECIMAL(10, 2));

INSERT INTO JobFamilyCosts (JobFamily, Region, Cost) VALUES
('Engineering', 'India', 50000),
('Engineering', 'International', 80000),
('HR', 'India', 30000),
('HR', 'International', 40000),
('Marketing', 'India', 20000),
('Marketing', 'International', 30000);

--  Display ratio of cost of job family in percentage by India and international
SELECT JobFamily, Region, (Cost / (SELECT SUM(Cost) FROM JobFamilyCosts 
WHERE JobFamilyCosts.Region = JobFamilyCosts.Region)) * 100 AS CostPercentage 
FROM JobFamilyCosts;
