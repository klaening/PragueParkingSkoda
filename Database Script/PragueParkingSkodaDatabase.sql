USE [master]
GO
/****** Object:  Database [PragueParkingSkoda]    Script Date: 2020-05-19 15:40:39 ******/
CREATE DATABASE [PragueParkingSkoda]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PragueParkingSkoda', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PragueParkingSkoda.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PragueParkingSkoda_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PragueParkingSkoda_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PragueParkingSkoda] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PragueParkingSkoda].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PragueParkingSkoda] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET ARITHABORT OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PragueParkingSkoda] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PragueParkingSkoda] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PragueParkingSkoda] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PragueParkingSkoda] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET RECOVERY FULL 
GO
ALTER DATABASE [PragueParkingSkoda] SET  MULTI_USER 
GO
ALTER DATABASE [PragueParkingSkoda] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PragueParkingSkoda] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PragueParkingSkoda] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PragueParkingSkoda] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PragueParkingSkoda] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PragueParkingSkoda', N'ON'
GO
ALTER DATABASE [PragueParkingSkoda] SET QUERY_STORE = OFF
GO
USE [PragueParkingSkoda]
GO
/****** Object:  Table [dbo].[CarParks]    Script Date: 2020-05-19 15:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarParks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameCarPark] [varchar](50) NOT NULL,
	[Floors] [int] NOT NULL,
	[QtyParkingSpots] [int] NOT NULL,
	[LocationCarPark] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyReports]    Script Date: 2020-05-19 15:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyReports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreationDate] [date] NOT NULL,
	[CarParksID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DamageReports]    Script Date: 2020-05-19 15:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DamageReports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFirstName] [varchar](255) NULL,
	[CustomerLastName] [varchar](255) NULL,
	[CustomerPhoneNo] [varchar](255) NULL,
	[CustomerEmail] [varchar](255) NULL,
	[DamageDescription] [varchar](500) NOT NULL,
	[TicketsID] [int] NULL,
	[ParkingSpotsID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2020-05-19 15:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParkingSpots]    Script Date: 2020-05-19 15:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParkingSpots](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SpotNo] [varchar](50) NOT NULL,
	[ParkCapacity] [int] NOT NULL,
	[ParkingStatusesID] [int] NOT NULL,
	[CarParksID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParkingStatuses]    Script Date: 2020-05-19 15:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParkingStatuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prices]    Script Date: 2020-05-19 15:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PricePerHour] [decimal](18, 0) NOT NULL,
	[VehicleTypesID] [int] NOT NULL,
	[CarParksID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2020-05-19 15:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [varchar](50) NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[StaffAddress] [varchar](255) NULL,
	[PhoneNo] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[BankAccount] [varchar](255) NULL,
	[ICE] [varchar](50) NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPassword] [varchar](50) NOT NULL,
	[DepartmentsID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusChanges]    Script Date: 2020-05-19 15:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusChanges](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TimeOfStatusChange] [timestamp] NOT NULL,
	[TicketsID] [int] NOT NULL,
	[TicketStatusesID] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 2020-05-19 15:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [varchar](50) NOT NULL,
	[RetrievalCode] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](50) NULL,
	[PID] [varchar](50) NULL,
	[EstimatedParkingTime] [decimal](18, 0) NULL,
	[Comment] [varchar](500) NULL,
	[ParkingSpotsID] [int] NOT NULL,
	[VehicleTypesID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketStatuses]    Script Date: 2020-05-19 15:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketStatuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleTypes]    Script Date: 2020-05-19 15:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[ParkSize] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CarParks] ON 

INSERT [dbo].[CarParks] ([ID], [NameCarPark], [Floors], [QtyParkingSpots], [LocationCarPark]) VALUES (1, N'Prague Parking', 1, 100, N'By the castle')
SET IDENTITY_INSERT [dbo].[CarParks] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([ID], [DepartmentName]) VALUES (1, N'Administration')
INSERT [dbo].[Departments] ([ID], [DepartmentName]) VALUES (3, N'Parking Valet')
INSERT [dbo].[Departments] ([ID], [DepartmentName]) VALUES (2, N'Reception')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[ParkingSpots] ON 

INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (1, N'001', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (2, N'002', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (3, N'003', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (4, N'004', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (5, N'005', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (6, N'006', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (7, N'007', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (8, N'008', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (9, N'009', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (10, N'010', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (11, N'011', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (12, N'012', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (13, N'013', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (14, N'014', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (15, N'015', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (16, N'016', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (17, N'017', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (18, N'018', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (19, N'019', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (20, N'020', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (21, N'021', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (22, N'022', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (23, N'023', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (24, N'024', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (25, N'025', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (26, N'026', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (27, N'027', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (28, N'028', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (29, N'029', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (30, N'030', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (31, N'031', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (32, N'032', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (33, N'033', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (34, N'034', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (35, N'035', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (36, N'036', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (37, N'037', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (38, N'038', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (39, N'039', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (40, N'040', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (41, N'041', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (42, N'042', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (43, N'043', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (44, N'044', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (45, N'045', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (46, N'046', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (47, N'047', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (48, N'048', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (49, N'049', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (50, N'050', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (51, N'051', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (52, N'052', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (53, N'053', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (54, N'054', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (55, N'055', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (56, N'056', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (57, N'057', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (58, N'058', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (59, N'059', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (60, N'060', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (61, N'061', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (62, N'062', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (63, N'063', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (64, N'064', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (65, N'065', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (66, N'066', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (67, N'067', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (68, N'068', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (69, N'069', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (70, N'070', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (71, N'071', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (72, N'072', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (73, N'073', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (74, N'074', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (75, N'075', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (76, N'076', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (77, N'077', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (78, N'078', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (79, N'079', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (80, N'080', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (81, N'081', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (82, N'082', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (83, N'083', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (84, N'084', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (85, N'085', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (86, N'086', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (87, N'087', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (88, N'088', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (89, N'089', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (90, N'090', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (91, N'091', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (92, N'092', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (93, N'093', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (94, N'094', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (95, N'095', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (96, N'096', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (97, N'097', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (98, N'098', 2, 1, 1)
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (99, N'099', 2, 1, 1)
GO
INSERT [dbo].[ParkingSpots] ([ID], [SpotNo], [ParkCapacity], [ParkingStatusesID], [CarParksID]) VALUES (100, N'100', 2, 1, 1)
SET IDENTITY_INSERT [dbo].[ParkingSpots] OFF
SET IDENTITY_INSERT [dbo].[ParkingStatuses] ON 

INSERT [dbo].[ParkingStatuses] ([ID], [StatusName]) VALUES (2, N'Occupied')
INSERT [dbo].[ParkingStatuses] ([ID], [StatusName]) VALUES (3, N'Under Maintenance')
INSERT [dbo].[ParkingStatuses] ([ID], [StatusName]) VALUES (1, N'Vacant')
SET IDENTITY_INSERT [dbo].[ParkingStatuses] OFF
SET IDENTITY_INSERT [dbo].[Prices] ON 

INSERT [dbo].[Prices] ([ID], [PricePerHour], [VehicleTypesID], [CarParksID]) VALUES (1, CAST(15 AS Decimal(18, 0)), 1, 1)
INSERT [dbo].[Prices] ([ID], [PricePerHour], [VehicleTypesID], [CarParksID]) VALUES (2, CAST(25 AS Decimal(18, 0)), 2, 1)
SET IDENTITY_INSERT [dbo].[Prices] OFF
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([ID], [PID], [FirstName], [LastName], [StaffAddress], [PhoneNo], [Email], [BankAccount], [ICE], [UserName], [UserPassword], [DepartmentsID]) VALUES (1, N'830403-4216', N'Jayden', N'Bevins', N'Pratt’s Bottom 68', N'(+420)7382767496', N'j.bevins@outlook.com', N'Czech National Bank, 42641 64269', N'Cleo Andrews', N'j.bevins', N'password', 1)
INSERT [dbo].[Staff] ([ID], [PID], [FirstName], [LastName], [StaffAddress], [PhoneNo], [Email], [BankAccount], [ICE], [UserName], [UserPassword], [DepartmentsID]) VALUES (2, N'930519-2321', N'Moxie', N'Walkner', N'Fudgepack upon Humber 113', N'(+420)7632512112', N'm.walkner@yahoo.com', N'Czech National Bank, 35622 23564', N'Ray Carrillo', N'm.walkner', N'password', 2)
INSERT [dbo].[Staff] ([ID], [PID], [FirstName], [LastName], [StaffAddress], [PhoneNo], [Email], [BankAccount], [ICE], [UserName], [UserPassword], [DepartmentsID]) VALUES (3, N'950210-1426', N'Brynlee', N'Lenk', N'Cock Law 214', N'(+420)7361573374', N'b.lenk@gmail.com', N'Czech National Bank, 42322 14627', N'Marcel Riley', N'b.lenk', N'password', 3)
SET IDENTITY_INSERT [dbo].[Staff] OFF
SET IDENTITY_INSERT [dbo].[TicketStatuses] ON 

INSERT [dbo].[TicketStatuses] ([ID], [StatusName]) VALUES (2, N'Park Accepted')
INSERT [dbo].[TicketStatuses] ([ID], [StatusName]) VALUES (1, N'Park Pending')
INSERT [dbo].[TicketStatuses] ([ID], [StatusName]) VALUES (3, N'Parked')
INSERT [dbo].[TicketStatuses] ([ID], [StatusName]) VALUES (5, N'Return Accepted')
INSERT [dbo].[TicketStatuses] ([ID], [StatusName]) VALUES (4, N'Return Pending')
INSERT [dbo].[TicketStatuses] ([ID], [StatusName]) VALUES (6, N'Returned')
SET IDENTITY_INSERT [dbo].[TicketStatuses] OFF
SET IDENTITY_INSERT [dbo].[VehicleTypes] ON 

INSERT [dbo].[VehicleTypes] ([ID], [TypeName], [ParkSize]) VALUES (1, N'Motorcycle', 1)
INSERT [dbo].[VehicleTypes] ([ID], [TypeName], [ParkSize]) VALUES (2, N'Car', 2)
SET IDENTITY_INSERT [dbo].[VehicleTypes] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CarParks__8B0C2AB7A9A2054C]    Script Date: 2020-05-19 15:40:39 ******/
ALTER TABLE [dbo].[CarParks] ADD UNIQUE NONCLUSTERED 
(
	[NameCarPark] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__D949CC341B736773]    Script Date: 2020-05-19 15:40:39 ******/
