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
-- Joburg Jackals FC
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
('Palesa' ,'Powers','1983-02-18',14,1), --Coach
('Gary' ,'Rodrigues','1989-06-23',8,1), --Manager
('Mark' ,'Smith','1963-04-29',11,1), --Owner

-- Cape Cats FC
('Ciar', 'Delgado','1998-11-20',8,2),
('Mueez', 'Mcconnell','1985-09-17',9,2),
('Erdehan', 'Camacho','1973-06-15',6,2),
('Dilan', 'Wallace','1962-08-06',5,2),
('Andrejs', 'Guzman','1996-10-31',11,2),
('Davie', 'Tyson','1977-09-27',2,2),
('Emile', 'Solis','1976-01-03',14,2),
('Mickey', 'Haney','1991-05-13',9,2),
('Alber', 'Beard','1974-05-20',16,2),
('Joojo', 'Saunders','1961-06-24',4,2),
('Monty', 'Henry','1973-08-11',6,2),
('Kit', 'Richardson','1982-05-09',16,2),
('Keavan', 'Stuart','1996-08-08',3,2),
('Mustapha', 'Whitehead','1968-06-25',4,2),
('Kelvan', 'Beck','1988-10-11',8,2),
('Kaileb', 'Boyer','1986-06-23',9,2),
('Koushik', 'Austin','1997-01-25',9,2),

-- Soweto Sharks FC
('Jaskaran', 'Gallagher','1983-04-28',12,3),
('Matteo', 'Browning','1995-10-13',4,3),
('Abdul-Majeed', 'Miranda','1998-05-12',7,3),
('Mohamed', 'Rivera','1994-03-26',4,3),
('Brett', 'Lucas','1963-10-02',6,3),
('Avraham', 'Joyner','1963-12-02',8,3),
('Kean', 'Holland','1994-11-08',5,3),
('Francis', 'Lamb','1996-09-01',14,3),
('Khizar', 'Knox','1965-06-18',15,3),
('Brady', 'Obrien','1969-11-11',10,3),
('Munro', 'Mcfarland','1964-12-27',1,3),
('Abdirahman', 'Chambers','1978-07-28',4,3),
('Bully', 'Phillips','1968-06-18',2,3),
('Ashtyn', 'Nixon','1982-06-19',5,3),
('Dylan', 'Ewing','1996-12-24',8,3),
('Keiron', 'Long','1977-08-22',6,3),
('Ksawery', 'Blankenship','1979-12-15',8,3),

-- Durban Dogs FC
('Aydan', 'Espinoza','1965-12-04',8,4),
('Dimitri', 'Carpenter','1966-12-03',3,4),
('Eroni', 'Koch','1963-08-21',2,4),
('Conal', 'Sutton','1991-11-07',7,4),
('Arturo', 'Gallegos','1974-06-29',10,4),
('Musa', 'Mosley','1961-01-08',5,4),
('Gus', 'Decker','1992-01-12',5,4),
('Lenyn', 'Stafford','1994-10-03',9,4),
('Hosea', 'Guzman','1982-12-04',13,4),
('Farhan', 'Mcconnell','1992-05-12',11,4),
('Coban', 'Obrien','1963-07-04',9,4),
('Kamran', 'Odom','1967-03-31',1,4),
('Dominic', 'Evans','1988-09-07',6,4),
('Nico', 'Mcfadden','1973-06-28',16,4),
('Daud', 'Gomez','1962-07-12',13,4),
('Limo', 'Strong','1991-09-26',2,4),
('Conlan', 'Saunders','1984-12-07',9,4),

-- Kimberly Kangaroos FC
('Douglas', 'Ford','1988-10-20',11,5),
('Leylann', 'Smith','1986-08-01',2,5),
('Kienan', 'Baxter','1982-03-27',12,5),
('Hosea', 'Morin','1963-05-01',2,5),
('Mehraz', 'Clarke','1969-03-02',9,5),
('Eugene', 'Mclean','1971-02-13',2,5),
('Kiefer', 'Roberts','1975-06-07',15,5),
('Breandan', 'Duke','1974-08-28',15,5),
('Jun', 'Cantrell','1964-10-09',2,5),
('Louie', 'Anderson','1997-05-31',8,5),
('Abdur', 'Marquez','1998-07-22',9,5),
('Bradley', 'Bruce','1988-06-28',16,5),
('Niraj', 'Baldwin','1961-07-17',2,5),
('Karamvir', 'Serrano','1995-12-06',9,5),
('Micheal', 'Oneil','1972-01-23',7,5),
('Lasse', 'Hodge','1967-09-15',11,5),
('Kaidan', 'Valencia','1978-11-10',1,5),

-- Pretoria Panthers FC
('Abdalroof', 'Baxter','1967-11-10',4,6),
('Kinsey', 'Davenport','1982-10-26',4,6),
('Iagan', 'Howell','1994-03-24',6,6),
('Mikhail', 'Clay','1961-08-30',2,6),
('Cobain', 'English','1965-06-05',7,6),
('Diarmaid', 'Heath','1969-12-28',6,6),
('Ola-Oluwa', 'Brown','1972-06-29',6,6),
('Madox', 'Branch','1961-09-02',16,6),
('Jayden-James', 'Gonzales','1982-06-30',5,6),
('Kiaran', 'Kidd','1974-09-20',16,6),
('Kyral', 'Roy','1979-11-05',1,6),
('Hagun', 'Irwin','1968-09-16',16,6),
('Aden', 'Sawyer','1966-11-30',15,6),
('Kiyonari', 'Whitehead','1985-02-04',14,6),
('Leyton', 'Green','1974-02-02',2,6),
('Milo', 'Rollins','1972-01-29',12,6),
('Logan-Rhys', 'Sweeney','1973-12-15',2,6),

