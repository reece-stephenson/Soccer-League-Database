USE SoccerLeague

INSERT INTO dbo.countries
(name)
VALUES 
('England'),
('South Africa'),
('Spain'),
('Portugal'),
('Greece'),
('Belgium'),
('France'),
('Senegal'),
('South Korea'),
('Brazil'),
('Argentina'),
('Mexico'),
('Wales'),
('Ghana'),
('Japan'),
('Russia'),
('Egypt')
GO

INSERT INTO dbo.stadiums
(stadiumName,capacity,countryID)
VALUES
('Community Centre',75000,2),
('Spectrum Arena',62000,2),
('Pure Heart Park',34000,2),
('Stasis Field',11000,2),
('Serenity Ring',65000,2),
('Wish Stadium',87000,2),
('Cinder Ground',56000,2),
('Bamboo Centre',43000,2),
('Moonlight Park',37000,2),
('Mirage Stadium',25000,2),
('Dominion Ring',22000,2),
('Chimera Arena',69000,2),
('Pride Centre',73000,2),
('Timeless Field',81000,2),
('Blue Moon Ground',6000,2),
('Discovery Stadium',8000,2),
('Griffon Park',9000,2),
('Crown Field',4000,2),
('Founders Ground',18000,2),
('Arrowhead Centre',28000,2)
GO

INSERT INTO dbo.soccerTeams
(teamName,stadiumID,transferBudget)
VALUES
('Joburg Jackals FC',1,450000000),
('Cape Cats FC',2,475000000),
('Soweto Sharks FC',3,425000000),
('Durban Dogs FC',5,430000000),
('Kimberly Kangaroos FC',6,250000000),
('Pretoria Panthers FC',7,450000000),
('Polokwane Pandas FC',9,370000000),
('Bloemfontein Boks FC',8,320000000),
('Tembisa Tigers FC',10,300000000),
('Rustenburg Rhinos FC',11,120000000),
('Potchefstroom Porcupines FC',12,160000000),
('Makhanda Mooses FC',13,240000000),
('Midrand Mountain Goats FC',14,290000000),
('Sandton Swallows FC',15,300000000),
('Rosebank Rabbits FC',16,280000000),
('Randburg Rams FC',17,170000000),
('Edenvale Elephants FC',18,160000000),
('Grahamstown Giraffes FC',19,80000000),
('Windsor Whales FC',20,70000000),
('Lenasia Lions FC',4,20000000)
GO

INSERT INTO dbo.persons
(firstName,surname,dateOfBirth,representingCountry,teamID)
VALUES
('Antonio', 'Miller','1999-12-13',16,1), --Player
('Justin' ,'Regnard','1991-11-13',15,1), --Player
('Odorico' ,'Sciarrino','1980-02-18',12,1), --Player
('Brandon' ,'Atkinson','2001-03-16',1,1), --Player
('Rubiano' ,'Maro','1989-05-22',12,1), --Player
('Langelihle', 'Ntshangase','1992-06-30',13,1), --Player
('Hugo' ,'Bourdon','1994-09-05',7,1), --Player
('Ferruccio' ,'Senna','1973-11-06',1,1), --Player
('Brodie' ,'Wright','1983-10-02',6,1), --Player
('Marco' ,'Ursini','1985-10-01',4,1), --Player
('Mongameli' ,'Mthombeni','1989-08-09',3,1), --Player
('John' ,'Wayne','1978-08-12',6,1), --Coach
('Dylan' ,'Dos Santos','1982-01-17',4,1), --Coach
('Daniel' ,'Chapple','1979-01-18',9,1), --Coach
('Gary' ,'Rodrigues','1989-06-23',8,1), --Manager
('Mark' ,'Smith','1963-04-29',11,1) --Owner
GO

INSERT INTO dbo.soccerPlayers
(personID,positionType,number,transferValue,height,preferredFoot)
VALUES
(1,'Goalkeeper',1,300000,195,'Left'),
(2,'Defender',5,823000,190,'Right'),
(3,'Defender',3,129000,182,'Right'),
(4,'Defender',4,4560000,181,'Left'),
(5,'Defender',2,330000,193,'Right'),
(6,'Midfielder',7,220000,178,'Left'),
(7,'Midfielder',11,650000,179,'Left'),
(8,'Midfielder',8,800000,174,'Right'),
(9,'Midfielder',6,500000,176,'Right'),
(10,'Forward',10,4500000,183,'Right'),
(11,'Forward',9,7000000,189,'Right')
GO

INSERT INTO dbo.soccerCoaches
(personID,coachType,yearsExperience)
VALUES
(12,'Attacker',5),
(13,'Midfielder',8),
(14,'Defender',3)
GO

INSERT INTO dbo.soccerManagers
(personID,trophiesWon,matchesManaged,pointsPerMatch)
VALUES
(15,3,428,1.9)
GO

INSERT INTO dbo.soccerOwners
(personID,netWorth)
VALUES (16,1000000000)
GO

INSERT INTO dbo.soccerMatches
(stadiumID,date)
VALUES
(1,'2023-01-03'),
(2,'2023-01-03'),
(3,'2023-01-03'),
(4,'2023-01-03'),
(5,'2023-01-03'),
(6,'2023-01-04'),
(7,'2023-01-04'),
(8,'2023-01-04'),
(9,'2023-01-04'),
(10,'2023-01-04')
GO

INSERT INTO dbo.teamMatches
(matchID,teamID,result)
VALUES
(1,2,'Win'),
(1,8,'Loss'),
(2,12,'Draw'),
(2,19,'Draw'),
(3,17,'Loss'),
(3,4,'Win'),
(4,3,'Win'),
(4,7,'Loss'),
(5,13,'Draw'),
(5,18,'Draw'),
(6,20,'Loss'),
(6,1,'Win'),
(7,5,'Win'),
(7,6,'Loss'),
(8,9,'Loss'),
(8,10,'Win'),
(9,14,'Win'),
(9,11,'Loss'),
(10,15,'Draw'),
(10,16,'Draw')
GO