USE [master]
GO
/****** Object:  Database [ConferenceDB]    Script Date: 04/09/2012 08:33:04 ******/
CREATE DATABASE [ConferenceDB] ON  PRIMARY 
( NAME = N'ConferenceDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ConferenceDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ConferenceDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ConferenceDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ConferenceDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConferenceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConferenceDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ConferenceDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ConferenceDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ConferenceDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ConferenceDB] SET ARITHABORT OFF
GO
ALTER DATABASE [ConferenceDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ConferenceDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ConferenceDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ConferenceDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ConferenceDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ConferenceDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ConferenceDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ConferenceDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ConferenceDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ConferenceDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ConferenceDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [ConferenceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ConferenceDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ConferenceDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ConferenceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ConferenceDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ConferenceDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ConferenceDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ConferenceDB] SET  READ_WRITE
GO
ALTER DATABASE [ConferenceDB] SET RECOVERY FULL
GO
ALTER DATABASE [ConferenceDB] SET  MULTI_USER
GO
ALTER DATABASE [ConferenceDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ConferenceDB] SET DB_CHAINING OFF
GO
USE [ConferenceDB]
GO
/****** Object:  Table [dbo].[People]    Script Date: 04/09/2012 08:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](128) NOT NULL,
	[LastName] [nvarchar](128) NOT NULL,
	[EmailAddress] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 04/09/2012 08:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceName] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conferences]    Script Date: 04/09/2012 08:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conferences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1024) NOT NULL,
	[Description] [text] NULL,
	[LocationId] [int] NOT NULL,
 CONSTRAINT [PK_Conferences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 04/09/2012 08:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1024) NOT NULL,
	[Description] [text] NULL,
	[NumberExpected] [int] NOT NULL,
	[Speaker] [int] NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[ConferenceId] [int] NOT NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attending]    Script Date: 04/09/2012 08:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attending](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[SessionId] [int] NOT NULL,
 CONSTRAINT [PK_Attending] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_People_People]    Script Date: 04/09/2012 08:33:05 ******/
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_People] FOREIGN KEY([Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_People]
GO
/****** Object:  ForeignKey [FK_Conferences_Locations]    Script Date: 04/09/2012 08:33:05 ******/
ALTER TABLE [dbo].[Conferences]  WITH CHECK ADD  CONSTRAINT [FK_Conferences_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [dbo].[Conferences] CHECK CONSTRAINT [FK_Conferences_Locations]
GO
/****** Object:  ForeignKey [FK_Sessions_Conferences]    Script Date: 04/09/2012 08:33:05 ******/
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_Conferences] FOREIGN KEY([ConferenceId])
REFERENCES [dbo].[Conferences] ([Id])
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_Sessions_Conferences]
GO
/****** Object:  ForeignKey [FK_Sessions_People]    Script Date: 04/09/2012 08:33:05 ******/
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_People] FOREIGN KEY([Speaker])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_Sessions_People]
GO
/****** Object:  ForeignKey [FK_Attending_People]    Script Date: 04/09/2012 08:33:05 ******/
ALTER TABLE [dbo].[Attending]  WITH CHECK ADD  CONSTRAINT [FK_Attending_People] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Attending] CHECK CONSTRAINT [FK_Attending_People]
GO
/****** Object:  ForeignKey [FK_Attending_Sessions]    Script Date: 04/09/2012 08:33:05 ******/
ALTER TABLE [dbo].[Attending]  WITH CHECK ADD  CONSTRAINT [FK_Attending_Sessions] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Sessions] ([Id])
GO
ALTER TABLE [dbo].[Attending] CHECK CONSTRAINT [FK_Attending_Sessions]
GO
