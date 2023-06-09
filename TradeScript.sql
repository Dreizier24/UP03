USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 24.03.2023 15:13:41 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 24.03.2023 15:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 24.03.2023 15:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 24.03.2023 15:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 24.03.2023 15:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NOT NULL,
	[Role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 24.03.2023 15:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Articul] [nvarchar](20) NOT NULL,
	[ProductName] [nvarchar](30) NOT NULL,
	[Unit_id] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[MaxDiscount] [int] NOT NULL,
	[Manufacturer_id] [int] NOT NULL,
	[Supplier_id] [int] NOT NULL,
	[Category_id] [int] NOT NULL,
	[CurrentDiscount] [int] NOT NULL,
	[StorageAmount] [int] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Image] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 24.03.2023 15:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 24.03.2023 15:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status_id] [int] NOT NULL,
	[DeliveryDate] [date] NULL,
	[PickupPoint_id] [int] NOT NULL,
	[GetCode] [int] NOT NULL,
	[Client_id] [int] NULL,
	[OrderDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderContent]    Script Date: 24.03.2023 15:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Good_id] [int] NOT NULL,
	[OrderedProductAmount] [int] NOT NULL,
	[Order_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 24.03.2023 15:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusValue] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 24.03.2023 15:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MailIndex] [int] NOT NULL,
	[City_id] [int] NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
	[HouseNum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 24.03.2023 15:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 24.03.2023 15:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 24.03.2023 15:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitValue] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 24.03.2023 15:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (1, N'Товары для собак')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (2, N'Для животных')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (3, N'Товары для кошек')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [CityName]) VALUES (1, N' г. Нефтеюганск')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [User_id]) VALUES (1, 8)
