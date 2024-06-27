-- create database Week4

-- Creating StudentDetails Table
CREATE TABLE StudentDetails (
    StudentId VARCHAR(10) PRIMARY KEY,
    StudentName VARCHAR(50),
    GPA DECIMAL(3, 1),
    Branch VARCHAR(10),
    Section VARCHAR(5)
);

-- Creating SubjectDetails Table
CREATE TABLE SubjectDetails (
    SubjectId VARCHAR(10) PRIMARY KEY,
    SubjectName VARCHAR(50),
    MaxSeats INT,
    RemainingSeats INT
);

-- Creating StudentPreference Table
CREATE TABLE StudentPreference (
    StudentId VARCHAR(10),
    SubjectId VARCHAR(10),
    Preference INT,
    FOREIGN KEY (StudentId) REFERENCES StudentDetails(StudentId),
    FOREIGN KEY (SubjectId) REFERENCES SubjectDetails(SubjectId),
    PRIMARY KEY (StudentId, SubjectId)
);

-- Creating Allotments Table
CREATE TABLE Allotments (
    SubjectId VARCHAR(10),
    StudentId VARCHAR(10),
    FOREIGN KEY (StudentId) REFERENCES StudentDetails(StudentId),
    FOREIGN KEY (SubjectId) REFERENCES SubjectDetails(SubjectId),
    PRIMARY KEY (SubjectId, StudentId)
);

-- Creating UnallotedStudents Table
CREATE TABLE UnallotedStudents (
    StudentId VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (StudentId) REFERENCES StudentDetails(StudentId)
);



-- Inserting data into StudentDetails Table
INSERT INTO StudentDetails (StudentId, StudentName, GPA, Branch, Section)
VALUES
('159103036', 'Mohit Agarwal', 8.9, 'CCE', 'A'),
('159103037', 'Rohit Agarwal', 5.2, 'CCE', 'A'),
('159103038', 'Shohit Garg', 7.1, 'CCE', 'B'),
('159103039', 'Mrinal Malhotra', 7.9, 'CCE', 'A'),
('159103040', 'Mehreet Singh', 5.6, 'CCE', 'A'),
('159103041', 'Arjun Tehlan', 9.2, 'CCE', 'B');

-- Inserting data into SubjectDetails Table
INSERT INTO SubjectDetails (SubjectId, SubjectName, MaxSeats, RemainingSeats)
VALUES
('PO1491', 'Basics of Political Science', 60, 2),
('PO1492', 'Basics of Accounting', 120, 119),
('PO1493', 'Basics of Financial Markets', 90, 90),
('PO1494', 'Eco philosophy', 60, 50),
('PO1495', 'Automotive Trends', 60, 60);

-- Inserting data into StudentPreference Table
INSERT INTO StudentPreference (StudentId, SubjectId, Preference)
VALUES
('159103036', 'PO1491', 1),
('159103036', 'PO1492', 2),
('159103036', 'PO1493', 3),
('159103036', 'PO1494', 4),
('159103036', 'PO1495', 5);
