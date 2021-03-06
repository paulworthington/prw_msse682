USE [master]
GO
/****** Object:  Database [readerDB01]    Script Date: 11/4/2013 1:43:06 AM ******/
CREATE DATABASE [readerDB01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'readerDB01', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\readerDB01.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'readerDB01_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\readerDB01_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [readerDB01] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [readerDB01].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [readerDB01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [readerDB01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [readerDB01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [readerDB01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [readerDB01] SET ARITHABORT OFF 
GO
ALTER DATABASE [readerDB01] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [readerDB01] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [readerDB01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [readerDB01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [readerDB01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [readerDB01] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [readerDB01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [readerDB01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [readerDB01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [readerDB01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [readerDB01] SET  DISABLE_BROKER 
GO
ALTER DATABASE [readerDB01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [readerDB01] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [readerDB01] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [readerDB01] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [readerDB01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [readerDB01] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [readerDB01] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [readerDB01] SET RECOVERY FULL 
GO
ALTER DATABASE [readerDB01] SET  MULTI_USER 
GO
ALTER DATABASE [readerDB01] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [readerDB01] SET DB_CHAINING OFF 
GO
ALTER DATABASE [readerDB01] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [readerDB01] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [readerDB01]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 11/4/2013 1:43:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Book](
	[bookID] [int] IDENTITY(1,1) NOT NULL,
	[bookNumber] [int] NULL,
	[bookTitle] [varchar](50) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 11/4/2013 1:43:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[itemID] [int] IDENTITY(1,1) NOT NULL,
	[itemName] [varchar](50) NULL,
	[itemType] [varchar](50) NULL,
	[firstMentionBook] [int] NULL,
	[firstMentionChapter] [int] NULL,
	[eventDate] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemDescription]    Script Date: 11/4/2013 1:43:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemDescription](
	[itemDescID] [int] IDENTITY(1,1) NOT NULL,
	[itemID] [int] NULL,
	[bookNumber] [int] NULL,
	[description] [varchar](500) NULL,
 CONSTRAINT [PK_ItemDescription] PRIMARY KEY CLUSTERED 
(
	[itemDescID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 11/4/2013 1:43:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemType](
	[itemTypeID] [int] IDENTITY(1,1) NOT NULL,
	[itemTypeDesc] [varchar](50) NULL,
 CONSTRAINT [PK_ItemType] PRIMARY KEY CLUSTERED 
(
	[itemTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SpoilerFilter]    Script Date: 11/4/2013 1:43:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpoilerFilter](
	[spoilerFilterID] [int] IDENTITY(1,1) NOT NULL,
	[latestBookRead] [int] NULL,
 CONSTRAINT [PK_SpoilerFilter] PRIMARY KEY CLUSTERED 
(
	[spoilerFilterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 11/4/2013 1:43:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NULL,
	[userPass] [varchar](50) NULL,
	[userType] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ItemDescription]  WITH CHECK ADD  CONSTRAINT [FK_ItemDescription_Item] FOREIGN KEY([itemID])
REFERENCES [dbo].[Item] ([itemID])
GO
ALTER TABLE [dbo].[ItemDescription] CHECK CONSTRAINT [FK_ItemDescription_Item]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'make sure each item description has an item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemDescription', @level2type=N'CONSTRAINT',@level2name=N'FK_ItemDescription_Item'
GO
USE [master]
GO
ALTER DATABASE [readerDB01] SET  READ_WRITE 
GO
