CREATE DATABASE SoccerLeague
GO

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
  [positionType] nvarchar(10),
  [number] int,
  [transferValue] int,
  [height] int,
  [preferredFoot] nvarchar(5)
)
GO

CREATE TABLE [soccerManagers] (
  [personID] int PRIMARY KEY,
  [trophiesWon] int,
  [matchesManaged] int
)
GO

CREATE TABLE [soccerCoaches] (
  [personID] int PRIMARY KEY,
  [coachType] nvarchar(10),
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
  [result] nvarchar(5),
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

-- For getting the teamID of a person
CREATE FUNCTION funFindTeam(
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
CREATE FUNCTION funSameTeamSameNumber(
  @newPersonID INT,
  @newPlayerNumber INT
) 
RETURNS BIT
AS BEGIN
  DECLARE @Res BIT, @teamID INT

  SELECT @teamID = [dbo].funFindTeam(@newPersonID)
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

-- Stored procedure for performing a transfer
CREATE PROCEDURE [dbo].[procTransfer]
@PersonID int,
@TeamID int,
@ChosenNumber int
AS
DECLARE @transferBudget int, @transferValue int
SELECT @transferBudget = transferBudget FROM [dbo].[soccerTeams] WHERE [teamID]= @TeamID
SELECT @transferValue = transferValue FROM [dbo].[soccerPlayers] WHERE [personID]=@PersonID
BEGIN
  IF @transferBudget >= @transferValue
  BEGIN
    UPDATE [dbo].[soccerTeams]
    SET [transferBudget] = @transferBudget-@transferValue
    WHERE [teamID] = @TeamID

    UPDATE dbo.persons
    SET [teamID] = @TeamID
    WHERE [personID] =@PersonID

    UPDATE [dbo].[soccerPlayers]
    SET [number]=@ChosenNumber
    WHERE [personID] = @PersonID
  END
END
GO

-- Stored procedure for updating player information
CREATE PROCEDURE [dbo].[updatePlayerInformation]
@PersonID int = NULL,
@PositionType nvarchar(10) = NULL,
@Number int = NULL,
@TransferValue int = NULL
AS
BEGIN
IF @PersonID IS NULL
	BEGIN
	  RAISERROR('PersonID must be inputed',11,1)
	END
ELSE
BEGIN
	UPDATE [dbo].[soccerPlayers]
	SET [number]= ISNULL(@Number,[number]), [positionType]= ISNULL(@PositionType,[positionType]), [transferValue]= ISNULL(@TransferValue,[transferValue])
	WHERE [personID] = @PersonID
END
END
GO

-- Stored procedure for creating a person
CREATE PROCEDURE [dbo].[procCreatePerson]
@FirstName nvarchar(255),
@Surname nvarchar(255),
@DateOfBirth date,
@RepresentingCountry int,
@TeamID int
AS
BEGIN
	INSERT INTO [dbo].[persons]
	(firstName,surname,dateOfBirth,representingCountry,teamID)
	VALUES
	(@FirstName,@Surname,@DateOfBirth,@RepresentingCountry,@TeamID)
END
GO

-- Stored procedure for creating a player
CREATE PROCEDURE [dbo].[procCreatePlayer]
@FirstNamePlayer nvarchar(255),
@SurnamePlayer nvarchar(255),
@DateOfBirthPlayer date,
@RepresentingCountryPlayer int,
@TeamIDPlayer int,
@PositionType nvarchar(10),
@Number int,
@TransferValue int,
@Height int,
@PreferredFoot nvarchar(255)
AS
BEGIN
	EXEC [dbo].[procCreatePerson]
	@FirstName = @FirstNamePlayer,
	@Surname = @SurnamePlayer,
	@DateOfBirth = @DateOfBirthPlayer,
	@RepresentingCountry = @RepresentingCountryPlayer,
	@TeamID = @TeamIDPlayer

	INSERT INTO [dbo].[soccerPlayers]
	(personID,positionType,number,transferValue,height,preferredFoot)
	VALUES
	(@@IDENTITY,@PositionType,@Number,@TransferValue,@Height,@PreferredFoot)
END
GO

-- Stored procedure for creating a owner 
CREATE PROCEDURE [dbo].[procCreateOwner]
@FirstNameOwner nvarchar(255),
@SurnameOwner nvarchar(255),
@DateOfBirthOwner date,
@RepresentingCountryOwner int,
@TeamIDOwner int,
@NetWorth int
AS
BEGIN
	EXEC [dbo].[procCreatePerson]
	@FirstName = @FirstNameOwner,
	@Surname = @SurnameOwner,
	@DateOfBirth = @DateOfBirthOwner,
	@RepresentingCountry = @RepresentingCountryOwner,
	@TeamID = @TeamIDOwner

	INSERT INTO [dbo].[soccerOwners]
	(personID,netWorth)
	VALUES
	(@@IDENTITY,@NetWorth)
END
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
ALTER TABLE [soccerPlayers] ADD CONSTRAINT chkNoSameNumberOnTeam CHECK([dbo].funSameTeamSameNumber([personID], [number])=(0))
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
ALTER TABLE [teamMatches] ADD CONSTRAINT chkMatchID CHECK(dbo.udfMatchCount([matchID])<=2)
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
