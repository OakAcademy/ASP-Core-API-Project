USE [master]
GO
/****** Object:  Database [PersonalTracking]    Script Date: 14/11/2021 00:46:45 ******/
CREATE DATABASE [PersonalTracking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PersonalTracking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PersonalTracking.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PersonalTracking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PersonalTracking_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PersonalTracking] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PersonalTracking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PersonalTracking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PersonalTracking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PersonalTracking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PersonalTracking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PersonalTracking] SET ARITHABORT OFF 
GO
ALTER DATABASE [PersonalTracking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PersonalTracking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PersonalTracking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PersonalTracking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PersonalTracking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PersonalTracking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PersonalTracking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PersonalTracking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PersonalTracking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PersonalTracking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PersonalTracking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PersonalTracking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PersonalTracking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PersonalTracking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PersonalTracking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PersonalTracking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PersonalTracking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PersonalTracking] SET RECOVERY FULL 
GO
ALTER DATABASE [PersonalTracking] SET  MULTI_USER 
GO
ALTER DATABASE [PersonalTracking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PersonalTracking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PersonalTracking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PersonalTracking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PersonalTracking] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PersonalTracking', N'ON'
GO
USE [PersonalTracking]
GO
/****** Object:  Table [dbo].[DEPARTMENT]    Script Date: 14/11/2021 00:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEPARTMENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NULL,
 CONSTRAINT [PK_DEPARTMENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 14/11/2021 00:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserNo] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Surname] [varchar](50) NULL,
	[ImagePath] [varchar](max) NULL,
	[DepartmentID] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
	[Salary] [int] NOT NULL,
	[Birthday] [date] NULL,
	[Adress] [varchar](max) NULL,
	[isAdmin] [bit] NOT NULL,
	[Password] [varchar](10) NULL,
 CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERMISSION]    Script Date: 14/11/2021 00:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERMISSION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[UserNo] [int] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[PermissionState] [int] NOT NULL,
	[Explanation] [varchar](max) NULL,
	[PermissionAmount] [int] NOT NULL,
 CONSTRAINT [PK_PERMISSION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERMISSONSTATE]    Script Date: 14/11/2021 00:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERMISSONSTATE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionState] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PERMISSONSTATE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[POSITION]    Script Date: 14/11/2021 00:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POSITION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [varchar](50) NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_POSITION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALARY]    Script Date: 14/11/2021 00:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALARY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_SALARY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SALARYMONTH]    Script Date: 14/11/2021 00:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALARYMONTH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MonthName] [varchar](10) NULL,
 CONSTRAINT [PK_SALARYMONTH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TASK]    Script Date: 14/11/2021 00:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TASK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[TaskStartDate] [date] NULL,
	[TaskDeliveryDate] [date] NULL,
	[TaskState] [int] NULL,
	[TaskTitle] [varchar](50) NULL,
	[TaskContent] [varchar](max) NULL,
 CONSTRAINT [PK_TASK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TASKSTATE]    Script Date: 14/11/2021 00:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TASKSTATE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameState] [varchar](15) NOT NULL,
 CONSTRAINT [PK_TASKSTATE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DEPARTMENT] ON 

INSERT [dbo].[DEPARTMENT] ([ID], [DepartmentName]) VALUES (1, N'Department1')
INSERT [dbo].[DEPARTMENT] ([ID], [DepartmentName]) VALUES (2, N'Department2')
INSERT [dbo].[DEPARTMENT] ([ID], [DepartmentName]) VALUES (3, N'Department3')
INSERT [dbo].[DEPARTMENT] ([ID], [DepartmentName]) VALUES (12, N'Department4')
SET IDENTITY_INSERT [dbo].[DEPARTMENT] OFF
SET IDENTITY_INSERT [dbo].[EMPLOYEE] ON 

INSERT [dbo].[EMPLOYEE] ([ID], [UserNo], [Name], [Surname], [ImagePath], [DepartmentID], [PositionID], [Salary], [Birthday], [Adress], [isAdmin], [Password]) VALUES (3, 1, N'Charles', N'Dickens', N'b52c5917-3111-44a7-8e0d-b8cccccf7fed13.jpg', 1, 4, 1200, CAST(N'2021-10-10' AS Date), N'London


', 1, N'1')
INSERT [dbo].[EMPLOYEE] ([ID], [UserNo], [Name], [Surname], [ImagePath], [DepartmentID], [PositionID], [Salary], [Birthday], [Adress], [isAdmin], [Password]) VALUES (6, 24, N'Aldous', N'Huxley', N'a6e18831-d5e6-45eb-b116-b4578238670213.jpg', 12, 6, 300, CAST(N'2021-10-30' AS Date), N'sfsfsff
', 0, N'4')
SET IDENTITY_INSERT [dbo].[EMPLOYEE] OFF
SET IDENTITY_INSERT [dbo].[PERMISSION] ON 

INSERT [dbo].[PERMISSION] ([ID], [EmployeeID], [UserNo], [StartDate], [EndDate], [PermissionState], [Explanation], [PermissionAmount]) VALUES (1012, 3, 1, CAST(N'2021-10-11' AS Date), CAST(N'2021-10-22' AS Date), 1, N'dwdwf22', 11)
INSERT [dbo].[PERMISSION] ([ID], [EmployeeID], [UserNo], [StartDate], [EndDate], [PermissionState], [Explanation], [PermissionAmount]) VALUES (1013, 3, 1, CAST(N'2021-10-12' AS Date), CAST(N'2021-10-24' AS Date), 1, N'f', 12)
INSERT [dbo].[PERMISSION] ([ID], [EmployeeID], [UserNo], [StartDate], [EndDate], [PermissionState], [Explanation], [PermissionAmount]) VALUES (1014, 3, 1, CAST(N'2021-08-13' AS Date), CAST(N'2021-09-01' AS Date), 1, N'rhg', 19)
SET IDENTITY_INSERT [dbo].[PERMISSION] OFF
SET IDENTITY_INSERT [dbo].[PERMISSONSTATE] ON 

INSERT [dbo].[PERMISSONSTATE] ([ID], [PermissionState]) VALUES (1, N'On Admin')
INSERT [dbo].[PERMISSONSTATE] ([ID], [PermissionState]) VALUES (2, N'Approved')
INSERT [dbo].[PERMISSONSTATE] ([ID], [PermissionState]) VALUES (3, N'DisApproved')
SET IDENTITY_INSERT [dbo].[PERMISSONSTATE] OFF
SET IDENTITY_INSERT [dbo].[POSITION] ON 

INSERT [dbo].[POSITION] ([ID], [PositionName], [DepartmentID]) VALUES (4, N'Position3', 1)
INSERT [dbo].[POSITION] ([ID], [PositionName], [DepartmentID]) VALUES (5, N'Position2', 2)
INSERT [dbo].[POSITION] ([ID], [PositionName], [DepartmentID]) VALUES (6, N'Position4', 12)
INSERT [dbo].[POSITION] ([ID], [PositionName], [DepartmentID]) VALUES (10, N'NewPosition', 3)
INSERT [dbo].[POSITION] ([ID], [PositionName], [DepartmentID]) VALUES (11, N'LastPosition', 12)
SET IDENTITY_INSERT [dbo].[POSITION] OFF
SET IDENTITY_INSERT [dbo].[SALARY] ON 

INSERT [dbo].[SALARY] ([ID], [EmployeeID], [Amount], [Month], [Year]) VALUES (2, 3, 800, 2, 2021)
INSERT [dbo].[SALARY] ([ID], [EmployeeID], [Amount], [Month], [Year]) VALUES (3, 3, 1200, 6, 2021)
INSERT [dbo].[SALARY] ([ID], [EmployeeID], [Amount], [Month], [Year]) VALUES (7, 6, 300, 3, 2021)
SET IDENTITY_INSERT [dbo].[SALARY] OFF
SET IDENTITY_INSERT [dbo].[SALARYMONTH] ON 

INSERT [dbo].[SALARYMONTH] ([ID], [MonthName]) VALUES (1, N'January')
INSERT [dbo].[SALARYMONTH] ([ID], [MonthName]) VALUES (2, N'February')
INSERT [dbo].[SALARYMONTH] ([ID], [MonthName]) VALUES (3, N'March')
INSERT [dbo].[SALARYMONTH] ([ID], [MonthName]) VALUES (4, N'April')
INSERT [dbo].[SALARYMONTH] ([ID], [MonthName]) VALUES (5, N'May')
INSERT [dbo].[SALARYMONTH] ([ID], [MonthName]) VALUES (6, N'June')
INSERT [dbo].[SALARYMONTH] ([ID], [MonthName]) VALUES (7, N'July')
INSERT [dbo].[SALARYMONTH] ([ID], [MonthName]) VALUES (8, N'Augst')
INSERT [dbo].[SALARYMONTH] ([ID], [MonthName]) VALUES (9, N'September')
INSERT [dbo].[SALARYMONTH] ([ID], [MonthName]) VALUES (10, N'October')
INSERT [dbo].[SALARYMONTH] ([ID], [MonthName]) VALUES (11, N'November')
INSERT [dbo].[SALARYMONTH] ([ID], [MonthName]) VALUES (12, N'December')
SET IDENTITY_INSERT [dbo].[SALARYMONTH] OFF
SET IDENTITY_INSERT [dbo].[TASK] ON 

INSERT [dbo].[TASK] ([ID], [EmployeeID], [TaskStartDate], [TaskDeliveryDate], [TaskState], [TaskTitle], [TaskContent]) VALUES (3, 3, CAST(N'2021-10-08' AS Date), NULL, 1, N'Task1', N'Task1 details')
INSERT [dbo].[TASK] ([ID], [EmployeeID], [TaskStartDate], [TaskDeliveryDate], [TaskState], [TaskTitle], [TaskContent]) VALUES (4, 6, CAST(N'2021-11-20' AS Date), NULL, 1, N'Task2', N'Detail')
INSERT [dbo].[TASK] ([ID], [EmployeeID], [TaskStartDate], [TaskDeliveryDate], [TaskState], [TaskTitle], [TaskContent]) VALUES (5, 3, CAST(N'2021-10-15' AS Date), NULL, 1, N'Task 32', N'Task 32 Detail')
INSERT [dbo].[TASK] ([ID], [EmployeeID], [TaskStartDate], [TaskDeliveryDate], [TaskState], [TaskTitle], [TaskContent]) VALUES (6, 3, CAST(N'2021-10-01' AS Date), NULL, 1, N'Task 4', N'Tasks all')
SET IDENTITY_INSERT [dbo].[TASK] OFF
SET IDENTITY_INSERT [dbo].[TASKSTATE] ON 

INSERT [dbo].[TASKSTATE] ([ID], [NameState]) VALUES (1, N'On Employee')
INSERT [dbo].[TASKSTATE] ([ID], [NameState]) VALUES (2, N'Delivered')
INSERT [dbo].[TASKSTATE] ([ID], [NameState]) VALUES (3, N'Approved')
SET IDENTITY_INSERT [dbo].[TASKSTATE] OFF
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEE_DEPARTMENT] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[DEPARTMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EMPLOYEE] CHECK CONSTRAINT [FK_EMPLOYEE_DEPARTMENT]
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEE_POSITION] FOREIGN KEY([PositionID])
REFERENCES [dbo].[POSITION] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EMPLOYEE] CHECK CONSTRAINT [FK_EMPLOYEE_POSITION]
GO
ALTER TABLE [dbo].[PERMISSION]  WITH CHECK ADD  CONSTRAINT [FK_PERMISSION_EMPLOYEE] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EMPLOYEE] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PERMISSION] CHECK CONSTRAINT [FK_PERMISSION_EMPLOYEE]
GO
ALTER TABLE [dbo].[PERMISSION]  WITH CHECK ADD  CONSTRAINT [FK_PERMISSION_PERMISSONSTATE] FOREIGN KEY([PermissionState])
REFERENCES [dbo].[PERMISSONSTATE] ([ID])
GO
ALTER TABLE [dbo].[PERMISSION] CHECK CONSTRAINT [FK_PERMISSION_PERMISSONSTATE]
GO
ALTER TABLE [dbo].[POSITION]  WITH CHECK ADD  CONSTRAINT [FK_POSITION_DEPARTMENT] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[DEPARTMENT] ([ID])
GO
ALTER TABLE [dbo].[POSITION] CHECK CONSTRAINT [FK_POSITION_DEPARTMENT]
GO
ALTER TABLE [dbo].[SALARY]  WITH CHECK ADD  CONSTRAINT [FK_SALARY_EMPLOYEE] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EMPLOYEE] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SALARY] CHECK CONSTRAINT [FK_SALARY_EMPLOYEE]
GO
ALTER TABLE [dbo].[SALARY]  WITH CHECK ADD  CONSTRAINT [FK_SALARY_SALARYMONTH] FOREIGN KEY([Month])
REFERENCES [dbo].[SALARYMONTH] ([ID])
GO
ALTER TABLE [dbo].[SALARY] CHECK CONSTRAINT [FK_SALARY_SALARYMONTH]
GO
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [FK_TASK_EMPLOYEE] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EMPLOYEE] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [FK_TASK_EMPLOYEE]
GO
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD  CONSTRAINT [FK_TASK_TASKSTATE] FOREIGN KEY([TaskState])
REFERENCES [dbo].[TASKSTATE] ([ID])
GO
ALTER TABLE [dbo].[TASK] CHECK CONSTRAINT [FK_TASK_TASKSTATE]
GO
/****** Object:  Trigger [dbo].[delete_employee]    Script Date: 14/11/2021 00:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[delete_employee] on [dbo].[EMPLOYEE]
after delete as 
Begin
declare @id int
select @id=ID from deleted
delete from TASK where EmployeeID=@id
delete from SALARY where EmployeeID=@id
delete from PERMISSION where EmployeeID=@id
end
GO
/****** Object:  Trigger [dbo].[delete_position]    Script Date: 14/11/2021 00:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[delete_position] ON [dbo].[POSITION]
after delete as

BEGIN
declare @id int
select @id=ID from deleted
delete from EMPLOYEE where PositionID=@id
END
GO
USE [master]
GO
ALTER DATABASE [PersonalTracking] SET  READ_WRITE 
GO
