CREATE TABLE SubjectAllotments (
    StudentID VARCHAR(50),
    SubjectID VARCHAR(50),
    Is_valid BIT);

CREATE TABLE SubjectRequest (
    StudentID VARCHAR(50),
    SubjectID VARCHAR(50));



INSERT INTO SubjectAllotments (StudentID, SubjectID, Is_valid)
VALUES ('159103036', 'PO1491', 1),
       ('159103036', 'PO1492', 0),
       ('159103036', 'PO1493', 0),
       ('159103036', 'PO1494', 0),
       ('159103036', 'PO1495', 0);

INSERT INTO SubjectRequest (StudentID, SubjectID) VALUES ('159103036', 'PO1496');
