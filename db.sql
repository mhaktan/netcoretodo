USE [NetCoreTodo]
GO
ALTER TABLE [dbo].[UserRefreshTokens] DROP CONSTRAINT [FK_UserRefreshTokens_Users]
GO
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_Users]
GO
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_TaskStatuses]
GO
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_TaskPriorities]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_CreatedDate]
GO
ALTER TABLE [dbo].[UserRefreshTokens] DROP CONSTRAINT [DF_UserRefreshTokens_CreatedDate]
GO
ALTER TABLE [dbo].[TaskStatuses] DROP CONSTRAINT [DF_TaskStatuses_CreatedDate]
GO
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [DF_Tasks_CreatedDate]
GO
ALTER TABLE [dbo].[TaskPriorities] DROP CONSTRAINT [DF_TaskPriorities_CreatedDate]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16.11.2018 12:53:57 ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[UserRefreshTokens]    Script Date: 16.11.2018 12:53:57 ******/
DROP TABLE [dbo].[UserRefreshTokens]
GO
/****** Object:  Table [dbo].[TaskStatuses]    Script Date: 16.11.2018 12:53:57 ******/
DROP TABLE [dbo].[TaskStatuses]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 16.11.2018 12:53:57 ******/
DROP TABLE [dbo].[Tasks]
GO
/****** Object:  Table [dbo].[TaskPriorities]    Script Date: 16.11.2018 12:53:57 ******/
DROP TABLE [dbo].[TaskPriorities]
GO
/****** Object:  User [TURKCELL\EXT02D14053]    Script Date: 16.11.2018 12:53:57 ******/
DROP USER [TURKCELL\EXT02D14053]
GO
USE [master]
GO
/****** Object:  Database [NetCoreTodo]    Script Date: 16.11.2018 12:53:57 ******/
DROP DATABASE [NetCoreTodo]
GO
/****** Object:  Database [NetCoreTodo]    Script Date: 16.11.2018 12:53:57 ******/
CREATE DATABASE [NetCoreTodo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NetCoreTodo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\NetCoreTodo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NetCoreTodo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\NetCoreTodo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NetCoreTodo] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NetCoreTodo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NetCoreTodo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NetCoreTodo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NetCoreTodo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NetCoreTodo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NetCoreTodo] SET ARITHABORT OFF 
GO
ALTER DATABASE [NetCoreTodo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NetCoreTodo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NetCoreTodo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NetCoreTodo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NetCoreTodo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NetCoreTodo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NetCoreTodo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NetCoreTodo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NetCoreTodo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NetCoreTodo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NetCoreTodo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NetCoreTodo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NetCoreTodo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NetCoreTodo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NetCoreTodo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NetCoreTodo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NetCoreTodo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NetCoreTodo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NetCoreTodo] SET  MULTI_USER 
GO
ALTER DATABASE [NetCoreTodo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NetCoreTodo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NetCoreTodo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NetCoreTodo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [NetCoreTodo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NetCoreTodo] SET QUERY_STORE = OFF
GO
USE [NetCoreTodo]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [NetCoreTodo]
GO
/****** Object:  User [TURKCELL\EXT02D14053]    Script Date: 16.11.2018 12:53:58 ******/
CREATE USER [TURKCELL\EXT02D14053] FOR LOGIN [TURKCELL\EXT02D14053] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[TaskPriorities]    Script Date: 16.11.2018 12:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskPriorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[BgColor] [nvarchar](500) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TaskPriorities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 16.11.2018 12:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskPriorityId] [int] NOT NULL,
	[TaskStatusId] [int] NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[CreatedUserId] [int] NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskStatuses]    Script Date: 16.11.2018 12:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskStatuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TaskStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRefreshTokens]    Script Date: 16.11.2018 12:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRefreshTokens](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[IssuedUtc] [datetime] NOT NULL,
	[ExpiresUtc] [datetime] NOT NULL,
	[Token] [nvarchar](500) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserRefreshTokens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16.11.2018 12:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](500) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TaskPriorities] ON 