-- Polokwane Pandas FC
('Athon', 'Holland','1978-11-27',12,7),
('Blaike', 'Cantrell','1998-01-14',10,7),
('Guang', 'Fuentes','1981-05-11',5,7),
('Karsyn', 'Sanchez','1964-03-28',12,7),
('Millar', 'Goff','1991-04-26',1,7),
('Garrett', 'Luna','1967-06-26',2,7),
('Ardal', 'Elliott','1993-01-20',15,7),
('Maros', 'Giles','1985-02-20',15,7),
('Bradlie', 'Medina','1976-04-13',2,7),
('Corey-Jay', 'Livingston','1987-08-04',8,7),
('AJ', 'Garcia','1988-05-08',13,7),
('Ege', 'Henson','1984-06-04',9,7),
('Kaywan', 'Hicks','1979-06-29',13,7),
('John-Michael', 'Sykes','1995-05-25',12,7),
('Hamid', 'Summers','1976-04-09',9,7),
('Campbell', 'Moon','1968-11-16',14,7),
('Mayeul', 'Richmond','1967-04-05',11,7),

-- Bloemfontein Boks FC
('Herbert', 'Trevino','1961-04-12',5,8),
('Josan', 'Copeland','1991-07-03',10,8),
('Kole', 'Bird','1967-05-03',3,8),
('Julien', 'Blankenship','1961-01-20',5,8),
('Noel', 'Fulton','1961-04-05',6,8),
('Maxwell', 'Gonzalez','1961-12-05',15,8),
('Mylo', 'Simon','1984-08-23',6,8),
('Adrien', 'Underwood','1989-06-02',12,8),
('Mackenzy', 'Holloway','1995-06-05',16,8),
('Hari', 'Pugh','1963-02-15',16,8),
('Gurveer', 'Lara','1991-07-18',17,8),
('Luke', 'Valentine','1986-07-14',4,8),
('Mika', 'Mccall','1978-01-31',11,8),
('Alexx', 'Montoya','1975-12-28',13,8),
('Haider', 'Phillips','1986-11-09',14,8),
('Gallagher', 'Wise','1989-08-14',6,8),
('Kier', 'Tucker','1997-07-29',8,8),

-- Tembisa Tigers FC
('Albert', 'Pace','1994-06-19',13,9),
('Callahan', 'Hoffman','1986-10-16',15,9),
('Jeronimo', 'Wise','1999-02-07',11,9),
('Nairn', 'Acevedo','1975-05-09',11,9),
('Girius', 'Aguirre','1979-01-06',8,9),
('Farhan', 'Ingram','1992-06-01',9,9),
('Michael', 'Mathis','1983-07-15',15,9),
('Mitchel', 'Pierce','1984-07-19',13,9),
('Donnacha', 'Hudson','1989-08-22',4,9),
('Isaa', 'Bernard','1965-07-17',4,9),
('Fares', 'Lopez','1986-06-08',6,9),
('Dominic', 'Barr','1967-08-08',8,9),
('Ikemsinachukwu', 'Tanner','1986-11-28',17,9),
('Ayaan', 'York','1963-08-26',6,9),
('Farhan', 'Harrington','1975-01-16',14,9),
('Kacper', 'Ferguson','1971-05-03',6,9),
('Iman', 'Gentry','1996-05-11',17,9),

-- Rustenburg Rhinos FC
('Aiden-Jack', 'Roberson','1965-05-12',13,10),
('Moad', 'Berry','1982-07-06',12,10),
('Mirza', 'Frazier','1962-10-30',12,10),
('Karl', 'Snow','1964-08-17',3,10),
('Clifford', 'Wallace','1983-05-22',6,10),
('Jimmy', 'Riley','1983-09-09',11,10),
('Marlin', 'Charles','1966-01-14',6,10),
('Kris', 'Alexander','1982-06-01',17,10),
('Cayden', 'Yates','1989-11-23',17,10),
('Niro', 'Warren','1972-10-16',6,10),
('Ardeshir', 'Fowler','1995-04-19',9,10),
('Hussnan', 'Sanford','1973-03-31',17,10),
('Corrie', 'Nunez','1981-05-30',12,10),
('Kadyn', 'Alvarado','1964-11-28',14,10),
('Aleksandar', 'Anthony','1961-02-13',3,10),
('Callun', 'Goodwin','1971-06-24',12,10),
('Krishan', 'Stout','1971-12-30',10,10),

