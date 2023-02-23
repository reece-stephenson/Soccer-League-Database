CREATE DATABASE SoccerLeague
GO

USE [SoccerLeague]

CREATE TABLE [dbo].[soccerTeams] (
  [teamID] [int] PRIMARY KEY IDENTITY(1, 1) NOT NULL,
  [teamName] [nvarchar](255),
  [stadiumID] [int],
  [transferBudget] [int]
);
GO

CREATE TABLE [dbo].[persons] (
  [personID] [int] PRIMARY KEY IDENTITY(1, 1) NOT NULL,
  [firstName] [nvarchar](255),
  [surname] [nvarchar](255),
  [dateOfBirth] [date],
  [representingCountry] [int],
  [teamID] [int]
)
GO

CREATE TABLE [dbo].[soccerPlayers] (
  [personID] [int] PRIMARY KEY NOT NULL,
  [positionType] [nvarchar](10),
  [number] [int],
  [transferValue] [int],
  [height] [int],
  [preferredFoot] [nvarchar](5)
)
GO

CREATE TABLE [dbo].[soccerManagers] (
  [personID] [int] PRIMARY KEY NOT NULL,
  [trophiesWon] [int],
  [matchesManaged] [int]
)
GO

CREATE TABLE [dbo].[soccerCoaches] (
  [personID] [int] PRIMARY KEY NOT NULL,
  [coachType] [nvarchar](10),
  [yearsExperience] [int]
)
GO

CREATE TABLE [dbo].[soccerOwners] (
  [personID] [int] PRIMARY KEY NOT NULL,
  [netWorth] [int]
)
GO

CREATE TABLE [dbo].[teamMatches] (
  [matchID] [int] NOT NULL,
  [teamID] [int] NOT NULL,
  [result] [nvarchar](5),
  PRIMARY KEY ([matchID], [teamID])
)
GO

CREATE TABLE [dbo].[soccerMatches] (
  [matchID] [int] PRIMARY KEY IDENTITY(1, 1) NOT NULL,
  [stadiumID] [int],
  [date] [datetime]
)
GO

CREATE TABLE [dbo].[stadiums] (
  [stadiumID] int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
  [stadiumName] [nvarchar](255),
  [capacity] [int],
  [countryID] [int]
)
GO

