CREATE TABLE local_matches (
         match_id INT, 
         team_id INT, 
         team_name VARCHAR(100), 
         match_date DATE
     );
     CREATE TABLE international_matches (
         match_id INT, 
         team_id INT, 
         team_name VARCHAR(100), 
         match_date DATE
     );
     INSERT INTO local_matches VALUES 
         (1, 1, 'Chennai Super Kings', '2023-05-01'), 
         (2, 2, 'Mumbai Indians', '2023-06-10'), 
         (3, 1, 'Royal Challengers Bangalore', '2023-07-15');
     INSERT INTO international_matches VALUES 
         (1, 1, 'Chennai Super Kings', '2023-08-01'), 
         (2, 3, 'Delhi Capitals', '2023-09-05'), 
         (3, 2, 'Mumbai Indians', '2023-10-10');


SELECT * FROM LOCAL_MATCHES
SELECT * FROM INTERNATIONAL_MATCHES

/*
Identify all sports teams that have played matches against both local and international teams in the last year
*/

--Team Name

SELECT DISTINCT l.team_name
FROM local_matches l
JOIN international_matches i ON l.team_id = i.team_id
WHERE l.match_date >= CURRENT_DATE - INTERVAL '1 year'
  AND i.match_date >= CURRENT_DATE - INTERVAL '1 year';

