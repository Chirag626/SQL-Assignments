-- Create Procedure to Allot Subjects
CREATE PROCEDURE AllotSubjects
AS
BEGIN
    DECLARE @done INT = 0;
    DECLARE @studentId VARCHAR(10);
    DECLARE @subjectId VARCHAR(10);
    DECLARE @pref INT;
    DECLARE @remainingSeats INT;

    -- Cursor to select students ordered by GPA in descending order
    DECLARE student_cursor CURSOR FOR
        SELECT StudentId
        FROM StudentDetails
        ORDER BY GPA DESC;

    OPEN student_cursor;
    FETCH NEXT FROM student_cursor INTO @studentId;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Cursor to select student preferences
        DECLARE pref_cursor CURSOR FOR
            SELECT sp.StudentId, sp.SubjectId, sp.Preference, sd.RemainingSeats
            FROM StudentPreference sp
            JOIN SubjectDetails sd ON sp.SubjectId = sd.SubjectId
            WHERE sp.StudentId = @studentId
            ORDER BY sp.Preference;

        OPEN pref_cursor;
        FETCH NEXT FROM pref_cursor INTO @studentId, @subjectId, @pref, @remainingSeats;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            IF @remainingSeats > 0
            BEGIN
                INSERT INTO Allotments (SubjectId, StudentId) VALUES (@subjectId, @studentId);
                UPDATE SubjectDetails SET RemainingSeats = RemainingSeats - 1 WHERE SubjectId = @subjectId;
                BREAK;
            END
            FETCH NEXT FROM pref_cursor INTO @studentId, @subjectId, @pref, @remainingSeats;
        END

        CLOSE pref_cursor;
        DEALLOCATE pref_cursor;

        -- Check if student was not allotted any subject and insert into UnallotedStudents
        IF @@FETCH_STATUS != 0 AND NOT EXISTS (SELECT 1 FROM Allotments WHERE StudentId = @studentId)
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM UnallotedStudents WHERE StudentId = @studentId)
            BEGIN
                INSERT INTO UnallotedStudents (StudentId) VALUES (@studentId);
            END
        END

        FETCH NEXT FROM student_cursor INTO @studentId;
    END

    CLOSE student_cursor;
    DEALLOCATE student_cursor;
END;


-- Execute the procedure
EXEC AllotSubjects;

SELECT * FROM Allotments;
SELECT * FROM UnallotedStudents;