DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Topic;
DROP TABLE IF EXISTS Edition;
DROP TABLE IF EXISTS Footage;
DROP TABLE IF EXISTS Journalist;
DROP TABLE IF EXISTS Address;


CREATE TABLE Address (
Street_Name VARCHAR(255),
Civic_Number VARCHAR(255),
City VARCHAR(255),
Zip_Code VARCHAR(9),
Country VARCHAR(255),
CONSTRAINT Address_pk PRIMARY KEY (Civic_Number)
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE Journalist (
CPR int(10),
First_Name VARCHAR(255),
Last_Name VARCHAR(255),
Address VARCHAR(255),
Telephone VARCHAR(16),
Email VARCHAR(255),
CONSTRAINT Journalist_pk PRIMARY KEY (CPR),
FOREIGN KEY (Address) REFERENCES Address(Civic_Number)
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE Footage (
Title VARCHAR(255),
Date int(8),
Duration int(10),
Journalist int(10),
CONSTRAINT Footage_pk PRIMARY KEY (Title),
CONSTRAINT Footage_Duration CHECK (Duration <= 180 AND Duration > 0),
FOREIGN KEY (Journalist) REFERENCES Journalist (CPR)
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE Edition (
Duration int(2),
Time int(8),
Journalist int(10),
CONSTRAINT Edition_pk PRIMARY KEY (Time),
CONSTRAINT Edition_Duration CHECK (Duration <= 1800 AND Duration > 0),
FOREIGN KEY (Journalist) REFERENCES Journalist (CPR)
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE Topic (
Title VARCHAR(255),
Description VARCHAR(255),
Journalist int(10),
Role VARCHAR(255),

CONSTRAINT Topic_pk PRIMARY KEY (Title),
FOREIGN KEY (Journalist) REFERENCES Journalist (CPR)
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE Item (
Time int(8),
Description VARCHAR(255),
Title VARCHAR(255),
Views int(255),
Edition int(8),
Footage VARCHAR(255),
CONSTRAINT Item PRIMARY KEY (Title),
FOREIGN KEY (Title) REFERENCES Topic(Title),
FOREIGN KEY (Edition) REFERENCES Edition(Time),
FOREIGN KEY (Footage) REFERENCES Footage(Title)
) DEFAULT CHARSET=utf8mb4;


INSERT INTO Address 
(Street_Name, Civic_Number, City, Zip_Code, Country)
VALUES 
("Nullvej", "132", "Kgs. Lyngby", "2800", "Denmark"),
("Nybrovej", "28", "Holte", "2840", "Denmark"),
("Østergaardsvej", "12", "Gentofte", "2820", "Denmark"),
("Hovedgade", "9", "Nærum", "2850", "Denmark"),
("Vestergaardsvej", "13", "Virum", "2830", "Denmark");

INSERT INTO Journalist
(CPR, First_Name, Last_Name, Address, Telephone, Email)
VALUES
(10103040, "Mark", "Miller", "132", "25743696", "Markmiller@hotmail.com"),
(30302125, "Olga", "Owens", "28", "23586423", "Olgaowens@coolmail.com"),
(10203344, "Lukas", "Laas", "12", "98543738", "Lukeydaone@ballmail.com"),
(20208981, "Pia", "Pabst", "9", "59784645", "Pabster01@gmail.com"),
(10204410, "Nick", "Nassar", "13", "56468643", "Detgoernass@outlook.com");

INSERT INTO Footage 
(Title, Date, Duration, Journalist)
VALUES
("Royal Wedding", 20040514, 174, 10103040),
("COVID-19 Restrictions", 20200311, 162, 30302125),
("Fatal Car Accident", 20211009, 108, 30302125),
("Pottery Exhibit", 20211110, 98, 10203344),
("Superliga Final Match", 20220529, 118, 20208981),
("SAS Strike", 20220718, 112, 30302125),
("Election Day", 20221101, 155, 10204410),
("Snowstorm", 20230306, 111, 10103040);