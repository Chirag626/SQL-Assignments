WITH daily_submissions AS (
    SELECT 
        submission_date, 
        hacker_id, 
        COUNT(*) AS submissions_count
    FROM 
        Submissions
    GROUP BY 
        submission_date, 
        hacker_id
),
unique_hackers AS (
    SELECT 
        submission_date, 
        COUNT(DISTINCT hacker_id) AS unique_hackers_count
    FROM 
        Submissions
    GROUP BY 
        submission_date
),
max_submissions AS (
    SELECT 
        submission_date, 
        hacker_id,
        submissions_count,
        RANK() OVER (PARTITION BY submission_date ORDER BY submissions_count DESC, hacker_id ASC) AS rank
    FROM 
        daily_submissions
)
SELECT 
    u.submission_date, 
    u.unique_hackers_count, 
    m.hacker_id, 
    h.name
FROM 
    unique_hackers u
JOIN 
    max_submissions m ON u.submission_date = m.submission_date
JOIN 
    Hackers h ON m.hacker_id = h.hacker_id
WHERE 
    m.rank = 1
ORDER BY 
    u.submission_date;
