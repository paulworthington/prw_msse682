USE [master]
GO
/****** Object:  Database [readerDB01]    Script Date: 12/3/2013 9:18:57 PM ******/
CREATE DATABASE [readerDB01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'readerDB01', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\readerDB01.mdf' , SIZE = 5000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[Book]    Script Date: 12/3/2013 9:18:57 PM ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 12/3/2013 9:18:57 PM ******/
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
/****** Object:  Table [dbo].[ItemDescription]    Script Date: 12/3/2013 9:18:57 PM ******/
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
/****** Object:  Table [dbo].[ItemType]    Script Date: 12/3/2013 9:18:57 PM ******/
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
/****** Object:  Table [dbo].[SpoilerFilter]    Script Date: 12/3/2013 9:18:57 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 12/3/2013 9:18:57 PM ******/
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
SET IDENTITY_INSERT [dbo].[Item] ON 

GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (3, N'Travis Wilder', N'person', 1, 1, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (5, N'Travis Wilder', N'person', 1, 1, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (7, N'Bart Simpson', N'person', 0, 0, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (8, N'Colfax Avenue', N'place', 0, 9, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (9, N'Pearl River', N'thing', 0, 4, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (10, N'half-coin', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (11, N'Colfax Avenue', N'place', 1, 18, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (12, N'half-coin System.Random', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (14, N'half-coin System.Random', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (16, N'test item System.Random', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (17, N'half-coin System.Random', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (19, N'test item System.Random', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (20, N'half-coin System.Random', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (22, N'test item System.Random', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (23, N'half-coin 680', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (25, N'test item 538', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (26, N'half-coin 791', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (28, N'test item 930', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (29, N'half-coin 516', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (31, N'test item 536', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (32, N'half-coin 879', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (34, N'test item 378', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (35, N'half-coin 301', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (37, N'test item 906', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (38, N'half-coin 985', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (40, N'test item 842', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (41, N'half-coin 675', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (43, N'test item 696', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (45, N'half-coin 754', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (47, N'test item 90', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (49, N'service test half-coin 399', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (50, N'service test half-coin 2', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (51, N'test item 112', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (52, N'service test half-coin 91', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (53, N'service test half-coin 48', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (54, N'service test half-coin 506', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (55, N'factory test Pearl River 76', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (56, N'Bart Simpson 503', N'person', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (57, N'Bart Simpson 262', N'person', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (60, N'mgr test Lisa Simpson 996', N'person', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (61, N'mgr test Lisa Simpson 488', N'person', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (62, N'mgr test Lisa Simpson 167', N'person', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (63, N'mgr test Lisa Simpson 41', N'person', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (64, N'mgr test half-coin 72', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (65, N'service test Bart Simpson 158', N'person', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (66, N'mgr del test Denver 240', N'place', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (68, N'mgr del test Denver 476', N'place', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (70, N'mgr test half-coin 278', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (71, N'mgr test half-coin 80', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (72, N'mgr test Lisa Simpson 45', N'person', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (73, N'half-coin 348', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (75, N'repo test item 487', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (77, N'service test half-coin 954', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (79, N'service test Bart Simpson 452', N'person', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (80, N'factory test Pearl River 811', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (81, N'mgr test half-coin 698', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (82, N'mgr test Lisa Simpson 110', N'person', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (83, N'half-coin 413', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (85, N'repo test item 75', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (87, N'service test half-coin 19', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (89, N'service test Bart Simpson 517', N'person', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (90, N'factory test Pearl River 876', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (91, N'mgr test half-coin 924', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (92, N'mgr test Lisa Simpson 443', N'person', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (93, N'half-coin 367', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (95, N'repo test item 29', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (97, N'service test half-coin 973', N'thing', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (99, N'service test Bart Simpson 472', N'person', 0, 3, NULL)
GO
INSERT [dbo].[Item] ([itemID], [itemName], [itemType], [firstMentionBook], [firstMentionChapter], [eventDate]) VALUES (100, N'factory test Pearl River 830', N'thing', 0, 3, NULL)
GO
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemDescription] ON 

GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (1, 3, 0, N'Travis Wilder is the owner of the Mine Shaft Saloon in Castle City, Colorado. He is tall, lean, and 33 years old. Travis has a beard, pale blond hair, and he wears wire-rimmed glasses.')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (2, 5, 0, N'Travis Wilder is the owner of the Mine Shaft Saloon in Castle City, Colorado. He is tall, lean, and 33 years old. Travis has a beard, pale blond hair, and he wears wire-rimmed glasses.')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (3, 7, 1, N'Bart Simpson is the oldest child of Homer and Marge Simpson.')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (4, 8, 0, N'Colfax Avenue is the historic main east-west thoroughfare in downtown Denver.')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (5, 9, 0, N'The Pearl River forms part of the boundary between Louisiana and Mississippi.')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (6, 10, 0, N'The half-coin given to Grace Beckett by Brother Cy enables her to understand languages other than English.')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (7, 12, 0, N'The half-coin given to Grace Beckett by Brother Cy System.Random')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (8, 14, 0, N'The half-coin given to Grace Beckett by Brother Cy System.Random')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (9, 16, 0, N'This is test item number System.Random')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (10, 17, 0, N'The half-coin given to Grace Beckett by Brother Cy System.Random')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (11, 19, 0, N'This is test item number System.Random')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (12, 20, 0, N'The half-coin given to Grace Beckett by Brother Cy System.Random')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (13, 22, 0, N'This is test item number System.Random')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (14, 23, 0, N'The half-coin given to Grace Beckett by Brother Cy System.Random')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (15, 25, 0, N'This is test item number 538')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (16, 26, 0, N'The half-coin given to Grace Beckett by Brother Cy System.Random')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (17, 28, 0, N'This is test item number 930')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (18, 29, 0, N'The half-coin given to Grace Beckett by Brother Cy System.Random')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (19, 31, 0, N'This is test item number 536')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (20, 32, 0, N'The half-coin given to Grace Beckett by Brother Cy System.Random')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (21, 34, 0, N'This is test item number 378')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (22, 35, 0, N'The half-coin given to Grace Beckett by Brother Cy System.Random')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (23, 37, 0, N'This is test item number 906')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (24, 38, 0, N'The half-coin given to Grace Beckett by Brother Cy System.Random')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (25, 40, 0, N'This is test item number 842')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (26, 41, 0, N'The half-coin given to Grace Beckett by Brother Cy System.Random')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (27, 43, 0, N'This is test item number 696')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (28, 45, 0, N'The half-coin given to Grace Beckett by Brother Cy System.Random')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (29, 47, 0, N'This is test item number 90')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (32, 51, 0, N'This is test item number 112')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (33, 52, 0, N'service test The half-coin given to Grace Beckett by Brother Cy 91')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (34, 53, 0, N'service test The half-coin given to Grace Beckett by Brother Cy 48')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (35, 54, 0, N'service test The half-coin given to Grace Beckett by Brother Cy 506')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (36, 55, 0, N'factory test The Pearl River forms one of the boundaries between Louisiana and Mississippi 76')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (37, 56, 0, N'service test Bart Simpson 503')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (38, 57, 0, N'service test Bart Simpson 262')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (39, 60, 0, N'mgr test Lisa Simpson 996')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (40, 61, 0, N'mgr test Lisa Simpson 488')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (41, 62, 0, N'mgr test Lisa Simpson 167')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (42, 63, 0, N'mgr test Lisa Simpson 41')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (43, 64, 0, N'mgr test The half-coin given to Grace Beckett by Brother Cy 72')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (44, 65, 0, N'service test Bart Simpson 158')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (45, 70, 0, N'mgr test The half-coin given to Grace Beckett by Brother Cy 278')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (46, 71, 0, N'mgr test The half-coin given to Grace Beckett by Brother Cy 80')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (47, 72, 0, N'mgr test Lisa Simpson 45')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (48, 73, 0, N'The half-coin given to Grace Beckett by Brother Cy 348')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (49, 75, 0, N'This is repo test item number 487')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (50, 77, 0, N'service test The half-coin given to Grace Beckett by Brother Cy 954')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (51, 79, 0, N'service test Bart Simpson 452')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (52, 80, 0, N'factory test The Pearl River forms one of the boundaries between Louisiana and Mississippi 811')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (53, 81, 0, N'mgr test The half-coin given to Grace Beckett by Brother Cy 698')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (54, 82, 0, N'mgr test Lisa Simpson 110')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (55, 83, 0, N'The half-coin given to Grace Beckett by Brother Cy 413')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (56, 85, 0, N'This is repo test item number 75')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (57, 87, 0, N'service test The half-coin given to Grace Beckett by Brother Cy 19')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (58, 89, 0, N'service test Bart Simpson 517')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (59, 90, 0, N'factory test The Pearl River forms one of the boundaries between Louisiana and Mississippi 876')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (60, 91, 0, N'mgr test The half-coin given to Grace Beckett by Brother Cy 924')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (61, 92, 0, N'mgr test Lisa Simpson 443')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (62, 93, 0, N'The half-coin given to Grace Beckett by Brother Cy 367')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (63, 95, 0, N'This is repo test item number 29')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (64, 97, 0, N'service test The half-coin given to Grace Beckett by Brother Cy 973')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (65, 99, 0, N'service test Bart Simpson 472')
GO
INSERT [dbo].[ItemDescription] ([itemDescID], [itemID], [bookNumber], [description]) VALUES (66, 100, 0, N'factory test The Pearl River forms one of the boundaries between Louisiana and Mississippi 830')
GO
SET IDENTITY_INSERT [dbo].[ItemDescription] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

GO
INSERT [dbo].[User] ([userID], [userName], [userPass], [userType]) VALUES (4, N'nflanders', N'abcdefgh', N'0')
GO
INSERT [dbo].[User] ([userID], [userName], [userPass], [userType]) VALUES (6, N'hsimpson', N'12345678', N'0')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
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
