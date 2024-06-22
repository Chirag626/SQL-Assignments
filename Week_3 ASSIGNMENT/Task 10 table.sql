-- Create the Company table
CREATE TABLE Company (
    company_code VARCHAR(50),
    founder VARCHAR(100)
);

-- Create the Lead_Manager table
CREATE TABLE Lead_Manager (
    lead_manager_code VARCHAR(50),
    company_code VARCHAR(50)
);

-- Create the Senior_Manager table
CREATE TABLE Senior_Manager (
    senior_manager_code VARCHAR(50),
    lead_manager_code VARCHAR(50),
    company_code VARCHAR(50)
);

-- Create the Manager table
CREATE TABLE Manager (
    manager_code VARCHAR(50),
    senior_manager_code VARCHAR(50),
    lead_manager_code VARCHAR(50),
    company_code VARCHAR(50)
);

-- Create the Employee table
CREATE TABLE Employee (
    employee_code VARCHAR(50),
    manager_code VARCHAR(50),
    senior_manager_code VARCHAR(50),
    lead_manager_code VARCHAR(50),
    company_code VARCHAR(50)
);


INSERT INTO Company (company_code, founder) VALUES
('C1','MONIKA'),
('C2','SAMANTHA')

INSERT INTO Lead_Manager (lead_manager_code,company_code) VALUES
('LM1','C1'),
('LM2','C2')

INSERT INTO Senior_Manager(senior_manager_code,lead_manager_code,company_code) VALUES
('SM1','LM1','C1'),
('SM2','LM1','C1'),
('SM3','LM2','C2')

INSERT INTO Manager(manager_code,senior_manager_code,lead_manager_code,company_code) VALUES
('M1','SM1','LM1','C1'),
('M2','SM3','LM2','C2'),
('M3','SM3','LM2','C2')

INSERT INTO Employee(employee_code,manager_code,senior_manager_code,lead_manager_code,company_code) VALUES
('E1','M1','SM1','LM1','C1'),
('E2','M1','SM1','LM1','C1'),
('E3','M2','SM3','LM2','C2'),
('E4','M3','SM3','LM2','C2')
