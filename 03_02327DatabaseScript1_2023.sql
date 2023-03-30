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
("Nullvejen", "13", "Farum", "4030", "Poland"),
("Broenernyvej", "8", "Forum", "2890", "Germany"),
("Testvejen", "1", "Stenløse", "3050", "Sweden"),
("Vandvejen", "3", "Vandland", "0000", "Havet"),
("Theroadestroad", "78", "Amstedam", "6666", "Holland");

INSERT INTO Journalist
(CPR, First_Name, Last_Name, Address, Telephone, Email)
VALUES
(10103043, "Mac", "Miller", "13", "25743696", "Returnofthemack@hotmail.com"),
(30302127, "Olga", "Owensen", "8", "23586423", "Olgaowens@coolmail.com"),
(10203341, "Lukas", "Lukas", "1", "98543738", "Lukeydaone@ballmail.com"),
(20208970, "Lobster", "Pabster", "3", "59784645", "Pabster01@gmail.com"),
(10204413, "Nasser", "Nassar", "78", "56468643", "Detgoernass@outlook.com");

INSERT INTO Footage 
(Title, Date, Duration, Journalist)
VALUES
("Normal Wedding", 20040517, 89, 10103043),
("COVID-19 Allowances", 20200316, 78, 30302127),
("Non Fatal Fatal Car Accident", 20211006, 87, 30302127),
("Most exciting Pottery Exhibit", 20211115, 67, 10203341),
("Superliga Final Matchbox", 20220522, 113, 20208970),
("SAS Nuclear Strike", 20220713, 117, 10103043),
("Election Days", 20221104, 152, 10204413),
("Big Snowstorm", 20230308, 110, 10203341);