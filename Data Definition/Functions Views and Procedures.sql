USE [SoccerLeague]

-- For getting the teamID of a person
CREATE FUNCTION udfFindTeam(
  @personID int
) 
RETURNS int
AS BEGIN
  DECLARE @teamID int
  SELECT @teamID = [teamID] FROM [persons] WHERE [personID] = @personID

  RETURN @teamID
END
GO

-- For use within the soccerPlayers chkNoSameNumberOnTeam constraint
CREATE FUNCTION udfSameTeamSameNumber(
  @teamID int,
  @newPlayerNumber int
) 
RETURNS BIT
AS BEGIN
  DECLARE @Res BIT

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
AS BEGIN
  DECLARE @matchCount int

  SELECT @matchCount = COUNT(matchID)  FROM teamMatches WHERE matchID=@matchID

  RETURN @matchCount
END
GO

--View for matches
CREATE VIEW vMatches
AS
(
SELECT teamID,
SUM(CASE WHEN result = 'Win' THEN 1 ELSE 0 END) AS Win,
SUM(CASE WHEN result = 'Loss' THEN 1 ELSE 0 END) AS Loss,
SUM(CASE WHEN result = 'Draw' THEN 1 ELSE 0 END) AS Draw
FROM teamMatches
GROUP BY teamID)
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
IF (dbo.udfSameTeamSameNumber(@TeamID,@ChosenNumber)!=1)
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
   ELSE
  BEGIN
  RAISERROR ('NOT ENOUGH FUNDS',16,1)
  END
END
ELSE
RAISERROR ('CANNOT TRANSFER PLAYER TO SAME TEAM',16,1)
END
GO

-- Stored procedure for updating player information
CREATE PROCEDURE [dbo].[updatePlayerInformation]
@PersonID int,
@PositionType nvarchar(10) = NULL,
@Number int = NULL,
@TransferValue int = NULL
AS
BEGIN
	UPDATE [dbo].[soccerPlayers]
	SET [number]= ISNULL(@Number,[number]), [positionType]= ISNULL(@PositionType,[positionType]), [transferValue]= ISNULL(@TransferValue,[transferValue])
	WHERE [personID] = @PersonID
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
  IF(dbo.udfSameTeamSameNumber(@TeamIDPlayer,@Number)!=1)
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
  ELSE
  BEGIN
      RAISERROR ('Player with that number already in team',16,1)
  END
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

-- Stored procedure creating a manager
CREATE PROCEDURE [dbo].[procCreateManager]
@FirstNameManager nvarchar(255),
@SurnameManager nvarchar(255),
@DateOfBirthManager date,
@RepresentingCountryManager int,
@TeamIDManager int,
@TrophiesWon int,
@matchesManaged int
AS
BEGIN
	EXEC [dbo].[procCreatePerson]
	@FirstName = @FirstNameManager,
	@Surname = @SurnameManager,
	@DateOfBirth = @DateOfBirthManager,
	@RepresentingCountry = @RepresentingCountryManager,
	@TeamID = @TeamIDManager

	INSERT INTO [dbo].soccerManagers
	(personID,trophiesWon,matchesManaged)
	VALUES
	(@@IDENTITY,@TrophiesWon,@matchesManaged)
END
GO

-- Stored procedure for creating a coach 
CREATE PROCEDURE [dbo].[procCreateCoach]
@FirstNameCoach nvarchar(255),
@SurnameCoach nvarchar(255),
@DateOfBirthCoach date,
@RepresentingCountryCoach int,
@TeamIDCoach int,
@coachType nvarchar(10),
@yearsExperience int
AS
BEGIN
	EXEC [dbo].[procCreatePerson]
	@FirstName = @FirstNameCoach,
	@Surname = @SurnameCoach,
	@DateOfBirth = @DateOfBirthCoach,
	@RepresentingCountry = @RepresentingCountryCoach,
	@TeamID = @TeamIDCoach

	INSERT INTO [dbo].[soccerCoaches]
	(personID,coachType,yearsExperience)
	VALUES
	(@@IDENTITY,@coachType,@yearsExperience)
END
GO  

CREATE PROCEDURE [dbo].[procAddMatchOutcomes]
@stadiumID int,
@date datetime,
@winningTeamID int,
@losingTeamID int, 
@isDraw bit
AS
BEGIN
DECLARE @matchID int

	INSERT INTO [dbo].[soccerMatches]
	(stadiumID,date) VALUES (@stadiumID,@date)
	SET @matchID = @@IDENTITY

	IF (@isDraw = 1)
	BEGIN   
	INSERT INTO [dbo].teamMatches
	(matchID,teamID,result)
	VALUES
	(@matchID,@winningTeamID,'Draw')

	INSERT INTO [dbo].teamMatches
	(matchID,teamID,result)
	VALUES
	(@matchID,@losingTeamID,'Draw')
	END
	ELSE
	BEGIN
	INSERT INTO [dbo].teamMatches
	(matchID,teamID,result)
	VALUES
	(@matchID,@winningTeamID,'Win')

		INSERT INTO [dbo].teamMatches
	(matchID,teamID,result)
	VALUES
	(@matchID,@losingTeamID,'Loss')
	END
END
GO