-- Potchefstroom Porcupines FC
('Eason', 'Gross','1995-06-28',11,11),
('Anis', 'Chandler','1973-10-22',14,11),
('Kian-James', 'Clarke','1969-05-18',7,11),
('Baye', 'Griffin','1975-07-15',1,11),
('Ashlee-jay', 'Gilmore','1993-07-07',14,11),
('Aiman', 'Richmond','1999-07-19',10,11),
('Dregan', 'Tate','1989-09-03',1,11),
('Dre', 'Morrison','1985-04-21',11,11),
('Bradly', 'Wilcox','1996-12-06',1,11),
('Damien', 'Huff','1997-04-10',12,11),
('Johnnie', 'Sloan','1999-08-16',4,11),
('Ahoua', 'Scott','1987-02-23',7,11),
('Drew', 'Moore','1962-06-01',2,11),
('Nicol', 'Dennis','1996-07-18',12,11),
('Bailey', 'Everett','1979-10-13',6,11),
('Emile', 'Whitaker','1978-12-07',2,11),
('Chang-Ha', 'Browning','1983-08-28',14,11),

-- Makhanda Mooses FC
('Neil', 'Noel','1987-01-11',1,12),
('Nial', 'Aguilar','1997-06-12',9,12),
('Crombie', 'Castaneda','1978-12-25',5,12),
('Eoghan', 'Dillon','1975-03-20',6,12),
('Anndra', 'Hutchinson','1977-12-27',6,12),
('Niro', 'Orr','1969-06-16',6,12),
('Jorryn', 'Berg','1992-11-01',1,12),
('Kiran', 'Schroeder','1978-02-16',11,12),
('Dayem', 'Pitts','1969-05-15',2,12),
('Nevan', 'Chang','1963-05-29',6,12),
('Karamvir', 'Mcfadden','1994-07-09',16,12),
('Christie', 'James','1968-08-22',17,12),
('Efan', 'Moody','1997-02-07',15,12),
('Caedyn', 'Beach','1969-09-26',16,12),
('Banan', 'Slater','1965-07-02',4,12),
('Lockey', 'Wilson','1999-09-17',13,12),
('Obieluem', 'Skinner','1979-11-24',13,12),

-- Midrand Mountain Goats FC
('Mitchel', 'Boyer','1987-12-11',13,13),
('Bailey', 'Jarvis','1964-09-18',10,13),
('Daithi', 'Gomez','1985-06-28',12,13),
('Jay-Jay', 'Carey','1985-08-19',5,13),
('Gordon', 'Meyers','1962-03-14',5,13),
('Alekzander', 'Harrington','1997-06-23',1,13),
('Aleksander', 'Bowman','1969-04-10',4,13),
('Campbel', 'Sherman','1986-07-25',13,13),
('Khizar', 'Hughes','1985-10-03',13,13),
('Karl', 'Hanson','1974-08-12',1,13),
('Max', 'Snyder','1962-02-17',17,13),
('Arran', 'Wynn','1984-07-17',9,13),
('Coupar', 'Byrd','1968-10-09',2,13),
('Axel', 'Castro','1976-05-18',8,13),
('Eljay', 'Ellis','1978-08-31',8,13),
('Elisau', 'Hewitt','1993-11-11',17,13),
('Kyden', 'Mcintosh','1988-10-27',8,13),

-- Sandton Swallows FC
('Geoff', 'Rosa','1986-10-21',1,14),
('Kyrillos', 'Irwin','1989-02-05',8,14),
('Keith', 'Barnes','1993-09-25',5,14),
('Deano', 'Mckenzie','1997-08-04',17,14),
('Dilraj', 'Buchanan','1974-09-07',1,14),
('Gerard', 'Guzman','1995-06-20',12,14),
('Ashton-Lloyd', 'Washington','1985-06-15',10,14),
('Maneet', 'Spears','1972-09-23',1,14),
('Kean', 'Little','1998-09-06',5,14),
('Derrin', 'Ellison','1972-07-23',12,14),
('Jamey', 'Cameron','1989-05-05',2,14),
('Ayan', 'Robinson','1975-12-10',9,14),
('Meko', 'Chase','1961-07-30',16,14),
('Emmanuel', 'Kim','1987-03-10',12,14),
('Celik', 'Rose','1997-11-23',5,14),
('Khizer', 'Pennington','1965-03-21',15,14),
('Connolly', 'Gray','1983-02-15',11,14),

-- Rosebank Rabbits FC
('Famara', 'Parker','1981-09-25',12,15),
('Ammaar', 'Walter','1993-10-09',17,15),
('Armen', 'Waller','1994-07-12',12,15),
('Believe', 'Mcdonald','1987-07-04',17,15),
('Babatunmise', 'Carrillo','1974-08-27',9,15),
('Harry', 'Winters','1962-01-29',2,15),
('Jaay', 'Soto','1977-07-23',3,15),
('Chiron', 'Fisher','1971-09-08',4,15),
('A-Jay', 'Chen','1996-02-04',9,15),
('David', 'Wiggins','1968-08-16',10,15),
('Cathal', 'Stewart','1981-05-01',3,15),
('Ikemsinachukwu', 'Armstrong','1983-04-10',10,15),
('Aled', 'Adams','1968-07-13',2,15),
('Kabir', 'Carrillo','1964-11-27',11,15),
('Cormack', 'Vinson','1985-10-07',5,15),
('Murray', 'Newton','1974-07-07',14,15),
('Momooreoluwa', 'Vinson','1965-06-01',16,15),

