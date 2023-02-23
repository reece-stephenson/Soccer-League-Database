-- Testing transferring a player
-- Pass
EXEC [dbo].[procTransfer]
@PersonID = 10,
@TeamID = 2,
@ChosenNumber = 48

-- Fail (successfully)
EXEC [dbo].[procTransfer]
@PersonID = 10,
@TeamID = 2,
@ChosenNumber = 12


-- Testing updating player information
-- Pass
EXEC [dbo].[updatePlayerInformation]
@PersonID = 22,
@TransferValue = 480000

-- Testing creating a player
-- Pass
EXEC [dbo].[procCreatePlayer]
@FirstNamePlayer = 'David',
@SurnamePlayer = 'Davidson',
@DateOfBirthPlayer ='1999-01-04',
@RepresentingCountryPlayer = 2,
@TeamIDPlayer = 4,
@PositionType = 'Defender',
@Number = 77,
@TransferValue = 5000000,
@Height = 180,
@PreferredFoot = 'Left'

-- Fail (successfully)
EXEC [dbo].[procCreatePlayer]
@FirstNamePlayer = 'David',
@SurnamePlayer = 'Davidson',
@DateOfBirthPlayer ='1999-01-04',
@RepresentingCountryPlayer = 2,
@TeamIDPlayer = 4,
@PositionType = 'Defender',
@Number = 67,
@TransferValue = 5000000,
@Height = 180,
@PreferredFoot = 'Left'


-- Testing creating an owner
-- Pass
[dbo].[procCreateOwner]
@FirstNameOwner = 'Benny',
@SurnameOwner = 'Bonnet',
@DateOfBirthOwner = '1969-07-06',
@RepresentingCountryOwner = 4,
@TeamIDOwner = 6,
@NetWorth = 244000000


-- Testing creating a manager
-- Pass
[dbo].[procCreateManager]
@FirstNameManager = 'Tarance',
@SurnameManager = 'Florence',
@DateOfBirthManager = '1980-04-01',
@RepresentingCountryManager = 1,
@TeamIDManager = '5',
@TrophiesWon = 2,
@matchesManaged = 480


-- Testing creating a coach
-- Pass
[dbo].[procCreateCoach]
@FirstNameCoach = 'Florence',
@SurnameCoach = 'Tarance',
@DateOfBirthCoach = '1979-01-19',
@RepresentingCountryCoach = 1,
@TeamIDCoach = 4,
@coachType = 'Attacker',
@yearsExperience = 14


-- Testing creating a match result
-- Pass
[dbo].[procAddMatchOutcomes]
@stadiumID = 3,
@date = '2023-02-23 12:00:00',
@winningTeamID = 1,
@losingTeamID = 2, 
@isDraw = 0

-- Pass
[dbo].[procAddMatchOutcomes]
@stadiumID = 3,
@date = '2023-02-23 14:00:00',
@teamId1 = 1,
@teamId2 = 2, 
@isDraw = 1