CREATE PROCEDURE UpdateSubjectAllotment
AS
BEGIN
    DECLARE @StudentID VARCHAR(50);
    DECLARE @NewSubjectID VARCHAR(50);
    DECLARE @CurrentSubjectID VARCHAR(50);

    -- Get the student ID and requested subject from the SubjectRequest table
    SELECT TOP 1 @StudentID = StudentID, @NewSubjectID = SubjectID
    FROM SubjectRequest;

    -- Get the current valid subject for the student
    SELECT @CurrentSubjectID = SubjectID
    FROM SubjectAllotments
    WHERE StudentID = @StudentID AND Is_valid = 1;

    -- Check if the new subject is different from the current subject
    IF @NewSubjectID <> @CurrentSubjectID
    BEGIN
        -- Invalidate the current subject
        UPDATE SubjectAllotments
        SET Is_valid = 0
        WHERE StudentID = @StudentID AND SubjectID = @CurrentSubjectID;

        -- Check if the new subject already exists in SubjectAllotments
        IF EXISTS (SELECT 1 FROM SubjectAllotments WHERE StudentID = @StudentID AND SubjectID = @NewSubjectID)
        BEGIN
            -- Update the new subject to be valid
            UPDATE SubjectAllotments
            SET Is_valid = 1
            WHERE StudentID = @StudentID AND SubjectID = @NewSubjectID;
        END
        ELSE
        BEGIN
            -- Insert the new subject as valid
            INSERT INTO SubjectAllotments (StudentID, SubjectID, Is_valid)
            VALUES (@StudentID, @NewSubjectID, 1);
        END
    END
END;



EXEC UpdateSubjectAllotment;
SELECT * FROM SubjectAllotments;
SELECT * FROM SubjectRequest

-- Briefly explanation of This Stored prodecdure.
/* 
The stored procedure UpdateSubjectAllotments updates the SubjectAllotments table based on new requests in the SubjectRequest table. 
It iterates over each request, checking the current valid subject for the student.
If the current valid subject differs from the requested subject,it marks the current subject as invalid and sets the requested subject as valid. 
If the requested subject is not already in the SubjectAllotments table, it inserts a new record with the subject set to valid. 
This ensures that each student has only one valid subject at a time, reflecting their latest request.
*/
