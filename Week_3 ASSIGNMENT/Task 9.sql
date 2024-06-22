CREATE TABLE BINARY_TREE (N INT,P INT );

INSERT INTO BINARY_TREE (N, P) VALUES 
(1, 2),
(3,2),
(6,8),
(9,8),
(2,5),
(8,5),
(5,NULL);

--Query to Determine the Node Type
SELECT N,
    CASE 
        WHEN P IS NULL THEN 'Root'
        WHEN N NOT IN (SELECT P FROM BINARY_TREE WHERE P IS NOT NULL) THEN 'Leaf'
        ELSE 'Inner'
    END AS NodeType
FROM 
    BINARY_TREE ORDER BY N;
