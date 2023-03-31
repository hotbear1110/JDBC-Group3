DELETE from Journalist WHERE Address="1";
UPDATE Journalist
SET Email = "Testmail@gmail.com"
WHERE First_Name = "Olga";
INSERT Address VALUES("Vejen", "18", "Byen", "6040", "Fairytaleland");
INSERT Journalist VALUES(90102037, 'Muc', 'Milla', '18', '64564345', 'mosttest@hotmail.com');

SELECT First_Name 
FROM Journalist
GROUP BY First_Name;

SELECT journalist.First_name, footage.Title FROM footage INNER JOIN journalist ON footage.Journalist = journalist.CPR;


SELECT Street_Name, Zip_Code
FROM Address;

SELECT Duration, Title FROM footage;

SELECT title FROM item AS i, edition AS e WHERE e.Time = i.Edition AND e.Duration >= 1200;

DROP PROCEDURE IF EXISTS Insert_Journalist;

CREATE PROCEDURE Insert_Journalist(IN CPR INT(10), IN First_Name VARCHAR(255), IN Last_Name VARCHAR(255), IN email VARCHAR(255), address VARCHAR(255))

INSERT INTO journalist(CPR, First_Name, Last_Name, email, address) VALUES (CPR, First_Name, Last_name, email, address);

CALL Insert_Journalist("1104761354", "Per", "Hansen", "per1976@gmail.com", "8");

DROP FUNCTION IF EXISTS Get_CPR;

DELIMITER //

CREATE FUNCTION Get_CPR(vFirst_Name VARCHAR(255))

RETURNS int

BEGIN

DECLARE vCPR INT;

SELECT CPR INTO vCPR FROM journalist

WHERE First_Name = vFirst_Name;

RETURN vCPR;

END//

DELIMITER ;


SELECT Get_CPR("Lobster");