CREATE TABLE [dbo].[countries] (
  [countryID] [int] PRIMARY KEY IDENTITY(1, 1) NOT NULL,
  [name] [nvarchar](255)
)
GO

  -- For getting the teamID of a person
  CREATE FUNCTION udfFindTeam(
    @personID INT
  ) 
  RETURNS INT
  AS BEGIN
    DECLARE @teamID INT
    SELECT @teamID = [teamID] FROM [persons] WHERE [personID] = @personID

    RETURN @teamID
  END
  GO

  -- For use within the soccerPlayers chkNoSameNumberOnTeam constraint
  CREATE FUNCTION udfSameTeamSameNumber(
    @newPersonID INT,
    @newPlayerNumber INT
  ) 
  RETURNS BIT
  AS BEGIN
    DECLARE @Res BIT, @teamID INT

    SELECT @teamID = [dbo].udfFindTeam(@newPersonID)
    IF EXISTS (SELECT [soccerPlayers].[personID] FROM [soccerPlayers] 
    LEFT JOIN [persons] ON [soccerPlayers].[personID] = [persons].[personID]
    WHERE [soccerPlayers].[number] = @newPlayerNumber AND [persons].[teamID] = @teamID)
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

  --For use within the teamMatches chkMatchID constraint
  CREATE FUNCTION udfMatchCount(
  @matchID int
  )
  RETURNS int
  AS
  BEGIN
  declare @matchCount int

  SELECT @matchCount = COUNT(matchID)  FROM teamMatches WHERE matchID=@matchID

  RETURN @matchCount
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
  ALTER TABLE [dbo].[soccerTeams] ADD CONSTRAINT [fkSoccerTeams] FOREIGN KEY ([stadiumID]) REFERENCES [stadiums] ([stadiumID])
  ALTER TABLE [dbo].[soccerTeams] ADD CONSTRAINT [unqSoccerTeamsTeamID] UNIQUE([teamID])
  ALTER TABLE [dbo].[soccerTeams] ADD CONSTRAINT [chkSoccerTeamsTransferBudget] CHECK([transferBudget] < 500000000)
  GO

  -- Constraints for persons table
  ALTER TABLE [dbo].[persons] ADD CONSTRAINT [fkPersonsCountry] FOREIGN KEY ([representingCountry]) REFERENCES [countries] ([countryID])
  ALTER TABLE [dbo].[persons] ADD CONSTRAINT [fkPersonsTeam] FOREIGN KEY ([teamID]) REFERENCES [soccerTeams] ([teamID])
  ALTER TABLE [dbo].[persons] ADD CONSTRAINT [unqPersonsPersonID] UNIQUE([personID])
  ALTER TABLE [dbo].[persons] ADD CONSTRAINT [chkPersonsDateOfBirth] CHECK([dateOfBirth] <= GetDate())
  GO

  -- Constraints for soccerPlayers table
  ALTER TABLE [dbo].[soccerPlayers] ADD CONSTRAINT [fkSoccerPlayers] FOREIGN KEY ([personID]) REFERENCES [persons] ([personID])
  ALTER TABLE [dbo].[soccerPlayers] ADD CONSTRAINT [unqSoccerPlayersPersonID] UNIQUE([personID])
  ALTER TABLE [dbo].[soccerPlayers] ADD CONSTRAINT [chkSoccerPlayersHeight] CHECK(([positionType] = 'Goalkeeper' AND [height] > 190) OR ([positionType] != 'Goalkeeper'))
  ALTER TABLE [dbo].[soccerPlayers] ADD CONSTRAINT [chkSoccerPlayersNumber] CHECK(([positionType] = 'Goalkeeper') OR ([number] > 1))
  ALTER TABLE [dbo].[soccerPlayers] ADD CONSTRAINT [chkNoSameNumberOnTeam] CHECK([dbo].udfSameTeamSameNumber([personID], [number])=1)
  ALTER TABLE [dbo].[soccerPlayers] ADD CONSTRAINT [defSoccerPlayersPrefferedFoot] DEFAULT 'Right' FOR [preferredFoot]
  GO

  -- Constraints for soccerManagers table
  ALTER TABLE [dbo].[soccerManagers] ADD CONSTRAINT [fkSoccerManagers] FOREIGN KEY ([personID]) REFERENCES [persons] ([personID])
  ALTER TABLE [dbo].[soccerManagers] ADD CONSTRAINT [defTrophiesWon] DEFAULT 0 FOR [trophiesWon]
  ALTER TABLE [dbo].[soccerManagers] ADD CONSTRAINT [defMatchesManaged] DEFAULT 0 FOR [matchesManaged]
  ALTER TABLE [dbo].[soccerManagers] ADD CONSTRAINT [chkPositiveNumberTrophies] CHECK ([trophiesWon] >= 0)
  ALTER TABLE [dbo].[soccerManagers] ADD CONSTRAINT [chkPositiveMatchesManaged] CHECK ([matchesManaged] >= 0)
  GO

  -- Constraints for soccerCoaches table
  ALTER TABLE [dbo].[soccerCoaches] ADD CONSTRAINT [fkSoccerCoaches] FOREIGN KEY ([personID]) REFERENCES [persons] ([personID])
  ALTER TABLE [dbo].[soccerCoaches] ADD CONSTRAINT [chkCoachTypes] CHECK([coachType] in ('Goalkeeper', 'Defender', 'Midfielder', 'Attacker'))
  ALTER TABLE [dbo].[soccerCoaches] ADD CONSTRAINT [chkPositiveYearsExperience] CHECK ([yearsExperience] >= 0)
  GO

  -- Constraints for soccerOwners table
  ALTER TABLE [dbo].[soccerOwners] ADD CONSTRAINT [fkSoccerOwners] FOREIGN KEY ([personID]) REFERENCES [persons] ([personID])
  GO

  --Constraints for teamMatches
  ALTER TABLE [dbo].[teamMatches] ADD CONSTRAINT [fkTeamMatch] FOREIGN KEY ([matchID]) REFERENCES [soccerMatches] ([matchID])
  ALTER TABLE [dbo].[teamMatches] ADD CONSTRAINT [fkTeamID] FOREIGN KEY ([teamID]) REFERENCES [soccerTeams] ([teamID])
  ALTER TABLE [dbo].[teamMatches] ADD CONSTRAINT [chkResult] CHECK([result] in ('Draw','Win','Loss'))
  ALTER TABLE [dbo].[teamMatches] ADD CONSTRAINT [chkMatchID] CHECK(dbo.udfMatchCount([matchID])<=2)
  GO

  --Constraints for soccerMatches
  ALTER TABLE [dbo].[soccerMatches] ADD CONSTRAINT [fkSoccerMatches] FOREIGN KEY ([stadiumID]) REFERENCES [stadiums] ([stadiumID])
  ALTER TABLE [dbo].[soccerMatches] ADD CONSTRAINT [chkMatchDate] CHECK([date] <= GetDate())
  GO

  --Constraints for stadiums
  ALTER TABLE [dbo].[stadiums] ADD CONSTRAINT [fkStadiums] FOREIGN KEY ([countryID]) REFERENCES [countries] ([countryID])
  ALTER TABLE [dbo].[stadiums] ADD CONSTRAINT [chkcapacity] CHECK([capacity]>=0)
  GO

  --Constraints for countries
  ALTER TABLE [dbo].[countries] ADD CONSTRAINT [unqCountryName] UNIQUE([name])
