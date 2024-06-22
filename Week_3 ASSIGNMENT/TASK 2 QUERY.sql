WITH Student_Salaries AS (
    SELECT 
        s.ID AS Student_ID,
        s.Name AS Student_Name,
        p.Salary AS Student_Salary FROM Students s JOIN Packages p ON s.ID = p.ID),

Friend_Salaries AS (
    SELECT 
        f.ID AS Student_ID,
        f.Friend_ID AS Best_Friend_ID,
        p.Salary AS Best_Friend_Salary
    FROM Friends f JOIN Packages p ON f.Friend_ID = p.ID)

SELECT ss.Student_Name FROM Student_Salaries ss 
JOIN Friend_Salaries fs ON ss.Student_ID = fs.Student_ID
WHERE fs.Best_Friend_Salary > ss.Student_Salary ORDER BY fs.Best_Friend_Salary ASC;
