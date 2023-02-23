USE [SoccerLeague]

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