INSERT [dbo].[Client] ([Id], [User_id]) VALUES (2, 9)
INSERT [dbo].[Client] ([Id], [User_id]) VALUES (3, 10)
INSERT [dbo].[Client] ([Id], [User_id]) VALUES (4, 11)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [User_id], [Role_id]) VALUES (1, 1, 1)
INSERT [dbo].[Employee] ([Id], [User_id], [Role_id]) VALUES (7, 4, 1)
INSERT [dbo].[Employee] ([Id], [User_id], [Role_id]) VALUES (8, 13, 1)
INSERT [dbo].[Employee] ([Id], [User_id], [Role_id]) VALUES (9, 5, 2)
INSERT [dbo].[Employee] ([Id], [User_id], [Role_id]) VALUES (11, 6, 2)
INSERT [dbo].[Employee] ([Id], [User_id], [Role_id]) VALUES (12, 7, 2)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (1, N'А112Т4', N'Лакомство', 1, 123.0000, 30, 1, 1, 3, 3, 6, N'Лакомство для кошек Dreamies Подушечки с курицей, 140 г', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (2, N'G453T5', N'Щетка-варежка', 1, 149.0000, 15, 2, 2, 2, 2, 7, N'Щетка-варежка True Touch для вычесывания шерсти, синий', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (3, N'F432F4', N'Сухой корм', 1, 1200.0000, 10, 3, 2, 3, 3, 15, N'Сухой корм для кошек Pro Plan с чувствительным пищеварением', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (4, N'Y324F4', N'Лакомство', 1, 86.0000, 5, 4, 1, 1, 4, 17, N'Лакомство для собак Titbit Косточки мясные с индейкой и ягненком, 145 г', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (5, N'E532Q5', N'Лакомство', 1, 166.0000, 15, 4, 1, 1, 5, 18, N'Лакомство для собак Titbit Печенье Био Десерт с лососем стандарт, 350 г', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (6, N'T432F4', N'Сухой корм', 1, 1700.0000, 25, 5, 2, 1, 2, 5, N'Сухой корм для собак Chappi говядина по-домашнему, с овощами', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (7, N'G345E4', N'Мячик', 1, 300.0000, 5, 6, 2, 1, 3, 19, N'Мячик для собак LIKER Мячик Лайкер (6294) оранжевый', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (8, N'E345R4', N'Игрушка', 1, 199.0000, 5, 7, 2, 3, 5, 7, N'Игрушка для животных «Котик» с кошачьей мятой FANCY PETS', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (9, N'R356F4', N'Миска', 1, 234.0000, 10, 8, 1, 1, 3, 17, N'Миска Nobby с рисунком Dog для собак 130 мл красный', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (10, N'E431R5', N'Лакомство', 1, 170.0000, 5, 9, 2, 1, 5, 5, N'Лакомство для собак Triol Кость из жил 7.5 см, 4шт. в уп.', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (11, N'D563F4', N'Игрушка', 1, 600.0000, 10, 9, 1, 1, 5, 5, N'Игрушка для собак Triol Бобер 41 см 12141053 бежевый', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (12, N'H436R4', N'Игрушка', 1, 300.0000, 15, 9, 1, 1, 2, 15, N'Игрушка для собак Triol 3D плетение EC-04/12171005 бежевый', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (13, N'D643B5', N'Сухой корм', 1, 4100.0000, 30, 10, 1, 3, 4, 9, N'Сухой корм для котят CAT CHOW с высоким содержанием домашней птицы', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (14, N'H432F4', N'Миска', 1, 385.0000, 10, 9, 2, 2, 2, 17, N'Миска Triol 9002/KIDP3211/30261087 400 мл серебристый', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (15, N'S245R4', N'Сухой корм', 1, 280.0000, 15, 10, 2, 3, 3, 8, N'Сухой корм для кошек CAT CHOW', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (16, N'V352R4', N'Сухой корм', 1, 1700.0000, 25, 5, 1, 1, 4, 9, N'Сухой корм для собак Chappi Мясное изобилие, мясное ассорти', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (17, N'H342F5', N'Игрушка', 1, 510.0000, 5, 9, 2, 1, 2, 17, N'Игрушка для собак Triol Енот 41 см 12141063 серый', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (18, N'Q245F5', N'Игрушка', 1, 510.0000, 5, 9, 2, 1, 2, 17, N'Игрушка для собак Triol Бобер 41 см 12141063 серый', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (19, N'G542F5', N'Сухой корм', 1, 2190.0000, 30, 3, 1, 1, 4, 7, N'Сухой корм для собак Pro Plan при чувствительном пищеварении, ягненок', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (20, N'H542R6', N'Лакомство', 1, 177.0000, 15, 9, 2, 1, 3, 15, N'Лакомство для собак Triol Мясные полоски из кролика, 70 г', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (21, N'K436T5', N'Мячик', 1, 100.0000, 5, 9, 2, 1, 4, 21, N'Мячик для собак Triol с косточками 12101096 желтый/зеленый', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (22, N'V527T5', N'Игрушка', 1, 640.0000, 5, 9, 1, 1, 5, 4, N'Игрушка для собак Triol Ящерица 39 см коричневый', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (23, N'K452T5', N'Лежак', 1, 800.0000, 25, 11, 2, 1, 2, 17, N'Лежак для собак и кошек ZooM Lama 40х30х8 см бежевый', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (24, N'E466T6', N'Клетка', 1, 3500.0000, 30, 9, 2, 1, 5, 3, N'Клетка для собак Triol 30671002 61х45.5х52 см серый/белый', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (25, N'B427R5', N'Миска', 1, 400.0000, 15, 9, 2, 2, 4, 5, N'Миска для животных Triol "Стрекоза", 450 мл', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (26, N'H643W2', N'Миска', 1, 292.0000, 25, 9, 1, 2, 3, 13, N'Миска Triol CB02/30231002 100 мл бежевый/голубой', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (27, N'D356R4', N'Мячик', 1, 600.0000, 15, 12, 1, 1, 2, 16, N'Мячик для собак TRIXIE DentaFun (32942) зеленый / белый', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (28, N'E434U6', N'Лакомство', 1, 140.0000, 20, 4, 2, 1, 3, 19, N'Лакомство для собак Titbit Лакомый кусочек Нарезка из говядины, 80 г', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (29, N'M356R4', N'Лакомство', 1, 50.0000, 5, 4, 2, 1, 4, 6, N'Лакомство для собак Titbit Гематоген мясной Classic, 35 г', NULL)
INSERT [dbo].[Goods] ([Id], [Articul], [ProductName], [Unit_id], [Price], [MaxDiscount], [Manufacturer_id], [Supplier_id], [Category_id], [CurrentDiscount], [StorageAmount], [Description], [Image]) VALUES (30, N'W548O7', N'Сухой корм', 1, 600.0000, 15, 13, 1, 1, 5, 15, N'Сухой корм для щенков DOG CHOW Puppy, ягненок 2.5 кг', NULL)
SET IDENTITY_INSERT [dbo].[Goods] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName]) VALUES (1, N'Dreames')
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName]) VALUES (2, N'True Touch')
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName]) VALUES (3, N'Pro Plan')
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName]) VALUES (4, N'TitBit')
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName]) VALUES (5, N'Chappy')
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName]) VALUES (6, N'LIKER')
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName]) VALUES (7, N'Fancy Pets')
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName]) VALUES (8, N'Nobby')
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName]) VALUES (9, N'Triol')
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName]) VALUES (10, N'Cat Chow')
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName]) VALUES (11, N'ZooM')
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName]) VALUES (12, N'trixie')
INSERT [dbo].[Manufacturer] ([Id], [ManufacturerName]) VALUES (13, N'Dog Chow')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Status_id], [DeliveryDate], [PickupPoint_id], [GetCode], [Client_id], [OrderDate]) VALUES (1, 1, CAST(N'2022-05-12' AS Date), 25, 601, NULL, CAST(N'2022-05-06' AS Date))
INSERT [dbo].[Order] ([Id], [Status_id], [DeliveryDate], [PickupPoint_id], [GetCode], [Client_id], [OrderDate]) VALUES (2, 1, CAST(N'2022-05-12' AS Date), 20, 602, NULL, CAST(N'2022-05-06' AS Date))
INSERT [dbo].[Order] ([Id], [Status_id], [DeliveryDate], [PickupPoint_id], [GetCode], [Client_id], [OrderDate]) VALUES (3, 2, CAST(N'2022-05-14' AS Date), 22, 603, 2, CAST(N'2022-05-08' AS Date))
INSERT [dbo].[Order] ([Id], [Status_id], [DeliveryDate], [PickupPoint_id], [GetCode], [Client_id], [OrderDate]) VALUES (4, 2, CAST(N'2022-05-14' AS Date), 24, 604, NULL, CAST(N'2022-05-08' AS Date))
INSERT [dbo].[Order] ([Id], [Status_id], [DeliveryDate], [PickupPoint_id], [GetCode], [Client_id], [OrderDate]) VALUES (5, 2, CAST(N'2022-05-16' AS Date), 25, 605, NULL, CAST(N'2022-05-10' AS Date))
INSERT [dbo].[Order] ([Id], [Status_id], [DeliveryDate], [PickupPoint_id], [GetCode], [Client_id], [OrderDate]) VALUES (6, 2, CAST(N'2022-05-17' AS Date), 28, 606, 1, CAST(N'2022-05-11' AS Date))
INSERT [dbo].[Order] ([Id], [Status_id], [DeliveryDate], [PickupPoint_id], [GetCode], [Client_id], [OrderDate]) VALUES (7, 1, CAST(N'2022-05-18' AS Date), 36, 607, NULL, CAST(N'2022-05-12' AS Date))
INSERT [dbo].[Order] ([Id], [Status_id], [DeliveryDate], [PickupPoint_id], [GetCode], [Client_id], [OrderDate]) VALUES (8, 1, CAST(N'2022-05-19' AS Date), 32, 608, NULL, CAST(N'2022-05-13' AS Date))
INSERT [dbo].[Order] ([Id], [Status_id], [DeliveryDate], [PickupPoint_id], [GetCode], [Client_id], [OrderDate]) VALUES (9, 1, CAST(N'2022-05-21' AS Date), 34, 609, 4, CAST(N'2022-05-15' AS Date))
INSERT [dbo].[Order] ([Id], [Status_id], [DeliveryDate], [PickupPoint_id], [GetCode], [Client_id], [OrderDate]) VALUES (10, 2, CAST(N'2022-05-21' AS Date), 36, 610, 3, CAST(N'2022-05-15' AS Date))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderContent] ON 

INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (1, 1, 15, 1)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (2, 2, 1, 1)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (3, 3, 15, 2)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (4, 4, 15, 2)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (5, 5, 10, 3)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (6, 6, 10, 3)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (7, 7, 1, 4)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (8, 8, 2, 4)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (9, 9, 1, 5)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (10, 10, 10, 5)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (11, 12, 1, 6)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (12, 13, 1, 6)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (13, 17, 2, 7)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (14, 18, 2, 7)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (15, 21, 1, 8)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (16, 22, 1, 8)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (17, 22, 1, 9)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (18, 23, 1, 9)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (19, 29, 1, 10)
INSERT [dbo].[OrderContent] ([Id], [Good_id], [OrderedProductAmount], [Order_id]) VALUES (20, 30, 1, 10)
SET IDENTITY_INSERT [dbo].[OrderContent] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([Id], [StatusValue]) VALUES (1, N'Новый')
INSERT [dbo].[OrderStatus] ([Id], [StatusValue]) VALUES (2, N'Завершен')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 

INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (1, 344288, 1, N' ул. Чехова', 1)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (2, 614164, 1, N'  ул. Степная', 30)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (3, 394242, 1, N' ул. Коммунистическая', 43)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (4, 660540, 1, N' ул. Солнечная', 25)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (5, 125837, 1, N' ул. Шоссейная', 40)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (6, 125703, 1, N' ул. Партизанская', 49)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (7, 625283, 1, N' ул. Победы', 46)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (8, 614611, 1, N' ул. Молодежная', 50)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (9, 454311, 1, N' ул. Новая', 19)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (10, 660007, 1, N' ул. Октябрьская', 19)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (11, 603036, 1, N' ул. Садовая', 4)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (12, 450983, 1, N' ул. Комсомольская', 26)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (13, 394782, 1, N' ул. Чехова', 3)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (14, 603002, 1, N' ул. Дзержинского', 28)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (15, 450558, 1, N' ул. Набережная', 30)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (16, 394060, 1, N' ул. Фрунзе', 43)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (17, 410661, 1, N' ул. Школьная', 50)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (18, 625590, 1, N' ул. Коммунистическая', 20)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (19, 625683, 1, N' ул. 8 Марта', NULL)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (20, 400562, 1, N' ул. Зеленая', 32)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (21, 614510, 1, N' ул. Маяковского', 47)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (22, 410542, 1, N' ул. Светлая', 46)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (23, 620839, 1, N' ул. Цветочная', 8)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (24, 443890, 1, N' ул. Коммунистическая', 1)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (25, 603379, 1, N' ул. Спортивная', 46)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (26, 603721, 1, N' ул. Гоголя', 41)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (27, 410172, 1, N' ул. Северная', 13)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (28, 420151, 1, N' ул. Вишневая', 32)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (29, 125061, 1, N' ул. Подгорная', 8)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (30, 630370, 1, N' ул. Шоссейная', 24)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (31, 614753, 1, N' ул. Полевая', 35)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (32, 426030, 1, N' ул. Маяковского', 44)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (33, 450375, 1, N' ул. Клубная', 44)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (34, 625560, 1, N' ул. Некрасова', 12)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (35, 630201, 1, N' ул. Комсомольская', 17)
INSERT [dbo].[PickupPoint] ([Id], [MailIndex], [City_id], [Street], [HouseNum]) VALUES (36, 190949, 1, N' ул. Мичурина', 26)
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'администратор')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'менеджер')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (3, N'клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [SupplierName]) VALUES (1, N'PetShop')
INSERT [dbo].[Supplier] ([Id], [SupplierName]) VALUES (2, N'ZooMir')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([Id], [UnitValue]) VALUES (1, N'шт.')
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [MiddleName], [Login], [Password]) VALUES (1, N'Суслов', N'Илья', N'Арсентьевич', N'pixil59@gmail.com', N'2L6KZG')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [MiddleName], [Login], [Password]) VALUES (4, N'Игнатьева', N'Алина', N'Михайловна', N'vilagajaunne-5170@yandex.ru', N'8ntwUp')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [MiddleName], [Login], [Password]) VALUES (5, N'Денисов', N'Михаил', N'Романович', N'frusubroppotou656@yandex.ru', N'YOyhfR')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [MiddleName], [Login], [Password]) VALUES (6, N'Тимофеев', N'Михаил', N'Елисеевич', N'leuttevitrafo1998@mail.ru', N'RSbvHv')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [MiddleName], [Login], [Password]) VALUES (7, N'Соловьев', N'Ярослав', N'Маркович', N'frapreubrulloba1141@yandex.ru', N'rwVDh9')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [MiddleName], [Login], [Password]) VALUES (8, N'Филимонов', N'Роберт', N'Васильевич', N'loudittoimmolau1900@gmail.com', N'LdNyos')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [MiddleName], [Login], [Password]) VALUES (9, N'Шилова', N'Майя', N'Артемьевна', N'hittuprofassa4984@mail.com', N'gynQMT')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [MiddleName], [Login], [Password]) VALUES (10, N'Чистякова', N'Виктория', N'Степановна', N'freineiciweijau888@yandex.ru', N'AtnDjr')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [MiddleName], [Login], [Password]) VALUES (11, N'Волкова', N'Эмилия', N'Артёмовна', N'nokupekidda2001@gmail.com', N'JlFRCZ')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [MiddleName], [Login], [Password]) VALUES (13, N'Яковлева
', N'Ярослава
', N'Даниэльевна
', N'"deummecillummu-4992@mail.ru
"
', N'uzWC67
')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([Role_id])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([User_id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD FOREIGN KEY([Category_id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD FOREIGN KEY([Manufacturer_id])
REFERENCES [dbo].[Manufacturer] ([Id])
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD FOREIGN KEY([Supplier_id])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD FOREIGN KEY([Unit_id])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Client_id])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([PickupPoint_id])
REFERENCES [dbo].[PickupPoint] ([Id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([Status_id])
REFERENCES [dbo].[OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[OrderContent]  WITH CHECK ADD  CONSTRAINT [FK_OrderContent_Goods] FOREIGN KEY([Good_id])
REFERENCES [dbo].[Goods] ([Id])
GO
ALTER TABLE [dbo].[OrderContent] CHECK CONSTRAINT [FK_OrderContent_Goods]
GO
ALTER TABLE [dbo].[PickupPoint]  WITH CHECK ADD FOREIGN KEY([City_id])
REFERENCES [dbo].[City] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