-- Randburg Rams FC
('Michael-James', 'Little','1987-04-06',7,16),
('Adam-James', 'Faulkner','1973-10-17',14,16),
('Hunter', 'Villarreal','1971-07-22',8,16),
('Carrich', 'Kline','1966-02-11',11,16),
('Atom', 'Robertson','1975-10-02',16,16),
('Caine', 'Warner','1974-05-03',12,16),
('Derek', 'Cooley','1971-12-06',9,16),
('Jian', 'Greene','1983-09-02',9,16),
('Cadan', 'Brewer','1992-05-02',14,16),
('Flint', 'Price','1961-01-13',2,16),
('Kevin', 'Barker','1974-04-04',5,16),
('Austen', 'Sutton','1972-05-02',13,16),
('Dawson', 'Snyder','1987-09-20',13,16),
('Luc', 'Cunningham','1965-07-02',14,16),
('Jae', 'Barron','1979-07-22',2,16),
('Muhammad', 'Stewart','1968-07-28',12,16),
('Murry', 'Cook','1993-05-16',16,16),

-- Edenvale Elephants FC
('Davy', 'Ashley','1978-04-15',5,17),
('Muhammad', 'Pearson','1984-06-27',4,17),
('Amaan', 'Tate','1972-08-10',10,17),
('Kalum', 'Pate','1989-03-05',13,17),
('Nevin', 'Poole','1965-10-01',8,17),
('Folarinwa', 'Peck','1991-05-23',6,17),
('Iain', 'Rivera','1969-09-28',16,17),
('Boab', 'Weber','1971-09-17',5,17),
('Eniola', 'Nicholson','1969-07-27',7,17),
('Eamonn', 'Ratliff','1965-03-11',14,17),
('A-Jay', 'Madden','1983-09-27',6,17),
('Darrel', 'Peck','1988-08-20',13,17),
('Aidian', 'Valdez','1987-11-27',13,17),
('Myles', 'Kirkland','1983-05-27',1,17),
('Lukmaan', 'Stark','1972-02-20',7,17),
('Ciar', 'Burnett','1967-08-20',11,17),
('Guerin', 'Brady','1972-06-01',6,17),

-- Grahamstown Giraffes FC
('Leiten', 'Farrell','1961-03-09',2,18),
('Ehsen', 'Houston','1966-07-06',4,18),
('Maisum', 'Madden','1998-07-15',12,18),
('Aled', 'Heath','1993-12-20',13,18),
('Darl', 'Stokes','1984-09-12',9,18),
('Isher', 'Vincent','1962-04-13',7,18),
('Dalton', 'Richmond','1984-05-02',9,18),
('Amir', 'Larson','1983-12-15',7,18),
('Nathanael', 'Snider','1988-06-23',13,18),
('Nikhil', 'Galloway','1977-08-26',4,18),
('Kia', 'Hubbard','1985-05-16',6,18),
('Hadji', 'Duffy','1984-03-14',4,18),
('Liam', 'Morrison','1979-09-29',13,18),
('Amolpreet', 'Zimmerman','1978-01-12',14,18),
('Darl', 'Rojas','1989-06-26',1,18),
('Louis', 'Garrison','1968-12-28',3,18),
('Harley', 'Perez','1983-09-17',1,18),

-- Windsor Whales FC
('Cohan', 'Livingston','1965-02-28',8,19),
('Lincoln', 'Trevino','1981-06-01',17,19),
('Israel', 'Bolton','1961-01-07',2,19),
('Fawaz', 'Cortez','1985-07-20',11,19),
('Bracken', 'Chang','1992-09-30',10,19),
('Aedin', 'Stone','1989-02-19',1,19),
('Kier', 'Watson','1972-12-19',3,19),
('Gil', 'Jacobson','1996-12-03',8,19),
('Cruz', 'Stevenson','1963-10-01',16,19),
('Edwin', 'Glover','1967-12-02',14,19),
('Essa', 'Sykes','1994-05-04',1,19),
('Daumantas', 'Talley','1974-01-30',2,19),
('Odin', 'Nash','1977-12-05',3,19),
('Niven', 'Gates','1976-05-07',12,19),
('Maxwell', 'Mccarthy','1973-02-18',11,19),
('Oakley', 'Wise','1976-09-04',1,19),
('Morton', 'Hall','1992-09-20',1,19),

-- Lenasia Lions FC
('Dimitri', 'Dawson','1998-08-27',6,20),
('Jules', 'Weaver','1966-02-15',8,20),
('Loche', 'Flores','1961-02-17',14,20),
('Keith', 'Moon','1979-01-13',17,20),
('Aldred', 'Greene','1984-05-24',4,20),
('Lenyn', 'Mcintyre','1999-08-18',4,20),
('Jasim', 'Wiggins','1962-07-19',13,20),
('Korrin', 'Kaufman','1997-08-26',6,20),
('Harjeevan', 'Barnes','1969-12-24',6,20),
('Braden', 'Mcclain','1967-03-08',10,20),
('Heini', 'Castillo','1991-06-10',11,20),
('Moore', 'Underwood','1961-02-21',10,20),
('Billy', 'Wilkerson','1998-02-14',7,20),
('Erdehan', 'Mcfarland','1995-12-06',1,20),
('Keelin', 'Conway','1986-06-23',3,20),
('Cailean', 'Frye','1972-07-03',17,20),
('Nico', 'Byers','1968-11-09',5,20)
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
(10,'Attacker',10,4500000,183,'Right'),
(11,'Attacker',9,7000000,189,'Right'),

