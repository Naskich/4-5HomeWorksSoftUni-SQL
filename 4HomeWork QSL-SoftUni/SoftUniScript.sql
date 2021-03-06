USE [master]
GO
/****** Object:  Database [SoftUni]    Script Date: 25.7.2016 г. 17:04:04 ******/
CREATE DATABASE [SoftUni]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SoftUni', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NASKICH\MSSQL\DATA\SoftUni.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SoftUni_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NASKICH\MSSQL\DATA\SoftUni_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SoftUni] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SoftUni].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SoftUni] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SoftUni] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SoftUni] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SoftUni] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SoftUni] SET ARITHABORT OFF 
GO
ALTER DATABASE [SoftUni] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SoftUni] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SoftUni] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SoftUni] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SoftUni] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SoftUni] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SoftUni] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SoftUni] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SoftUni] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SoftUni] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SoftUni] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SoftUni] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SoftUni] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SoftUni] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SoftUni] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SoftUni] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SoftUni] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SoftUni] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SoftUni] SET  MULTI_USER 
GO
ALTER DATABASE [SoftUni] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SoftUni] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SoftUni] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SoftUni] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SoftUni] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SoftUni]
GO
/****** Object:  User [naskich]    Script Date: 25.7.2016 г. 17:04:04 ******/
CREATE USER [naskich] FOR LOGIN [naskich] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 25.7.2016 г. 17:04:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressText] [nvarchar](100) NOT NULL,
	[TownID] [int] NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 25.7.2016 г. 17:04:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ManagerID] [int] NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 25.7.2016 г. 17:04:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[ManagerID] [int] NULL,
	[HireDate] [smalldatetime] NOT NULL,
	[Salary] [money] NOT NULL,
	[AddressID] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeesProjects]    Script Date: 25.7.2016 г. 17:04:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesProjects](
	[EmployeeID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
 CONSTRAINT [PK_EmployeesProjects] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 25.7.2016 г. 17:04:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [ntext] NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Towns]    Script Date: 25.7.2016 г. 17:04:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[TownID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[TownID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Towns] FOREIGN KEY([TownID])
REFERENCES [dbo].[Towns] ([TownID])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Towns]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Employees] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Employees]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Addresses] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Addresses]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[EmployeesProjects]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesProjects_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeesProjects] CHECK CONSTRAINT [FK_EmployeesProjects_Employees]
GO
ALTER TABLE [dbo].[EmployeesProjects]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesProjects_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[EmployeesProjects] CHECK CONSTRAINT [FK_EmployeesProjects_Projects]
GO
USE [master]
GO
ALTER DATABASE [SoftUni] SET  READ_WRITE 
GO
