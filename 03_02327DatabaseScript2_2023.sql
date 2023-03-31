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