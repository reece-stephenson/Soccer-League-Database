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

ALTER TABLE [soccerTeams] ADD FOREIGN KEY ([stadiumID]) REFERENCES [stadiums] ([stadiumID])
GO

ALTER TABLE [persons] ADD FOREIGN KEY ([representingCountry]) REFERENCES [countries] ([countryID])
GO

ALTER TABLE [persons] ADD FOREIGN KEY ([teamID]) REFERENCES [soccerTeams] ([teamID])
GO

ALTER TABLE [soccerPlayers] ADD FOREIGN KEY ([personID]) REFERENCES [persons] ([personID])
GO

ALTER TABLE [soccerManagers] ADD FOREIGN KEY ([personID]) REFERENCES [persons] ([personID])
GO

ALTER TABLE [soccerCoaches] ADD FOREIGN KEY ([personID]) REFERENCES [persons] ([personID])
GO

ALTER TABLE [soccerOwners] ADD FOREIGN KEY ([personID]) REFERENCES [persons] ([personID])
GO

ALTER TABLE [teamMatches] ADD FOREIGN KEY ([matchID]) REFERENCES [soccerMatches] ([matchID])
GO

ALTER TABLE [teamMatches] ADD FOREIGN KEY ([teamID]) REFERENCES [soccerTeams] ([teamID])
GO

ALTER TABLE [soccerMatches] ADD FOREIGN KEY ([stadium]) REFERENCES [stadiums] ([stadiumID])
GO

ALTER TABLE [stadiums] ADD FOREIGN KEY ([countryID]) REFERENCES [countries] ([countryID])
GO