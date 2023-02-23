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