(18, 'Goalkeeper',47,50455096,196,'Right'),
(19, 'Defender',22,26161079,215,'Left'),
(20, 'Midfielder',51,262708,186,'Right'),
(21, 'Defender',37,78779302,165,'Left'),
(22, 'Midfielder',19,54167354,172,'Left'),
(23, 'Attacker',70,58275547,211,'Right'),
(24, 'Attacker',8,92709194,168,'Left'),
(25, 'Defender',12,15564835,185,'Right'),
(26, 'Defender',19,46775586,177,'Right'),
(27, 'Attacker',79,63776626,199,'Right'),
(28, 'Midfielder',95,78823630,170,'Left'),

(35, 'Goalkeeper',14,79483956,196,'Left'),
(36, 'Attacker',82,4488601,182,'Right'),
(37, 'Midfielder',30,69280787,205,'Right'),
(38, 'Defender',89,83990520,219,'Left'),
(39, 'Defender',21,83096566,189,'Right'),
(40, 'Attacker',90,4129097,169,'Right'),
(41, 'Attacker',17,76296830,217,'Right'),
(42, 'Midfielder',81,41002941,208,'Right'),
(43, 'Attacker',26,63467690,182,'Right'),
(44, 'Attacker',87,10861794,196,'Left'),
(45, 'Defender',9,74449579,194,'Right'),

(52, 'Goalkeeper',63,65399564,203,'Left'),
(53, 'Midfielder',62,20924863,187,'Right'),
(54, 'Attacker',7,94971001,175,'Left'),
(55, 'Attacker',67,60517240,170,'Left'),
(56, 'Defender',56,26365457,169,'Right'),
(57, 'Midfielder',16,94564118,205,'Right'),
(58, 'Defender',12,12754910,193,'Right'),
(59, 'Defender',9,80675225,193,'Right'),
(60, 'Attacker',29,43210102,172,'Left'),
(61, 'Midfielder',70,8350519,214,'Right'),
(62, 'Defender',33,47472289,174,'Right'),

(69, 'Goalkeeper',47,93689286,214,'Left'),
(70, 'Midfielder',70,19411314,204,'Left'),
(71, 'Midfielder',79,76578905,197,'Right'),
(72, 'Attacker',49,83550665,220,'Right'),
(73, 'Defender',94,52956282,195,'Left'),
(74, 'Midfielder',3,113094,194,'Right'),
(75, 'Defender',18,33176089,192,'Left'),
(76, 'Attacker',97,82573073,215,'Right'),
(77, 'Defender',64,38096663,169,'Right'),
(78, 'Attacker',33,57344370,197,'Left'),
(79, 'Attacker',4,11845331,218,'Right'),

(86, 'Goalkeeper',50,94409344,205,'Left'),
(87, 'Defender',27,63289442,191,'Left'),
(88, 'Attacker',25,58521134,199,'Right'),
(89, 'Midfielder',62,43507494,202,'Left'),
(90, 'Defender',55,8083739,179,'Right'),
(91, 'Attacker',63,31374196,165,'Right'),
(92, 'Defender',99,67012598,204,'Left'),
(93, 'Defender',45,35951018,205,'Right'),
(94, 'Attacker',17,65294498,176,'Left'),
(95, 'Defender',19,74680674,165,'Left'),
(96, 'Defender',22,9379276,218,'Left'),

(103, 'Goalkeeper',94,93336417,213,'Right'),
(104, 'Attacker',81,21762616,186,'Left'),
(105, 'Defender',91,89078621,175,'Left'),
(106, 'Midfielder',90,40995610,205,'Left'),
(107, 'Attacker',77,50526529,183,'Left'),
(108, 'Defender',78,89576349,176,'Right'),
(109, 'Defender',30,32288978,216,'Left'),
(110, 'Midfielder',56,90353251,184,'Left'),
(111, 'Defender',16,89551744,194,'Right'),
(112, 'Attacker',68,54418061,176,'Left'),
(113, 'Defender',17,98937161,165,'Right'),

(120, 'Goalkeeper',23,25632739,196,'Right'),
(121, 'Attacker',92,83362739,189,'Right'),
(122, 'Attacker',80,5986940,177,'Left'),
(123, 'Midfielder',96,64943783,177,'Right'),
(124, 'Midfielder',3,62315189,214,'Right'),
(125, 'Defender',94,40245229,219,'Right'),
(126, 'Defender',38,40908444,166,'Right'),
(127, 'Attacker',73,662015,180,'Right'),
(128, 'Attacker',76,56917495,188,'Left'),
(129, 'Defender',84,44422796,200,'Right'),
(130, 'Midfielder',76,8438,196,'Left'),

(137, 'Goalkeeper',49,65969933,216,'Right'),
(138, 'Midfielder',9,84735071,195,'Right'),
(139, 'Defender',74,10894656,168,'Left'),
(140, 'Defender',7,27248715,180,'Left'),
(141, 'Defender',40,36751569,173,'Right'),
(142, 'Midfielder',68,70588480,220,'Right'),
(143, 'Midfielder',4,415484,199,'Right'),
(144, 'Attacker',84,68576269,171,'Left'),
(145, 'Defender',48,54347100,216,'Right'),
(146, 'Defender',63,50721095,216,'Left'),
(147, 'Attacker',15,83739500,204,'Right'),