ALTER TABLE [dbo].[Departments] ADD UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ParkingS__05E7698AFEB5C332]    Script Date: 2020-05-19 15:40:39 ******/
ALTER TABLE [dbo].[ParkingStatuses] ADD UNIQUE NONCLUSTERED 
(
	[StatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Prices__6089BD0966496154]    Script Date: 2020-05-19 15:40:39 ******/
ALTER TABLE [dbo].[Prices] ADD UNIQUE NONCLUSTERED 
(
	[PricePerHour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TicketSt__05E7698A510A9EE2]    Script Date: 2020-05-19 15:40:39 ******/
ALTER TABLE [dbo].[TicketStatuses] ADD UNIQUE NONCLUSTERED 
(
	[StatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__VehicleT__D4E7DFA8B72EF048]    Script Date: 2020-05-19 15:40:39 ******/
ALTER TABLE [dbo].[VehicleTypes] ADD UNIQUE NONCLUSTERED 
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DailyReports]  WITH CHECK ADD FOREIGN KEY([CarParksID])
REFERENCES [dbo].[CarParks] ([ID])
GO
ALTER TABLE [dbo].[DamageReports]  WITH CHECK ADD FOREIGN KEY([ParkingSpotsID])
REFERENCES [dbo].[ParkingSpots] ([ID])
GO
ALTER TABLE [dbo].[DamageReports]  WITH CHECK ADD FOREIGN KEY([TicketsID])
REFERENCES [dbo].[Tickets] ([ID])
GO
ALTER TABLE [dbo].[ParkingSpots]  WITH CHECK ADD FOREIGN KEY([CarParksID])
REFERENCES [dbo].[CarParks] ([ID])
GO
ALTER TABLE [dbo].[ParkingSpots]  WITH CHECK ADD FOREIGN KEY([ParkingStatusesID])
REFERENCES [dbo].[ParkingStatuses] ([ID])
GO
ALTER TABLE [dbo].[Prices]  WITH CHECK ADD FOREIGN KEY([CarParksID])
REFERENCES [dbo].[CarParks] ([ID])
GO
ALTER TABLE [dbo].[Prices]  WITH CHECK ADD FOREIGN KEY([VehicleTypesID])
REFERENCES [dbo].[VehicleTypes] ([ID])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([DepartmentsID])
REFERENCES [dbo].[Departments] ([ID])
GO
ALTER TABLE [dbo].[StatusChanges]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([ID])
GO
ALTER TABLE [dbo].[StatusChanges]  WITH CHECK ADD FOREIGN KEY([TicketsID])
REFERENCES [dbo].[Tickets] ([ID])
GO
ALTER TABLE [dbo].[StatusChanges]  WITH CHECK ADD FOREIGN KEY([TicketStatusesID])
REFERENCES [dbo].[TicketStatuses] ([ID])
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD FOREIGN KEY([ParkingSpotsID])
REFERENCES [dbo].[ParkingSpots] ([ID])
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD FOREIGN KEY([VehicleTypesID])
REFERENCES [dbo].[VehicleTypes] ([ID])
GO
USE [master]
GO
ALTER DATABASE [PragueParkingSkoda] SET  READ_WRITE 
GO