GO
INSERT [dbo].[TaskPriorities] ([Id], [Name], [BgColor], [CreatedDate]) VALUES (1, N'Normal', N'btn-default', CAST(N'2018-11-16T11:10:40.673' AS DateTime))
GO
INSERT [dbo].[TaskPriorities] ([Id], [Name], [BgColor], [CreatedDate]) VALUES (2, N'Critical', N'btn-danger', CAST(N'2018-11-16T11:10:45.513' AS DateTime))
GO
INSERT [dbo].[TaskPriorities] ([Id], [Name], [BgColor], [CreatedDate]) VALUES (3, N'High', N'btn-warning', CAST(N'2018-11-16T11:10:49.593' AS DateTime))
GO
INSERT [dbo].[TaskPriorities] ([Id], [Name], [BgColor], [CreatedDate]) VALUES (4, N'Low', N'btn-info', CAST(N'2018-11-16T11:10:53.410' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TaskPriorities] OFF
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON 
GO
INSERT [dbo].[Tasks] ([Id], [TaskPriorityId], [TaskStatusId], [Name], [CreatedUserId], [LastModifiedDate], [CreatedDate]) VALUES (1, 2, 1, N'Task 1    ', 1, CAST(N'2018-11-16T11:29:20.337' AS DateTime), CAST(N'2018-11-16T11:28:21.477' AS DateTime))
GO
INSERT [dbo].[Tasks] ([Id], [TaskPriorityId], [TaskStatusId], [Name], [CreatedUserId], [LastModifiedDate], [CreatedDate]) VALUES (2, 3, 1, N'Task 2    ', 1, NULL, CAST(N'2018-11-16T11:29:25.547' AS DateTime))
GO
INSERT [dbo].[Tasks] ([Id], [TaskPriorityId], [TaskStatusId], [Name], [CreatedUserId], [LastModifiedDate], [CreatedDate]) VALUES (3, 4, 1, N'Task 3    ', 1, NULL, CAST(N'2018-11-16T11:29:31.913' AS DateTime))
GO
INSERT [dbo].[Tasks] ([Id], [TaskPriorityId], [TaskStatusId], [Name], [CreatedUserId], [LastModifiedDate], [CreatedDate]) VALUES (4, 1, 3, N'Task 4    ', 1, CAST(N'2018-11-16T11:34:18.007' AS DateTime), CAST(N'2018-11-16T11:29:36.520' AS DateTime))
GO
INSERT [dbo].[Tasks] ([Id], [TaskPriorityId], [TaskStatusId], [Name], [CreatedUserId], [LastModifiedDate], [CreatedDate]) VALUES (5, 1, 1, N'Task 5    ', 1, NULL, CAST(N'2018-11-16T11:29:40.610' AS DateTime))
GO
INSERT [dbo].[Tasks] ([Id], [TaskPriorityId], [TaskStatusId], [Name], [CreatedUserId], [LastModifiedDate], [CreatedDate]) VALUES (6, 1, 2, N'Task 6    ', 1, CAST(N'2018-11-16T11:34:16.903' AS DateTime), CAST(N'2018-11-16T11:29:42.787' AS DateTime))
GO
INSERT [dbo].[Tasks] ([Id], [TaskPriorityId], [TaskStatusId], [Name], [CreatedUserId], [LastModifiedDate], [CreatedDate]) VALUES (7, 4, 1, N'Task 7    ', 1, CAST(N'2018-11-16T11:29:53.383' AS DateTime), CAST(N'2018-11-16T11:29:47.823' AS DateTime))
GO
INSERT [dbo].[Tasks] ([Id], [TaskPriorityId], [TaskStatusId], [Name], [CreatedUserId], [LastModifiedDate], [CreatedDate]) VALUES (8, 1, 1, N'Task 8    ', 1, NULL, CAST(N'2018-11-16T11:29:55.900' AS DateTime))
GO
INSERT [dbo].[Tasks] ([Id], [TaskPriorityId], [TaskStatusId], [Name], [CreatedUserId], [LastModifiedDate], [CreatedDate]) VALUES (9, 3, 1, N'Task 9    ', 1, NULL, CAST(N'2018-11-16T11:30:02.620' AS DateTime))
GO
INSERT [dbo].[Tasks] ([Id], [TaskPriorityId], [TaskStatusId], [Name], [CreatedUserId], [LastModifiedDate], [CreatedDate]) VALUES (10, 2, 2, N'Task 10   ', 1, CAST(N'2018-11-16T11:34:25.027' AS DateTime), CAST(N'2018-11-16T11:30:12.467' AS DateTime))
GO
INSERT [dbo].[Tasks] ([Id], [TaskPriorityId], [TaskStatusId], [Name], [CreatedUserId], [LastModifiedDate], [CreatedDate]) VALUES (11, 1, 1, N'task 11   ', 1, NULL, CAST(N'2018-11-16T11:36:24.530' AS DateTime))
GO
INSERT [dbo].[Tasks] ([Id], [TaskPriorityId], [TaskStatusId], [Name], [CreatedUserId], [LastModifiedDate], [CreatedDate]) VALUES (12, 1, 2, N'task 12   ', 1, CAST(N'2018-11-16T11:36:29.587' AS DateTime), CAST(N'2018-11-16T11:36:26.180' AS DateTime))
GO
INSERT [dbo].[Tasks] ([Id], [TaskPriorityId], [TaskStatusId], [Name], [CreatedUserId], [LastModifiedDate], [CreatedDate]) VALUES (13, 1, 1, N'Task 12   ', 1, NULL, CAST(N'2018-11-16T11:43:26.160' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Tasks] OFF
GO
SET IDENTITY_INSERT [dbo].[TaskStatuses] ON 
GO
INSERT [dbo].[TaskStatuses] ([Id], [Name], [CreatedDate]) VALUES (1, N'Active', CAST(N'2018-11-16T11:10:21.387' AS DateTime))
GO
INSERT [dbo].[TaskStatuses] ([Id], [Name], [CreatedDate]) VALUES (2, N'Completed', CAST(N'2018-11-16T11:10:26.203' AS DateTime))
GO
INSERT [dbo].[TaskStatuses] ([Id], [Name], [CreatedDate]) VALUES (3, N'Deleted', CAST(N'2018-11-16T11:10:28.250' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TaskStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRefreshTokens] ON 
GO
INSERT [dbo].[UserRefreshTokens] ([Id], [UserId], [IssuedUtc], [ExpiresUtc], [Token], [CreatedDate]) VALUES (2, 1, CAST(N'2018-11-16T08:43:05.683' AS DateTime), CAST(N'2018-11-17T08:43:05.683' AS DateTime), N'20029c1f-8147-4c0b-b8c9-b4daac6d11c9', CAST(N'2018-11-16T11:43:05.737' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[UserRefreshTokens] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Username], [Password], [CreatedDate]) VALUES (1, N'user1', N'1', CAST(N'2018-11-16T11:11:16.487' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [Username], [Password], [CreatedDate]) VALUES (2, N'user2', N'2', CAST(N'2018-11-16T11:11:19.907' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [Username], [Password], [CreatedDate]) VALUES (3, N'user3', N'3', CAST(N'2018-11-16T11:11:21.943' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [Username], [Password], [CreatedDate]) VALUES (4, N'user4', N'4', CAST(N'2018-11-16T11:11:24.100' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [Username], [Password], [CreatedDate]) VALUES (5, N'user5', N'5', CAST(N'2018-11-16T11:11:26.160' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[TaskPriorities] ADD  CONSTRAINT [DF_TaskPriorities_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TaskStatuses] ADD  CONSTRAINT [DF_TaskStatuses_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserRefreshTokens] ADD  CONSTRAINT [DF_UserRefreshTokens_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskPriorities] FOREIGN KEY([TaskPriorityId])
REFERENCES [dbo].[TaskPriorities] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskPriorities]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskStatuses] FOREIGN KEY([TaskStatusId])
REFERENCES [dbo].[TaskStatuses] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskStatuses]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users]
GO
ALTER TABLE [dbo].[UserRefreshTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserRefreshTokens_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRefreshTokens] CHECK CONSTRAINT [FK_UserRefreshTokens_Users]
GO
USE [master]
GO
ALTER DATABASE [NetCoreTodo] SET  READ_WRITE 
GO
