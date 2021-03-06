USE [master]
GO
/****** Object:  Database [PragueParkingSkoda]    Script Date: 2020-06-04 10:57:22 ******/
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
/****** Object:  Table [dbo].[CarParks]    Script Date: 2020-06-04 10:57:22 ******/
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
/****** Object:  Table [dbo].[DailyReports]    Script Date: 2020-06-04 10:57:22 ******/
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
/****** Object:  Table [dbo].[DamageReports]    Script Date: 2020-06-04 10:57:22 ******/
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
/****** Object:  Table [dbo].[Departments]    Script Date: 2020-06-04 10:57:22 ******/
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
/****** Object:  Table [dbo].[ParkingSpots]    Script Date: 2020-06-04 10:57:22 ******/
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
/****** Object:  Table [dbo].[ParkingStatuses]    Script Date: 2020-06-04 10:57:22 ******/
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
/****** Object:  Table [dbo].[Prices]    Script Date: 2020-06-04 10:57:22 ******/
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
/****** Object:  Table [dbo].[ReturnedTickets]    Script Date: 2020-06-04 10:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnedTickets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TicketsID] [int] NOT NULL,
	[RegNo] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](50) NULL,
	[PID] [varchar](50) NULL,
	[Comment] [varchar](500) NULL,
	[ParkingSpotsID] [int] NOT NULL,
	[VehicleTypesID] [int] NOT NULL,
	[StaffID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2020-06-04 10:57:22 ******/
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
/****** Object:  Table [dbo].[StatusChanges]    Script Date: 2020-06-04 10:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusChanges](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TimeOfStatusChange] [datetime2](7) NULL,
	[TicketsID] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
	[TicketStatusesID] [int] NOT NULL,
 CONSTRAINT [PK__StatusCh__3214EC2700CD3BA8] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 2020-06-04 10:57:22 ******/
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
	[TicketStatusesID] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketStatuses]    Script Date: 2020-06-04 10:57:22 ******/
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
/****** Object:  Table [dbo].[VehicleTypes]    Script Date: 2020-06-04 10:57:22 ******/
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
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([ID], [DepartmentName]) VALUES (1, N'Administration')
INSERT [dbo].[Departments] ([ID], [DepartmentName]) VALUES (3, N'Parking Valet')
INSERT [dbo].[Departments] ([ID], [DepartmentName]) VALUES (2, N'Reception')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
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
GO
SET IDENTITY_INSERT [dbo].[ParkingStatuses] ON 

INSERT [dbo].[ParkingStatuses] ([ID], [StatusName]) VALUES (2, N'Occupied')
INSERT [dbo].[ParkingStatuses] ([ID], [StatusName]) VALUES (3, N'Under Maintenance')
INSERT [dbo].[ParkingStatuses] ([ID], [StatusName]) VALUES (1, N'Vacant')
SET IDENTITY_INSERT [dbo].[ParkingStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Prices] ON 

INSERT [dbo].[Prices] ([ID], [PricePerHour], [VehicleTypesID], [CarParksID]) VALUES (1, CAST(15 AS Decimal(18, 0)), 1, 1)
INSERT [dbo].[Prices] ([ID], [PricePerHour], [VehicleTypesID], [CarParksID]) VALUES (2, CAST(25 AS Decimal(18, 0)), 2, 1)
SET IDENTITY_INSERT [dbo].[Prices] OFF
GO
SET IDENTITY_INSERT [dbo].[ReturnedTickets] ON 

