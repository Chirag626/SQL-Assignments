-- Create Contests table
IF OBJECT_ID('Contests', 'U') IS NULL
BEGIN
    CREATE TABLE Contests (
        contest_id INT PRIMARY KEY,
        hacker_id INT,
        name VARCHAR(50)
    );
END;

-- Create Colleges table
IF OBJECT_ID('Colleges', 'U') IS NULL
BEGIN
    CREATE TABLE Colleges (
        college_id INT PRIMARY KEY,
        contest_id INT,
        FOREIGN KEY (contest_id) REFERENCES Contests(contest_id)
    );
END;

-- Create Challenges table
IF OBJECT_ID('Challenges', 'U') IS NULL
BEGIN
    CREATE TABLE Challenges (
        challenge_id INT PRIMARY KEY,
        college_id INT,
        FOREIGN KEY (college_id) REFERENCES Colleges(college_id)
    );
END;

-- Create View_Stats table
IF OBJECT_ID('View_Stats', 'U') IS NULL
BEGIN
    CREATE TABLE View_Stats (
        id INT IDENTITY PRIMARY KEY,
        challenge_id INT,
        total_views INT,
        total_unique_views INT,
        FOREIGN KEY (challenge_id) REFERENCES Challenges(challenge_id)
    );
END;



-- Insert data into Contests table
INSERT INTO Contests (contest_id, hacker_id, name)
VALUES 
(66406, 17973, 'Rose'),
(66556, 79153, 'Angela'),
(94828, 80275, 'Frank');

-- Insert data into Colleges table
INSERT INTO Colleges (college_id, contest_id)
VALUES 
(11219, 66406),
(32473, 66556),
(56685, 94828);

-- Insert data into Challenges table
INSERT INTO Challenges (challenge_id, college_id)
VALUES 
(18765, 11219),
(47127, 11219),
(60292, 32473),
(72974, 32473),
(75516, 56685);

-- Insert data into View_Stats table
INSERT INTO View_Stats (challenge_id, total_views, total_unique_views)
VALUES 
(47127, 26, 19),
(47127, 15, 14),
(18765, 43, 10),
(18765, 72, 13),
(75516, 35, 17),
(60292, 11, 10),
(72974, 41, 15),
(75516, 75, 11);

-- Insert data into Submission_Stats table
INSERT INTO Submission_Stats (challenge_id, total_submissions, total_accepted_submissions)
VALUES 
(75516, 34, 12),
(47127, 27, 10),
(47127, 56, 18),
(75516, 74, 12),
(75516, 83, 8),
(72974, 68, 24),
(72974, 82, 14),
(47127, 28, 11);

-- Create Submission_Stats table
IF OBJECT_ID('Submission_Stats', 'U') IS NULL
BEGIN
    CREATE TABLE Submission_Stats (
        id INT IDENTITY PRIMARY KEY,
        challenge_id INT,
        total_submissions INT,
        total_accepted_submissions INT,
        FOREIGN KEY (challenge_id) REFERENCES Challenges(challenge_id)
    );
END;
