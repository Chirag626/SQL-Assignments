SELECT 
    c.contest_id,
    c.hacker_id,
    c.name,
    COALESCE(SUM(ss.total_submissions), 0) AS total_submissions,
    COALESCE(SUM(ss.total_accepted_submissions), 0) AS total_accepted_submissions,
    COALESCE(SUM(vs.total_views), 0) AS total_views,
    COALESCE(SUM(vs.total_unique_views), 0) AS total_unique_views
FROM Contests c
LEFT JOIN Colleges co ON c.contest_id = co.contest_id
LEFT JOIN Challenges ch ON co.college_id = ch.college_id
LEFT JOIN View_Stats vs ON ch.challenge_id = vs.challenge_id
LEFT JOIN Submission_Stats ss ON ch.challenge_id = ss.challenge_id
GROUP BY 
    c.contest_id,
    c.hacker_id,
    c.name
HAVING 
    COALESCE(SUM(ss.total_submissions), 0) > 0 OR
    COALESCE(SUM(ss.total_accepted_submissions), 0) > 0 OR
    COALESCE(SUM(vs.total_views), 0) > 0 OR
    COALESCE(SUM(vs.total_unique_views), 0) > 0
ORDER BY c.contest_id;