INSERT [dbo].[ReturnedTickets] ([ID], [TicketsID], [RegNo], [PhoneNo], [PID], [Comment], [ParkingSpotsID], [VehicleTypesID], [StaffID]) VALUES (8, 30, N'TRY006', N'(420)782391623', N'7629109821', N'NO COMMENT', 2, 2, 3)
INSERT [dbo].[ReturnedTickets] ([ID], [TicketsID], [RegNo], [PhoneNo], [PID], [Comment], [ParkingSpotsID], [VehicleTypesID], [StaffID]) VALUES (9, 33, N'TRY001', N'(420)782391623', N'880112-1212', N'No Comment', 2, 2, 3)
INSERT [dbo].[ReturnedTickets] ([ID], [TicketsID], [RegNo], [PhoneNo], [PID], [Comment], [ParkingSpotsID], [VehicleTypesID], [StaffID]) VALUES (10, 34, N'TRY001', N'(420)782391623', N'880112-1212', N'No Comment', 2, 2, 3)
SET IDENTITY_INSERT [dbo].[ReturnedTickets] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([ID], [PID], [FirstName], [LastName], [StaffAddress], [PhoneNo], [Email], [BankAccount], [ICE], [UserName], [UserPassword], [DepartmentsID]) VALUES (1, N'760221-1212', N'Peter', N'Longtree', N'Fudgepack upon Humber 113', N'(+420)7632512112', N'p.longtree@hotmail.com', N'Czech National Bank, 35622 23564', N'Richard Erland', N'p.longtree', N'password', 3)
INSERT [dbo].[Staff] ([ID], [PID], [FirstName], [LastName], [StaffAddress], [PhoneNo], [Email], [BankAccount], [ICE], [UserName], [UserPassword], [DepartmentsID]) VALUES (2, N'930519-2321', N'Moxie', N'Walkner', N'Fudgepack upon Humber 113', N'(+420)7632512112', N'm.walkner@yahoo.com', N'Czech National Bank, 35622 23564', N'Ray Carrillo', N'm.walkner', N'password', 3)
INSERT [dbo].[Staff] ([ID], [PID], [FirstName], [LastName], [StaffAddress], [PhoneNo], [Email], [BankAccount], [ICE], [UserName], [UserPassword], [DepartmentsID]) VALUES (3, N'681004-7391', N'Karl', N'Pilkington', N'Fudgepack upon Humber 113', N'(+420)7632512112', N'k.pilkington@gmail.com', N'Czech National Bank, 35622 23564', N'Stephen Merchant', N'k.pilkington', N'password', 1)
INSERT [dbo].[Staff] ([ID], [PID], [FirstName], [LastName], [StaffAddress], [PhoneNo], [Email], [BankAccount], [ICE], [UserName], [UserPassword], [DepartmentsID]) VALUES (4, N'890130-3478', N'Anna', N'Richardson', N'Fudgepack upon Humber 113', N'(+420)7632512112', N'a.richardson@hotmail.com', N'Czech National Bank, 35622 23564', N'Harold Kumar', N'a.richardson', N'password', 2)
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusChanges] ON 

INSERT [dbo].[StatusChanges] ([ID], [TimeOfStatusChange], [TicketsID], [StaffID], [TicketStatusesID]) VALUES (68, CAST(N'2020-06-04T08:16:17.9833333' AS DateTime2), 30, 3, 1)
INSERT [dbo].[StatusChanges] ([ID], [TimeOfStatusChange], [TicketsID], [StaffID], [TicketStatusesID]) VALUES (69, CAST(N'2020-06-04T08:16:17.9866667' AS DateTime2), 30, 3, 2)
INSERT [dbo].[StatusChanges] ([ID], [TimeOfStatusChange], [TicketsID], [StaffID], [TicketStatusesID]) VALUES (70, CAST(N'2020-06-04T08:18:41.1900000' AS DateTime2), 30, 3, 3)
INSERT [dbo].[StatusChanges] ([ID], [TimeOfStatusChange], [TicketsID], [StaffID], [TicketStatusesID]) VALUES (71, CAST(N'2020-06-04T08:19:11.4900000' AS DateTime2), 30, 3, 7)
INSERT [dbo].[StatusChanges] ([ID], [TimeOfStatusChange], [TicketsID], [StaffID], [TicketStatusesID]) VALUES (77, CAST(N'2020-06-04T08:29:27.1466667' AS DateTime2), 33, 3, 1)
INSERT [dbo].[StatusChanges] ([ID], [TimeOfStatusChange], [TicketsID], [StaffID], [TicketStatusesID]) VALUES (78, CAST(N'2020-06-04T08:29:27.1500000' AS DateTime2), 33, 3, 2)
INSERT [dbo].[StatusChanges] ([ID], [TimeOfStatusChange], [TicketsID], [StaffID], [TicketStatusesID]) VALUES (79, CAST(N'2020-06-04T08:29:35.9133333' AS DateTime2), 33, 3, 7)
INSERT [dbo].[StatusChanges] ([ID], [TimeOfStatusChange], [TicketsID], [StaffID], [TicketStatusesID]) VALUES (80, CAST(N'2020-06-04T08:35:31.0200000' AS DateTime2), 34, 3, 1)
INSERT [dbo].[StatusChanges] ([ID], [TimeOfStatusChange], [TicketsID], [StaffID], [TicketStatusesID]) VALUES (81, CAST(N'2020-06-04T08:35:31.0233333' AS DateTime2), 34, 3, 2)
INSERT [dbo].[StatusChanges] ([ID], [TimeOfStatusChange], [TicketsID], [StaffID], [TicketStatusesID]) VALUES (82, CAST(N'2020-06-04T08:36:38.2266667' AS DateTime2), 34, 3, 3)
INSERT [dbo].[StatusChanges] ([ID], [TimeOfStatusChange], [TicketsID], [StaffID], [TicketStatusesID]) VALUES (83, CAST(N'2020-06-04T08:37:04.4200000' AS DateTime2), 34, 3, 7)
SET IDENTITY_INSERT [dbo].[StatusChanges] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketStatuses] ON 

