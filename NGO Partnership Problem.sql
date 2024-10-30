CREATE TABLE local_partnerships (
         partnership_id INT, 
         ngo_id INT, 
         ngo_name VARCHAR(100)
     );
     CREATE TABLE international_partnerships (
         partnership_id INT, 
         ngo_id INT, 
         ngo_name VARCHAR(100)
     );
     INSERT INTO local_partnerships VALUES 
         (1, 1101, 'Goonj'), 
         (2, 1102, 'Akanksha Foundation'), 
         (3, 1103, 'Teach For India');
     INSERT INTO international_partnerships VALUES 
         (1, 1101, 'Goonj'), 
         (2, 1104, 'CRY'), 
         (3, 1102, 'Akanksha Foundation');


SELECT * FROM LOCAL_PARTNERSHIPS

SELECT * FROM INTERNATIONAL_PARTNERSHIPS

/*
List all NGOs that have partnerships with both local government bodies and international organizations.
*/

SELECT L.NGO_NAME
FROM LOCAL_PARTNERSHIPS L
INNER JOIN INTERNATIONAL_PARTNERSHIPS I
ON L.NGO_ID=I.NGO_ID