(154, 'Goalkeeper',19,69551140,217,'Left'),
(155, 'Defender',7,57169560,217,'Right'),
(156, 'Attacker',44,11963212,212,'Left'),
(157, 'Attacker',98,75979221,191,'Left'),
(158, 'Attacker',90,90647910,172,'Left'),
(159, 'Attacker',38,29114173,195,'Left'),
(160, 'Midfielder',4,90445717,186,'Left'),
(161, 'Midfielder',23,14688074,199,'Left'),
(162, 'Midfielder',8,41371222,202,'Right'),
(163, 'Attacker',18,43428025,211,'Left'),
(164, 'Defender',84,58106315,211,'Left'),

(171, 'Goalkeeper',53,96236658,216,'Right'),
(172, 'Attacker',62,20112701,167,'Left'),
(173, 'Attacker',75,97057998,194,'Left'),
(174, 'Midfielder',96,31321459,172,'Left'),
(175, 'Midfielder',98,73265289,187,'Left'),
(176, 'Attacker',90,19014357,191,'Right'),
(177, 'Midfielder',17,82176244,178,'Right'),
(178, 'Midfielder',68,15919787,201,'Right'),
(179, 'Defender',70,8717072,186,'Left'),
(180, 'Defender',84,62515625,182,'Right'),
(181, 'Defender',54,31836859,191,'Left'),

(188, 'Goalkeeper',62,94765785,210,'Right'),
(189, 'Attacker',62,94765785,210,'Right'),
(190, 'Defender',92,8677624,167,'Left'),
(191, 'Defender',88,76017157,205,'Left'),
(192, 'Attacker',73,18615556,196,'Left'),
(193, 'Midfielder',74,22566199,194,'Right'),
(194, 'Attacker',66,33225914,216,'Left'),
(195, 'Midfielder',15,18873890,172,'Right'),
(196, 'Defender',92,50877866,165,'Left'),
(197, 'Attacker',71,72040083,198,'Right'),
(198, 'Attacker',6,12954701,189,'Right'),

(205, 'Goalkeeper',46,71335297,204,'Right'),
(206, 'Attacker',67,72269886,168,'Right'),
(207, 'Attacker',36,58833515,193,'Left'),
(208, 'Defender',52,87833317,202,'Left'),
(209, 'Defender',21,65073643,205,'Left'),
(210, 'Midfielder',98,34223860,205,'Right'),
(211, 'Defender',77,90610201,211,'Left'),
(212, 'Defender',17,25921176,177,'Left'),
(213, 'Defender',68,61593864,199,'Left'),
(214, 'Defender',11,69563591,214,'Right'),
(215, 'Defender',66,78986696,187,'Right'),

(222, 'Goalkeeper',36,8987571,193,'Left'),
(223, 'Defender',4,40086043,179,'Left'),
(224, 'Midfielder',86,97752960,172,'Left'),
(225, 'Defender',78,13066861,175,'Right'),
(226, 'Attacker',41,39482142,191,'Left'),
(227, 'Midfielder',43,18654410,209,'Left'),
(228, 'Attacker',83,40823708,187,'Right'),
(229, 'Defender',52,8812908,180,'Left'),
(230, 'Midfielder',79,954920,183,'Left'),
(231, 'Defender',82,840777,198,'Left'),
(232, 'Defender',99,80668908,189,'Right'),

(239, 'Goalkeeper',68,739397,208,'Right'),
(240, 'Midfielder',36,19569689,196,'Left'),
(241, 'Defender',13,97587322,186,'Right'),
(242, 'Midfielder',33,93671105,185,'Left'),
(243, 'Attacker',23,65136760,179,'Left'),
(244, 'Midfielder',56,84181769,191,'Right'),
(245, 'Defender',31,27536297,193,'Left'),
(246, 'Defender',77,91819795,198,'Left'),
(247, 'Defender',28,58931596,178,'Left'),
(248, 'Defender',16,82217724,194,'Left'),
(249, 'Defender',61,5594886,216,'Right'),

(256, 'Goalkeeper',43,6189573,198,'Right'),
(257, 'Midfielder',75,17988325,209,'Right'),
(258, 'Attacker',55,2427262,175,'Left'),
(259, 'Attacker',51,63418723,194,'Left'),
(260, 'Attacker',96,5072155,206,'Left'),
(261, 'Attacker',90,35950408,174,'Right'),
(262, 'Defender',97,88139662,168,'Right'),
(263, 'Attacker',73,15399889,183,'Right'),
(264, 'Midfielder',14,89887443,186,'Left'),
(265, 'Defender',13,60719716,170,'Left'),
(266, 'Defender',42,88248032,171,'Right'),

(273, 'Goalkeeper',5,82932169,217,'Right'),
(274, 'Attacker',45,86595103,187,'Right'),
(275, 'Attacker',68,21547031,216,'Right'),
(276, 'Midfielder',8,48930328,183,'Right'),
(277, 'Attacker',7,90451202,192,'Left'),
(278, 'Midfielder',64,43780063,214,'Right'),
(279, 'Attacker',71,9972438,171,'Right'),
(280, 'Defender',53,53595643,210,'Right'),
(281, 'Attacker',23,15766394,173,'Left'),
(282, 'Defender',40,63512138,201,'Right'),
(283, 'Defender',58,93397969,182,'Left'),

