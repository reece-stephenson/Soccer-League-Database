DROP DATABASE SoccerLeague

CREATE DATABASE SoccerLeague

USE [SoccerLeague]

CREATE TABLE [soccerTeams] (
  [teamID] int PRIMARY KEY IDENTITY(1, 1),
  [teamName] nvarchar(255),
  [stadiumID] int,
  [transferBudget] int
)
GO

CREATE TABLE [persons] (
  [personID] int PRIMARY KEY IDENTITY(1, 1),
  [firstName] nvarchar(255),
  [surname] nvarchar(255),
  [dateOfBirth] datetime,
  [representingCountry] int,
  [teamID] int
)
GO

CREATE TABLE [soccerPlayers] (
  [personID] int PRIMARY KEY,
  [positionType] nvarchar(255),
  [number] int,
  [transferValue] int,
  [height] int,
  [preferredFoot] nvarchar(255)
)
GO

CREATE TABLE [soccerManagers] (
  [personID] int PRIMARY KEY,
  [trophiesWon] int,
  [matchesManaged] int,
  [pointsPerMatch] int
)
GO

CREATE TABLE [soccerCoaches] (
  [personID] int PRIMARY KEY,
  [coachType] nvarchar(255),
  [yearsExperience] int
)
GO

CREATE TABLE [soccerOwners] (
  [personID] int PRIMARY KEY,
  [netWorth] int
)
GO

CREATE TABLE [teamMatches] (
  [matchID] int,
  [teamID] int,
  [result] nvarchar(255),
  PRIMARY KEY ([matchID], [teamID])
)
GO

CREATE TABLE [soccerMatches] (
  [matchID] int PRIMARY KEY IDENTITY(1, 1),
  [stadium] int,
  [date] datetime
)
GO

CREATE TABLE [stadiums] (
  [stadiumID] int PRIMARY KEY IDENTITY(1, 1),
  [stadiumName] nvarchar(255),
  [capacity] int,
  [countryID] int
)
GO

CREATE TABLE [countries] (
  [countryID] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255)
)
GO

-- Constraints for soccerTeams table
ALTER TABLE [soccerTeams] ADD FOREIGN KEY ([stadiumID]) REFERENCES [stadiums] ([stadiumID])
-- ALTER TABLE [soccerTeams] ADD CONSTRAINT pkSoccerTeamsTeamID PRIMARY KEY([teamID])
ALTER TABLE [soccerTeams] ADD CONSTRAINT fkSoccerTeamsStadiumsStadiumID FOREIGN KEY([stadiumID]) REFERENCES [stadiums]([stadiumID])
ALTER TABLE [soccerTeams] ADD CONSTRAINT unqSoccerTeamsTeamID UNIQUE([teamID])
ALTER TABLE [soccerTeams] ADD CONSTRAINT chkSoccerTeamsTransferBudget CHECK([transferBudget] < 500000000)
GO

-- Constraints for persons table
ALTER TABLE [persons] ADD FOREIGN KEY ([representingCountry]) REFERENCES [countries] ([countryID])
ALTER TABLE [persons] ADD FOREIGN KEY ([teamID]) REFERENCES [soccerTeams] ([teamID])
-- ALTER TABLE [persons] ADD CONSTRAINT pkPersonsPersonID PRIMARY KEY([personID])
ALTER TABLE [persons] ADD CONSTRAINT fkPersonsSoccerTeamsTeamID FOREIGN KEY([teamID]) REFERENCES [soccerTeams]([teamId])
ALTER TABLE [persons] ADD CONSTRAINT unqPersonsPersonID UNIQUE([personID])
ALTER TABLE [persons] ADD CONSTRAINT chkPersonsDateOfBirth CHECK([dateOfBirth] < GetDate())
GO

-- Constraints for soccerPlayers table
ALTER TABLE [soccerPlayers] ADD FOREIGN KEY ([personID]) REFERENCES [persons] ([personID])
-- ALTER TABLE [soccerPlayers] ADD CONSTRAINT pkSoccerPlayersPersonID PRIMARY KEY([personID])
ALTER TABLE [soccerPlayers] ADD CONSTRAINT unqSoccerPlayersPersonID UNIQUE([personID])
-- ALTER TABLE [soccerPlayers] ADD CONSTRAINT chkSoccerPlayersHeight CHECK([positionType] = 'Goalkeeper' OR [height] > 190)
-- ALTER TABLE [soccerPlayers] ADD CONSTRAINT chkSoccerPlayersNumber CHECK([positionType] <> 'Goalkeeper' AND [number] > 1)
ALTER TABLE [soccerPlayers] ADD CONSTRAINT defSoccerPlayersPrefferedFoot DEFAULT 'Right' FOR [preferredFoot]
-- Constraint for not having a soccer player with the same number in the same team?
GO

-- Constraints for soccerManagers table
ALTER TABLE [soccerManagers] ADD FOREIGN KEY ([personID]) REFERENCES [persons] ([personID])
ALTER TABLE [soccerManagers] ADD CONSTRAINT chkPositiveNumberTrophies CHECK ([trophiesWon] >= 0)
ALTER TABLE [soccerManagers] ADD CONSTRAINT chkPositiveMatchesManaged CHECK ([matchesManaged] >= 0)
GO

-- Constraints for soccerCoaches table
ALTER TABLE [soccerCoaches] ADD FOREIGN KEY ([personID]) REFERENCES [persons] ([personID])
ALTER TABLE [soccerCoaches] ADD CONSTRAINT chkCoachTypes CHECK([coachType] in ('Goalkeeper', 'Defender', 'Midfielder', 'Attacker'))
ALTER TABLE [soccerCoaches] ADD CONSTRAINT chkPositiveYearsExperience CHECK ([yearsExperience] >= 0)
GO

-- Constraints for soccerOwners table
ALTER TABLE [soccerOwners] ADD FOREIGN KEY ([personID]) REFERENCES [persons] ([personID])
GO

ALTER TABLE [teamMatches] ADD FOREIGN KEY ([matchID]) REFERENCES [soccerMatches] ([matchID])
ALTER TABLE [teamMatches] ADD FOREIGN KEY ([teamID]) REFERENCES [soccerTeams] ([teamID])
GO

ALTER TABLE [soccerMatches] ADD FOREIGN KEY ([stadium]) REFERENCES [stadiums] ([stadiumID])
GO

ALTER TABLE [stadiums] ADD FOREIGN KEY ([countryID]) REFERENCES [countries] ([countryID])
GO