INSERT [dbo].[TicketStatuses] ([ID], [StatusName]) VALUES (3, N'Park Accepted')
INSERT [dbo].[TicketStatuses] ([ID], [StatusName]) VALUES (2, N'Park Pending')
INSERT [dbo].[TicketStatuses] ([ID], [StatusName]) VALUES (4, N'Parked')
INSERT [dbo].[TicketStatuses] ([ID], [StatusName]) VALUES (6, N'Return Accepted')
INSERT [dbo].[TicketStatuses] ([ID], [StatusName]) VALUES (5, N'Return Pending')
INSERT [dbo].[TicketStatuses] ([ID], [StatusName]) VALUES (7, N'Returned')
INSERT [dbo].[TicketStatuses] ([ID], [StatusName]) VALUES (1, N'Ticket Created')
SET IDENTITY_INSERT [dbo].[TicketStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[VehicleTypes] ON 

INSERT [dbo].[VehicleTypes] ([ID], [TypeName], [ParkSize]) VALUES (1, N'Motorcycle', 1)
INSERT [dbo].[VehicleTypes] ([ID], [TypeName], [ParkSize]) VALUES (2, N'Car', 2)
SET IDENTITY_INSERT [dbo].[VehicleTypes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CarParks__8B0C2AB7042FC34A]    Script Date: 2020-06-04 10:57:22 ******/
ALTER TABLE [dbo].[CarParks] ADD UNIQUE NONCLUSTERED 
(
	[NameCarPark] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__D949CC34FD919B91]    Script Date: 2020-06-04 10:57:22 ******/
ALTER TABLE [dbo].[Departments] ADD UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ParkingS__05E7698AD40A9BA8]    Script Date: 2020-06-04 10:57:22 ******/
ALTER TABLE [dbo].[ParkingStatuses] ADD UNIQUE NONCLUSTERED 
(
	[StatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Prices__E7AA97C56915B5B6]    Script Date: 2020-06-04 10:57:22 ******/
ALTER TABLE [dbo].[Prices] ADD UNIQUE NONCLUSTERED 
(
	[PricePerHour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Returned__EE5BBA9A326A9218]    Script Date: 2020-06-04 10:57:22 ******/
ALTER TABLE [dbo].[ReturnedTickets] ADD  CONSTRAINT [UQ__Returned__EE5BBA9A326A9218] UNIQUE NONCLUSTERED 
(
	[TicketsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TicketSt__05E7698A694BFF3C]    Script Date: 2020-06-04 10:57:22 ******/
ALTER TABLE [dbo].[TicketStatuses] ADD UNIQUE NONCLUSTERED 
(
	[StatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__VehicleT__D4E7DFA8B5238DBA]    Script Date: 2020-06-04 10:57:22 ******/
ALTER TABLE [dbo].[VehicleTypes] ADD UNIQUE NONCLUSTERED 
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StatusChanges] ADD  CONSTRAINT [DF__StatusCha__TimeO__619B8048]  DEFAULT (getutcdate()) FOR [TimeOfStatusChange]
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
ALTER TABLE [dbo].[StatusChanges]  WITH CHECK ADD  CONSTRAINT [FK__StatusCha__Ticke__48CFD27E] FOREIGN KEY([TicketStatusesID])
REFERENCES [dbo].[TicketStatuses] ([ID])
GO
ALTER TABLE [dbo].[StatusChanges] CHECK CONSTRAINT [FK__StatusCha__Ticke__48CFD27E]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD FOREIGN KEY([ParkingSpotsID])
REFERENCES [dbo].[ParkingSpots] ([ID])
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([ID])
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD FOREIGN KEY([TicketStatusesID])
REFERENCES [dbo].[TicketStatuses] ([ID])
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD FOREIGN KEY([VehicleTypesID])
REFERENCES [dbo].[VehicleTypes] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteTicket]    Script Date: 2020-06-04 10:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DeleteTicket]
@TicketsID INT
AS
	BEGIN

		DELETE DamageReports
		WHERE TicketsID = @TicketsID

		DELETE StatusChanges
		WHERE TicketsID = @TicketsID

		DELETE Tickets
		WHERE ID = @TicketsID

	END
GO
/****** Object:  StoredProcedure [dbo].[usp_NewTicket_Check]    Script Date: 2020-06-04 10:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_NewTicket_Check] 
@RegNo VARCHAR(50), 
@RetrievalCode VARCHAR(50), 
@PhoneNo VARCHAR(50), 
@PID VARCHAR(50), 
@EstimatedParkingTime DECIMAL(18,0), 
@Comment VARCHAR(500), 
@ParkingSpotsID INT, 
@VehicleTypesID INT, 
@TicketStatusesID INT,
@StaffID INT
AS
	BEGIN

		DECLARE
		@TicketsID INT,
		@VehicleParkSize INT,	--Fordonets storlek
		@PSpotCapacity INT		--ParkeringsKapacitet

		SELECT @VehicleParkSize = ParkSize	
		FROM VehicleTypes
		WHERE ID = @VehicleTypesID

		SELECT @PSpotCapacity = ParkCapacity
		FROM ParkingSpots
		WHERE ID = @ParkingSpotsID
		
		IF (@PSpotCapacity < @VehicleParkSize)
		BEGIN
			PRINT 'Parking Spot`s capacity is smaller than Vehicle Type`s park size
			'
		END
		ELSE
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION SubtractParkCapacity WITH MARK

					INSERT INTO TICKETS
					VALUES(@RegNo, @RetrievalCode, @PhoneNo, @PID, @EstimatedParkingTime, @Comment, @ParkingSpotsID, @VehicleTypesID, @TicketStatusesID, @StaffID)
					SELECT @TicketsID = SCOPE_IDENTITY()

					--Minska på PSpotCapacity
					SET @PSpotCapacity = @PSpotCapacity - @VehicleParkSize

					--Uppdatera ParkingSpots
					UPDATE ParkingSpots
					SET ParkCapacity = @PSpotCapacity
					WHERE ID = @ParkingSpotsID

					--Lagra data i StatusChanges och uppdatera Tickets till nästa status
					INSERT INTO StatusChanges(TicketsID, StaffID, TicketStatusesID)
					VALUES(@TicketsID, @StaffID, @TicketStatusesID)

					SET @TicketStatusesID = @TicketStatusesID + 1

					UPDATE Tickets
					SET TicketStatusesID = @TicketStatusesID
					WHERE ID = @TicketsID

					INSERT INTO StatusChanges(TicketsID, StaffID, TicketStatusesID)
					VALUES(@TicketsID, @StaffID, @TicketStatusesID)
						
				COMMIT TRANSACTION SubtractParkCapacity
			END TRY
			BEGIN CATCH 
				ROLLBACK
			END CATCH
		END

	END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateTicket]    Script Date: 2020-06-04 10:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UpdateTicket]
@TicketsID INT,
@RegNo VARCHAR(50),
@RetrievalCode VARCHAR(50),
@PhoneNo VARCHAR(50),
@PID VARCHAR(50),
@EstimatedParkingTime DECIMAL(18,0),
@Comment VARCHAR(500),
@ParkingSpotsID INT,
@VehicleTypesID INT,
@TicketStatusesID INT,
@StaffID INT
AS
	BEGIN

		DECLARE 
		@CurrentTicketStatusID INT,
		@VehicleSize INT

		SELECT @CurrentTicketStatusID = TicketStatusesID
		FROM Tickets
		WHERE ID = @TicketsID

		BEGIN
			BEGIN TRAN CheckStatus WITH MARK

			UPDATE Tickets
			SET RegNo = @RegNo, RetrievalCode = @RetrievalCode, PhoneNo = @PhoneNo, PID = @PID, EstimatedParkingTime = @EstimatedParkingTime, Comment = @Comment, ParkingSpotsID = @ParkingSpotsID, VehicleTypesID = @VehicleTypesID, StaffID = @StaffID
			WHERE ID = @TicketsID

			BEGIN TRY
				IF(@CurrentTicketStatusID != @TicketStatusesID)
				BEGIN
					UPDATE Tickets
					SET TicketStatusesID = @TicketStatusesID
					WHERE ID = @TicketsID

					INSERT INTO StatusChanges(TicketsID, TicketStatusesID, StaffID)
					VALUES(@TicketsID, @TicketStatusesID, @StaffID)
				END

				COMMIT TRAN CheckStatus
			END TRY
			BEGIN CATCH
				ROLLBACK
			END CATCH
		END

	END
GO
/****** Object:  Trigger [dbo].[tr_ParkingSpots_AfterUpdate]    Script Date: 2020-06-04 10:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_ParkingSpots_AfterUpdate]
ON [dbo].[ParkingSpots]
AFTER UPDATE
AS
	BEGIN
		
		DECLARE @PSpotCapacity INT
		SELECT @PSpotCapacity = ParkCapacity FROM INSERTED

		IF(@PSpotCapacity = 0)
		BEGIN 
			UPDATE ParkingSpots
			SET ParkingStatusesID = 2 --2 = 'Occupied'
			WHERE ID = (SELECT ID FROM INSERTED)
		END
		ELSE
		BEGIN
			UPDATE ParkingSpots
			SET ParkingStatusesID = 1 --1 = 'Vacant'
			WHERE ID = (SELECT ID FROM INSERTED)
		END

		--HANTERAR INTE IFALL ParkingStatusesID == 3

	END
GO
ALTER TABLE [dbo].[ParkingSpots] ENABLE TRIGGER [tr_ParkingSpots_AfterUpdate]
GO
/****** Object:  Trigger [dbo].[tr_Tickets_AfterDelete]    Script Date: 2020-06-04 10:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_Tickets_AfterDelete]
ON [dbo].[Tickets]
AFTER DELETE
AS
	BEGIN
		
		DECLARE @VehicleID INT
		SELECT @VehicleID = (SELECT VehicleTypesID FROM DELETED)

		DECLARE @VehicleSize INT
		SELECT @VehicleSize = (SELECT ParkSize FROM VehicleTypes
								WHERE ID = @VehicleID)

		UPDATE ParkingSpots
		SET ParkCapacity = ParkCapacity + @VehicleSize
		WHERE ID = (SELECT ParkingSpotsID FROM DELETED)

	END
GO
ALTER TABLE [dbo].[Tickets] ENABLE TRIGGER [tr_Tickets_AfterDelete]
GO
/****** Object:  Trigger [dbo].[tr_Tickets_AfterUpdate]    Script Date: 2020-06-04 10:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_Tickets_AfterUpdate]
ON [dbo].[Tickets]
AFTER UPDATE
AS
	BEGIN

		DECLARE @TicketStatus INT

		SELECT @TicketStatus = TicketStatusesID
		FROM INSERTED

		IF(@TicketStatus = 7) --RETURNED
		BEGIN
		
			DECLARE 
				@TicketID INT,
				@VehicleTypesID INT,
				@VehicleSize INT,
				@ParkingSpotsID INT
	
			SELECT 
				@TicketID = ID,
				@VehicleTypesID = VehicleTypesID,
				@ParkingSpotsID = ParkingSpotsID
			FROM INSERTED

			SELECT @VehicleSize = ParkSize
			FROM VehicleTypes
			WHERE ID = @VehicleTypesID
		
		--LÄGG ÖVER FRÅN TICKETS TILL RETURNEDTICKETS TABELL
			INSERT INTO ReturnedTickets(TicketsID, RegNo, PhoneNo, PID, Comment, ParkingSpotsID, VehicleTypesID, StaffID)
			SELECT I.ID, I.RegNo, I.PhoneNo, I.PID, I.Comment, I.ParkingSpotsID, I.VehicleTypesID, I.StaffID
			FROM INSERTED I
		--TA BORT FRÅN TICKETS TABELL
			DELETE Tickets
			WHERE ID = (@TicketID)
		END
	END
GO
ALTER TABLE [dbo].[Tickets] ENABLE TRIGGER [tr_Tickets_AfterUpdate]
GO
USE [master]
GO
ALTER DATABASE [PragueParkingSkoda] SET  READ_WRITE 
GO