(290, 'Goalkeeper',54,51438388,192,'Left'),
(291, 'Midfielder',14,44424315,213,'Right'),
(292, 'Midfielder',96,83316743,172,'Right'),
(293, 'Defender',49,72687419,187,'Left'),
(294, 'Defender',39,11076784,195,'Left'),
(295, 'Defender',17,88398722,201,'Left'),
(296, 'Defender',93,52071464,194,'Left'),
(297, 'Midfielder',79,56042844,200,'Right'),
(298, 'Attacker',72,25644595,209,'Left'),
(299, 'Defender',94,75405624,173,'Right'),
(300, 'Defender',33,53322330,199,'Left'),

(307, 'Goalkeeper',40,70595796,205,'Right'),
(308, 'Attacker',58,55071713,194,'Left'),
(309, 'Defender',64,21036077,213,'Left'),
(310, 'Midfielder',18,42421672,165,'Left'),
(311, 'Midfielder',20,24815863,185,'Left'),
(312, 'Attacker',50,51001398,215,'Right'),
(313, 'Defender',60,93970474,208,'Right'),
(314, 'Midfielder',28,52258295,197,'Left'),
(315, 'Defender',74,27897721,166,'Right'),
(316, 'Defender',77,75292732,191,'Left'),
(317, 'Midfielder',19,84428491,217,'Right'),

(324, 'Goalkeeper',72,57751679,198,'Left'),
(325, 'Midfielder',3,17427418,190,'Left'),
(326, 'Midfielder',79,39721871,203,'Right'),
(327, 'Attacker',18,65610485,172,'Right'),
(328, 'Midfielder',17,31017497,173,'Left'),
(329, 'Defender',93,62720861,208,'Left'),
(330, 'Midfielder',51,79470010,212,'Left'),
(331, 'Defender',20,2493341,200,'Left'),
(332, 'Attacker',75,50712189,206,'Left'),
(333, 'Defender',67,68762070,190,'Right'),
(334, 'Midfielder',7,32614651,215,'Left')
GO

INSERT INTO dbo.soccerCoaches
(personID,coachType,yearsExperience)
VALUES
(12,'Attacker',5),
(13,'Midfielder',8),
(14,'Defender',3),
(15,'Goalkeeper',2),

(29, 'Attacker',19),
(30, 'Midfielder',7),
(31, 'Defender',1),
(32, 'Goalkeeper',29),

(46, 'Attacker',23),
(47, 'Midfielder',0),
(48, 'Defender',4),
(49, 'Goalkeeper',7),

(63, 'Attacker',11),
(64, 'Midfielder',17),
(65, 'Defender',35),
(66, 'Goalkeeper',23),

(80, 'Attacker',29),
(81, 'Midfielder',6),
(82, 'Defender',33),
(83, 'Goalkeeper',4),

(97, 'Attacker',35),
(98, 'Midfielder',24),
(99, 'Defender',29),
(100, 'Goalkeeper',14),

(114, 'Attacker',30),
(115, 'Midfielder',29),
(116, 'Defender',40),
(117, 'Goalkeeper',25),

(131, 'Attacker',28),
(132, 'Midfielder',14),
(133, 'Defender',6),
(134, 'Goalkeeper',38),

(148, 'Attacker',2),
(149, 'Midfielder',37),
(150, 'Defender',39),
(151, 'Goalkeeper',11),

(165, 'Attacker',5),
(166, 'Midfielder',12),
(167, 'Defender',14),
(168, 'Goalkeeper',0),

(182, 'Attacker',20),
(183, 'Midfielder',1),
(184, 'Defender',5),
(185, 'Goalkeeper',0),

(199, 'Attacker',39),
(200, 'Midfielder',1),
(201, 'Defender',34),
(202, 'Goalkeeper',17),

(216, 'Attacker',20),
(217, 'Midfielder',3),
(218, 'Defender',21),
(219, 'Goalkeeper',36),

(233, 'Attacker',4),
(234, 'Midfielder',10),
(235, 'Defender',14),
(236, 'Goalkeeper',15),

(250, 'Attacker',14),
(251, 'Midfielder',23),
(252, 'Defender',24),
(253, 'Goalkeeper',29),

(267, 'Attacker',38),
(268, 'Midfielder',29),
(269, 'Defender',34),
(270, 'Goalkeeper',40),

(284, 'Attacker',25),
(285, 'Midfielder',30),
(286, 'Defender',14),
(287, 'Goalkeeper',4),

(301, 'Attacker',33),
(302, 'Midfielder',20),
(303, 'Defender',20),
(304, 'Goalkeeper',0),

(318, 'Attacker',2),
(319, 'Midfielder',15),
(320, 'Defender',27),
(321, 'Goalkeeper',40),

(335, 'Attacker',17),
(336, 'Midfielder',34),
(337, 'Defender',35),
(338, 'Goalkeeper',3)
GO

