USE [master]
GO
/****** Object:  Database [HelpDeskDB]    Script Date: 21.03.2023 22:51:04 ******/
CREATE DATABASE [HelpDeskDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AuthDB', FILENAME = N'E:\SQLServer\MSSQL15.MSSQLSERVER\MSSQL\DATA\AuthDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AuthDB_log', FILENAME = N'E:\SQLServer\MSSQL15.MSSQLSERVER\MSSQL\DATA\AuthDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HelpDeskDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HelpDeskDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HelpDeskDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HelpDeskDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HelpDeskDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HelpDeskDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HelpDeskDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HelpDeskDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HelpDeskDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HelpDeskDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HelpDeskDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HelpDeskDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HelpDeskDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HelpDeskDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HelpDeskDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HelpDeskDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HelpDeskDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HelpDeskDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HelpDeskDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HelpDeskDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HelpDeskDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HelpDeskDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HelpDeskDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HelpDeskDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HelpDeskDB] SET RECOVERY FULL 
GO
ALTER DATABASE [HelpDeskDB] SET  MULTI_USER 
GO
ALTER DATABASE [HelpDeskDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HelpDeskDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HelpDeskDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HelpDeskDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HelpDeskDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HelpDeskDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HelpDeskDB', N'ON'
GO
ALTER DATABASE [HelpDeskDB] SET QUERY_STORE = OFF
GO
USE [HelpDeskDB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 21.03.2023 22:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 21.03.2023 22:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostName] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 21.03.2023 22:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkerId] [int] NULL,
	[AdminId] [int] NULL,
	[TaskText] [text] NULL,
	[TaskStatusId] [int] NULL,
	[TaskDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskStatus]    Script Date: 21.03.2023 22:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskStatusValue] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 21.03.2023 22:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](30) NULL,
	[PostId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 21.03.2023 22:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [UserId]) VALUES (1, 3)
INSERT [dbo].[Admin] ([Id], [UserId]) VALUES (2, 4)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [PostName]) VALUES (1, N'Admin')
INSERT [dbo].[Post] ([Id], [PostName]) VALUES (2, N'Worker')
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[TaskStatus] ON 

INSERT [dbo].[TaskStatus] ([Id], [TaskStatusValue]) VALUES (1, N'new')
INSERT [dbo].[TaskStatus] ([Id], [TaskStatusValue]) VALUES (2, N'in progress')
INSERT [dbo].[TaskStatus] ([Id], [TaskStatusValue]) VALUES (3, N'complete')
INSERT [dbo].[TaskStatus] ([Id], [TaskStatusValue]) VALUES (4, N'cancel')
SET IDENTITY_INSERT [dbo].[TaskStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [FirstName], [MiddleName], [LastName], [Login], [Password], [Email], [PhoneNumber], [PostId]) VALUES (1, N'Bober', N'Bobrovich', N'Bobrov', N'Bober028', N'NsRnjNfrjq180', N'Bober@mail.bobr', N'88005553535', 2)
INSERT [dbo].[User] ([ID], [FirstName], [MiddleName], [LastName], [Login], [Password], [Email], [PhoneNumber], [PostId]) VALUES (2, N'Surikat', N'Surikatovich', N'Surikatov', N'Surikat94', N'HeckfyCehbrfn190', N'Ahaha4@gmail.ygol', N'89182225544', 2)
INSERT [dbo].[User] ([ID], [FirstName], [MiddleName], [LastName], [Login], [Password], [Email], [PhoneNumber], [PostId]) VALUES (3, N'Amir', N'Lemurovich', N'Lemurov', N'Lemur194', N':blrbqXtkjdtr128', N'vesel4ak@mail.bober', N'89528886655', 1)
INSERT [dbo].[User] ([ID], [FirstName], [MiddleName], [LastName], [Login], [Password], [Email], [PhoneNumber], [PostId]) VALUES (4, N'Gosha', N'Egermeister', N'IzStraniOz', N'Gogol26', N'UjifCfvsqKexibq783', N'Geniy26@mail.ru', N'89187771234', 1)
INSERT [dbo].[User] ([ID], [FirstName], [MiddleName], [LastName], [Login], [Password], [Email], [PhoneNumber], [PostId]) VALUES (5, N'Geniy', N'Genialniy', N'Genialneyshiy', N'Geniy123', N'CfvsqUtybfkmysqXtkjdtrYfPtvkt221', N'GamletM3@mail.ru', N'82284113224', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Worker] ON 

INSERT [dbo].[Worker] ([Id], [UserId]) VALUES (1, 1)
INSERT [dbo].[Worker] ([Id], [UserId]) VALUES (2, 2)
INSERT [dbo].[Worker] ([Id], [UserId]) VALUES (3, 5)
SET IDENTITY_INSERT [dbo].[Worker] OFF
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD FOREIGN KEY([AdminId])
REFERENCES [dbo].[Admin] ([Id])
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD FOREIGN KEY([TaskStatusId])
REFERENCES [dbo].[TaskStatus] ([Id])
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Worker] ([Id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([ID])
GO
USE [master]
GO
ALTER DATABASE [HelpDeskDB] SET  READ_WRITE 
GO
