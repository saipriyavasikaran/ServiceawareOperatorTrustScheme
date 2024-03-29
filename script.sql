USE [master]
GO
/****** Object:  Database [multicloud]    Script Date: 09/01/2015 12:33:01 ******/
CREATE DATABASE [multicloud] ON  PRIMARY 
( NAME = N'multicloud', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.UMA\MSSQL\DATA\multicloud.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'multicloud_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.UMA\MSSQL\DATA\multicloud_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [multicloud] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [multicloud].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [multicloud] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [multicloud] SET ANSI_NULLS OFF
GO
ALTER DATABASE [multicloud] SET ANSI_PADDING OFF
GO
ALTER DATABASE [multicloud] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [multicloud] SET ARITHABORT OFF
GO
ALTER DATABASE [multicloud] SET AUTO_CLOSE ON
GO
ALTER DATABASE [multicloud] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [multicloud] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [multicloud] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [multicloud] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [multicloud] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [multicloud] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [multicloud] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [multicloud] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [multicloud] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [multicloud] SET  DISABLE_BROKER
GO
ALTER DATABASE [multicloud] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [multicloud] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [multicloud] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [multicloud] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [multicloud] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [multicloud] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [multicloud] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [multicloud] SET  READ_WRITE
GO
ALTER DATABASE [multicloud] SET RECOVERY FULL
GO
ALTER DATABASE [multicloud] SET  MULTI_USER
GO
ALTER DATABASE [multicloud] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [multicloud] SET DB_CHAINING OFF
GO
USE [multicloud]
GO
/****** Object:  Table [dbo].[Tbl_upload]    Script Date: 09/01/2015 12:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_upload](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[filename] [nvarchar](50) NULL,
	[filepath] [nvarchar](max) NULL,
	[fileextension] [nvarchar](50) NULL,
	[secretkey] [nvarchar](50) NULL,
	[filepath1] [nvarchar](max) NULL,
	[filepath2] [nvarchar](max) NULL,
	[filepath3] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_upload] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_service]    Script Date: 09/01/2015 12:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[servicename] [nvarchar](50) NULL,
	[policy] [nvarchar](50) NULL,
	[aboutus] [nvarchar](max) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_registration]    Script Date: 09/01/2015 12:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_registration](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Re_Password] [nvarchar](50) NULL,
	[EmailId] [nvarchar](50) NULL,
	[CloudService] [nvarchar](50) NULL,
	[Mobile] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_message]    Script Date: 09/01/2015 12:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_message](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[subject] [nvarchar](100) NULL,
	[message] [nvarchar](max) NULL,
	[email] [nvarchar](100) NULL,
	[replymessage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_message] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
