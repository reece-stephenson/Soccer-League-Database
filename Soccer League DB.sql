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
  [dateOfBirth] date,
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
  [stadiumID] int,
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

-- For use within the soccerPlayers chkNoSameNumberOnTeam constraint
CREATE FUNCTION funSameTeamSameNumber(
  @newPlayerNumber INT,
  @newTeamID INT
) 
RETURNS BOOLEAN 
AS BEGIN
  DECLARE @Res BIT 
  IF EXISTS (SELECT [soccerPlayers].[personID] FROM [soccerPlayers] 
  LEFT JOIN [persons] ON [soccerPlayers].[personID] = [persons].[personID] 
  WHERE [soccerPlayers].[number] = @newPlayerNumber AND [persons].[teamID] = @newTeamID)
  BEGIN
    SET @Res=1
  END
  ELSE
  BEGIN
    SET @Res=0
  END
  RETURN @Res
END
GO

--View for matches
CREATE VIEW vMatches
AS
(
SELECT ISNULL(t1.teamID,t2.teamID) AS teamID,ISNULL(t1.WIN, 0) AS Win, ISNULL(t2.LOSS, 0) AS Loss
FROM     (SELECT teamID, COUNT(teamID) AS WIN
                  FROM      teamMatches
                  WHERE   (result = 'win')GROUP BY teamID) t1 FULL OUTER JOIN
                      (SELECT teamID, COUNT(teamID) AS LOSS
                       FROM      teamMatches
                       WHERE   (result = 'loss')
                      GROUP BY teamID) t2 ON t1.teamID = t2.teamID WHERE t1.teamID IS NOT NULL OR t2.teamID IS NOT NULL
ORDER BY WIN DESC OFFSET 0 ROWS)
GO

-- Constraints for soccerTeams table
ALTER TABLE [soccerTeams] ADD FOREIGN KEY ([stadiumID]) REFERENCES [stadiums] ([stadiumID])
ALTER TABLE [soccerTeams] ADD CONSTRAINT unqSoccerTeamsTeamID UNIQUE([teamID])
ALTER TABLE [soccerTeams] ADD CONSTRAINT chkSoccerTeamsTransferBudget CHECK([transferBudget] < 500000000)
GO

-- Constraints for persons table
ALTER TABLE [persons] ADD FOREIGN KEY ([representingCountry]) REFERENCES [countries] ([countryID])
ALTER TABLE [persons] ADD FOREIGN KEY ([teamID]) REFERENCES [soccerTeams] ([teamID])
ALTER TABLE [persons] ADD CONSTRAINT unqPersonsPersonID UNIQUE([personID])
ALTER TABLE [persons] ADD CONSTRAINT chkPersonsDateOfBirth CHECK([dateOfBirth] <= GetDate())
GO

-- Constraints for soccerPlayers table
ALTER TABLE [soccerPlayers] ADD FOREIGN KEY ([personID]) REFERENCES [persons] ([personID])
ALTER TABLE [soccerPlayers] ADD CONSTRAINT unqSoccerPlayersPersonID UNIQUE([personID])
ALTER TABLE [soccerPlayers] ADD CONSTRAINT chkSoccerPlayersHeight CHECK(([positionType] = 'Goalkeeper' AND [height] > 190) OR ([positionType] != 'Goalkeeper'))
ALTER TABLE [soccerPlayers] ADD CONSTRAINT chkSoccerPlayersNumber CHECK(([positionType] = 'Goalkeeper') OR ([number] > 1))
ALTER TABLE [soccerPlayers] ADD CONSTRAINT chkNoSameNumberOnTeam CHECK(funSameTeamSameNumber([number], [teamID])=(1))
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

--Constraints for teamMatches
ALTER TABLE [teamMatches] ADD FOREIGN KEY ([matchID]) REFERENCES [soccerMatches] ([matchID])
ALTER TABLE [teamMatches] ADD FOREIGN KEY ([teamID]) REFERENCES [soccerTeams] ([teamID])
ALTER TABLE [teamMatches] ADD CONSTRAINT chkResult CHECK([result] in ('Draw','Win','Loss'))
GO

--Constraints for soccerMatches
ALTER TABLE [soccerMatches] ADD FOREIGN KEY ([stadiumID]) REFERENCES [stadiums] ([stadiumID])
ALTER TABLE [soccerMatches] ADD CONSTRAINT chkMatchDate CHECK([date] <= GetDate())
GO

--Constraints for stadiums
ALTER TABLE [stadiums] ADD FOREIGN KEY ([countryID]) REFERENCES [countries] ([countryID])
ALTER TABLE [stadiums] ADD CONSTRAINT chkcapacity CHECK([capacity]>=0)
GO

--Constraints for countries
ALTER TABLE [countries] ADD CONSTRAINT unqCountryName UNIQUE([name])
