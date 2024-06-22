-- In this code we already created related tables in previous tasks .

SELECT s.Name
FROM Friends f
JOIN Students s ON f.ID = s.ID
JOIN Packages p1 ON s.ID = p1.ID
JOIN Packages p2 ON f.Friend_ID = p2.ID
WHERE p2.Salary > p1.Salary
ORDER BY p2.Salary;