INSERT INTO dbo.soccerManagers
(personID,trophiesWon,matchesManaged)
VALUES
(16, 2, 228),
(33, 10, 485),
(50, 5, 297),
(67, 5, 334),
(84, 0, 17),
(101, 4, 172),
(118, 3, 258),
(135, 2, 129),
(152, 0, 151),
(169, 0, 419),
(186, 10, 435),
(203, 0, 252),
(220, 1, 380),
(237, 3, 169),
(254, 0, 203),
(271, 5, 309),
(288, 0, 126),
(305, 0, 18),
(322, 0, 192),
(339, 5, 322)
GO

INSERT INTO dbo.soccerOwners
(personID,netWorth)
VALUES 
(17, 66550498),
(34, 198693529),
(51, 433188941),
(68, 194664445),
(85, 862314664),
(102, 177660329),
(119, 46467915),
(136, 963455012),
(153, 338033837),
(170, 710487330),
(187, 110223692),
(204, 299094791),
(221, 781900430),
(238, 96802740),
(255, 773945441),
(272, 285607919),
(289, 178455108),
(306, 578402263),
(323, 648413670),
(340, 771835657)
GO

INSERT INTO dbo.soccerMatches
(stadiumID,date)
VALUES
(1,'2023-01-03 12:00:00'),
(2,'2023-01-03 16:30:00'),
(3,'2023-01-03 16:30:00'),
(4,'2023-01-03 16:30:00'),
(5,'2023-01-03 16:30:00'),
(6,'2023-01-03 16:30:00'),
(7,'2023-01-03 20:00:00'),
(8,'2023-01-03 20:00:00'),
(9,'2023-01-03 20:00:00'),
(10,'2023-01-03 20:00:00'),

(11, '2023-01-10 12:00:00'),
(12, '2023-01-10 16:30:00'),
(13, '2023-01-10 16:30:00'),
(14, '2023-01-10 16:30:00'),
(15, '2023-01-10 16:30:00'),
(16, '2023-01-10 16:30:00'),
(17, '2023-01-10 20:00:00'),
(18, '2023-01-10 20:00:00'),
(19, '2023-01-10 20:00:00'),
(20, '2023-01-10 20:00:00'),

(1, '2023-01-17 12:00:00'),
(2, '2023-01-17 16:30:00'),
(3, '2023-01-17 16:30:00'),
(4, '2023-01-17 16:30:00'),
(5, '2023-01-17 16:30:00'),
(6, '2023-01-17 16:30:00'),
(7, '2023-01-17 20:00:00'),
(8, '2023-01-17 20:00:00'),
(9, '2023-01-17 20:00:00'),
(10, '2023-01-17 20:00:00'),

(20, '2023-01-24 12:00:00'),
(19, '2023-01-24 16:30:00'),
(18, '2023-01-24 16:30:00'),
(17, '2023-01-24 16:30:00'),
(16, '2023-01-24 16:30:00'),
(15, '2023-01-24 16:30:00'),
(14, '2023-01-24 20:00:00'),
(13, '2023-01-24 20:00:00'),
(12, '2023-01-24 20:00:00'),
(11, '2023-01-24 20:00:00')
GO

INSERT INTO dbo.teamMatches
(matchID,teamID,result)
VALUES
(1,1,'Win'),
(1,11,'Loss'),
(2,2,'Draw'),
(2,12,'Draw'),
(3,3,'Loss'),
(3,13,'Win'),
(4,4,'Win'),
(4,14,'Loss'),
(5,5,'Draw'),
(5,15,'Draw'),
(6,6,'Loss'),
(6,16,'Win'),
(7,7,'Win'),
(7,17,'Loss'),
(8,8,'Loss'),
(8,18,'Win'),
(9,9,'Win'),
(9,19,'Loss'),
(10,10,'Draw'),
(10,20,'Draw'),

(11,11,'Win'),
(11,1,'Loss'),
(12,12,'Draw'),
(12,2,'Draw'),
(13,13,'Loss'),
(13,3,'Win'),
(14,14,'Win'),
(14,4,'Loss'),
(15,15,'Draw'),
(15,5,'Draw'),
(16,16,'Loss'),
(16,6,'Win'),
(17,17,'Win'),
(17,7,'Loss'),
(18,18,'Loss'),
(18,8,'Win'),
(19,19,'Win'),
(19,9,'Loss'),
(20,20,'Draw'),
(20,10,'Draw'),

(21,1,'Win'),
(21,20,'Loss'),
(22,2,'Draw'),
(22,19,'Draw'),
(23,3,'Loss'),
(23,18,'Win'),
(24,4,'Win'),
(24,17,'Loss'),
(25,5,'Draw'),
(25,16,'Draw'),
(26,6,'Loss'),
(26,15,'Win'),
(27,7,'Win'),
(27,14,'Loss'),
(28,8,'Loss'),
(28,13,'Win'),
(29,9,'Win'),
(29,12,'Loss'),
(30,10,'Draw'),
(30,11,'Draw'),

(31,20,'Win'),
(31,1,'Loss'),
(32,19,'Draw'),
(32,2,'Draw'),
(33,18,'Loss'),
(33,3,'Win'),
(34,17,'Win'),
(34,4,'Loss'),
(35,16,'Draw'),
(35,5,'Draw'),
(36,15,'Loss'),
(36,6,'Win'),
(37,14,'Win'),
(37,7,'Loss'),
(38,13,'Loss'),
(38,8,'Win'),
(39,12,'Win'),
(39,9,'Loss'),
(40,11,'Draw'),
(40,10,'Draw')
GO