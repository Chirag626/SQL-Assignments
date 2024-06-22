CREATE DATABASE week3;

CREATE TABLE Students (ID INTEGER PRIMARY KEY, Name VARCHAR(50));
CREATE TABLE Friends ( ID INTEGER PRIMARY KEY,Friend_ID INTEGER,
    FOREIGN KEY (ID) REFERENCES Students(ID),
    FOREIGN KEY (Friend_ID) REFERENCES Students(ID));

CREATE TABLE Packages (ID INTEGER PRIMARY KEY,Salary FLOAT);

-- INSERT DATA INTO TABLES
INSERT INTO Students (ID, Name) VALUES 
(1, 'Ashlay'),(2, 'Samantha'),(3, 'Julia'),(4, 'Scarlet')

INSERT INTO Friends (ID, Friend_ID) VALUES (1, 2),(2, 3),(3, 4),(4, 1) 

INSERT INTO Packages (ID, Salary) VALUES (1, 15.20),(2, 10.06),(3, 11.55),(4, 12.12)

--UPDATE STUDENTS SET NAME = 'Ashley' WHERE  ID = 1;