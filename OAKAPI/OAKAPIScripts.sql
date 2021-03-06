USE [master]
GO
/****** Object:  Database [APIDB]    Script Date: 4.01.2022 11:08:55 ******/
CREATE DATABASE [APIDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'APIDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\APIDB.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'APIDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\APIDB_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [APIDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [APIDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [APIDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [APIDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [APIDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [APIDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [APIDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [APIDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [APIDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [APIDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [APIDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [APIDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [APIDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [APIDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [APIDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [APIDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [APIDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [APIDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [APIDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [APIDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [APIDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [APIDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [APIDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [APIDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [APIDB] SET RECOVERY FULL 
GO
ALTER DATABASE [APIDB] SET  MULTI_USER 
GO
ALTER DATABASE [APIDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [APIDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [APIDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [APIDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [APIDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'APIDB', N'ON'
GO
USE [APIDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4.01.2022 11:08:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 4.01.2022 11:08:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonDetails]    Script Date: 4.01.2022 11:08:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonCity] [nvarchar](max) NULL,
	[BirthDay] [datetime2](7) NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_PersonDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persons]    Script Date: 4.01.2022 11:08:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Age] [int] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Adress] [nvarchar](max) NULL,
	[PositionId] [int] NOT NULL,
	[SalaryId] [int] NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Positions]    Script Date: 4.01.2022 11:08:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[PositionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salaries]    Script Date: 4.01.2022 11:08:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salaries](
	[SalaryId] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_Salaries] PRIMARY KEY CLUSTERED 
(
	[SalaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220101044850_initialcreate', N'5.0.13')
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (1, N'Department1Update')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (2, N'Department2')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (4, N'Department 3')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (6, N'MVC Department Updated')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (11, N'new dpt was updated')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[PersonDetails] ON 

INSERT [dbo].[PersonDetails] ([Id], [PersonCity], [BirthDay], [PersonId]) VALUES (1, N'LondonDetail', CAST(N'2022-12-12 00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[PersonDetails] ([Id], [PersonCity], [BirthDay], [PersonId]) VALUES (2, N'ParisDetail', CAST(N'2022-12-12 00:00:00.0000000' AS DateTime2), 2)
SET IDENTITY_INSERT [dbo].[PersonDetails] OFF
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([Id], [Name], [Surname], [Age], [Email], [Password], [Adress], [PositionId], [SalaryId]) VALUES (1, N'Charles', N'Dickens', 34, N'charle@aa.com', N'12', N'London', 1, 1)
INSERT [dbo].[Persons] ([Id], [Name], [Surname], [Age], [Email], [Password], [Adress], [PositionId], [SalaryId]) VALUES (2, N'Albert', N'Camus', 23, N'jalbert@aa.com', N'Camus', N'Hamburg', 1, 1)
INSERT [dbo].[Persons] ([Id], [Name], [Surname], [Age], [Email], [Password], [Adress], [PositionId], [SalaryId]) VALUES (4, N'Stefan', N'Zweig', 32, N'stefan@aa.com', N'323', N'Milano', 1, 1)
INSERT [dbo].[Persons] ([Id], [Name], [Surname], [Age], [Email], [Password], [Adress], [PositionId], [SalaryId]) VALUES (5, N'Stefan2', N'Zweig', 32, N'stefan@aa.com', N'323', N'Milano', 1, 1)
INSERT [dbo].[Persons] ([Id], [Name], [Surname], [Age], [Email], [Password], [Adress], [PositionId], [SalaryId]) VALUES (7, N'Danupdate', N'Brownupdate', 40, N'dan@dan.com2', N'45522', NULL, 2, 1)
SET IDENTITY_INSERT [dbo].[Persons] OFF
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([PositionId], [Name], [DepartmentId]) VALUES (1, N'Position1', 1)
INSERT [dbo].[Positions] ([PositionId], [Name], [DepartmentId]) VALUES (2, N'Position2', 1)
INSERT [dbo].[Positions] ([PositionId], [Name], [DepartmentId]) VALUES (3, N'Position3', 2)
SET IDENTITY_INSERT [dbo].[Positions] OFF
SET IDENTITY_INSERT [dbo].[Salaries] ON 

INSERT [dbo].[Salaries] ([SalaryId], [Amount]) VALUES (1, 550)
INSERT [dbo].[Salaries] ([SalaryId], [Amount]) VALUES (2, 600)
INSERT [dbo].[Salaries] ([SalaryId], [Amount]) VALUES (5, 460)
INSERT [dbo].[Salaries] ([SalaryId], [Amount]) VALUES (6, 720)
INSERT [dbo].[Salaries] ([SalaryId], [Amount]) VALUES (8, 6000)
SET IDENTITY_INSERT [dbo].[Salaries] OFF
/****** Object:  Index [IX_PersonDetails_PersonId]    Script Date: 4.01.2022 11:08:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PersonDetails_PersonId] ON [dbo].[PersonDetails]
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Persons_PositionId]    Script Date: 4.01.2022 11:08:55 ******/
CREATE NONCLUSTERED INDEX [IX_Persons_PositionId] ON [dbo].[Persons]
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Persons_SalaryId]    Script Date: 4.01.2022 11:08:55 ******/
CREATE NONCLUSTERED INDEX [IX_Persons_SalaryId] ON [dbo].[Persons]
(
	[SalaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Positions_DepartmentId]    Script Date: 4.01.2022 11:08:55 ******/
CREATE NONCLUSTERED INDEX [IX_Positions_DepartmentId] ON [dbo].[Positions]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PersonDetails]  WITH CHECK ADD  CONSTRAINT [FK_PersonDetails_Persons_PersonId] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonDetails] CHECK CONSTRAINT [FK_PersonDetails_Persons_PersonId]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Positions_PositionId] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Positions] ([PositionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Positions_PositionId]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Salaries_SalaryId] FOREIGN KEY([SalaryId])
REFERENCES [dbo].[Salaries] ([SalaryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Salaries_SalaryId]
GO
ALTER TABLE [dbo].[Positions]  WITH CHECK ADD  CONSTRAINT [FK_Positions_Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Positions] CHECK CONSTRAINT [FK_Positions_Departments_DepartmentId]
GO
USE [master]
GO
ALTER DATABASE [APIDB] SET  READ_WRITE 
GO
