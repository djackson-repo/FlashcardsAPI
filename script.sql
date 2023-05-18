USE [master]
GO
/****** Object:  Database [Decks]    Script Date: 5/17/2023 8:57:40 PM ******/
CREATE DATABASE [Decks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Decks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\Decks.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Decks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\Decks_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Decks] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Decks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Decks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Decks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Decks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Decks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Decks] SET ARITHABORT OFF 
GO
ALTER DATABASE [Decks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Decks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Decks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Decks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Decks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Decks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Decks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Decks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Decks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Decks] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Decks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Decks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Decks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Decks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Decks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Decks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Decks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Decks] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Decks] SET  MULTI_USER 
GO
ALTER DATABASE [Decks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Decks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Decks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Decks] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Decks] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Decks] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Decks] SET QUERY_STORE = ON
GO
ALTER DATABASE [Decks] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Decks]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 5/17/2023 8:57:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[CardId] [bigint] IDENTITY(1,1) NOT NULL,
	[Front] [nvarchar](50) NULL,
	[Back] [nvarchar](50) NULL,
	[DeckId] [bigint] NULL,
	[Times_Studied] [bigint] NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deck]    Script Date: 5/17/2023 8:57:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deck](
	[DeckId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[UserID] [bigint] NULL,
	[TagId] [bigint] NULL,
 CONSTRAINT [PK_Deck] PRIMARY KEY CLUSTERED 
(
	[DeckId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Progress]    Script Date: 5/17/2023 8:57:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Progress](
	[ProgressId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[DeckId] [bigint] NULL,
	[Cards_Studied] [bigint] NULL,
	[Cards_Mastered] [bigint] NULL,
 CONSTRAINT [PK_Progress] PRIMARY KEY CLUSTERED 
(
	[ProgressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 5/17/2023 8:57:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[TagId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/17/2023 8:57:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_Deck] FOREIGN KEY([DeckId])
REFERENCES [dbo].[Deck] ([DeckId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_Deck]
GO
ALTER TABLE [dbo].[Deck]  WITH CHECK ADD  CONSTRAINT [FK_Deck_Tag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([TagId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Deck] CHECK CONSTRAINT [FK_Deck_Tag]
GO
ALTER TABLE [dbo].[Deck]  WITH CHECK ADD  CONSTRAINT [FK_Deck_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Deck] CHECK CONSTRAINT [FK_Deck_User]
GO
ALTER TABLE [dbo].[Progress]  WITH CHECK ADD  CONSTRAINT [FK_Progress_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Progress] CHECK CONSTRAINT [FK_Progress_User]
GO
USE [master]
GO
ALTER DATABASE [Decks] SET  READ_WRITE 
GO
