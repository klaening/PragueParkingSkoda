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
/****** Object:  Table [dbo].[Prices]    Script Date: 2020-05-15 15:46:28 ******/
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
/****** Object:  Table [dbo].[Staff]    Script Date: 2020-05-15 15:46:28 ******/
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
/****** Object:  Table [dbo].[StatusChanges]    Script Date: 2020-05-15 15:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusChanges](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TimeOfStatusChange] [datetime2](7) NULL,
	[TicketsID] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 2020-05-15 15:46:28 ******/
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
/****** Object:  Table [dbo].[TicketStatuses]    Script Date: 2020-05-15 15:46:28 ******/
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
/****** Object:  Table [dbo].[VehicleTypes]    Script Date: 2020-05-15 15:46:28 ******/
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
SET IDENTITY_INSERT [dbo].[ParkingStatuses] ON 

INSERT [dbo].[ParkingStatuses] ([ID], [StatusName]) VALUES (2, N'Occupied')
INSERT [dbo].[ParkingStatuses] ([ID], [StatusName]) VALUES (3, N'Under Maintenance')
INSERT [dbo].[ParkingStatuses] ([ID], [StatusName]) VALUES (1, N'Vacant')
SET IDENTITY_INSERT [dbo].[ParkingStatuses] OFF
SET IDENTITY_INSERT [dbo].[VehicleTypes] ON 

INSERT [dbo].[VehicleTypes] ([ID], [TypeName], [ParkSize]) VALUES (1, N'Motorcycle', 1)
INSERT [dbo].[VehicleTypes] ([ID], [TypeName], [ParkSize]) VALUES (2, N'Car', 2)
SET IDENTITY_INSERT [dbo].[VehicleTypes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CarParks__8B0C2AB7A9A2054C]    Script Date: 2020-05-15 15:46:28 ******/
ALTER TABLE [dbo].[CarParks] ADD UNIQUE NONCLUSTERED 
(
	[NameCarPark] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__D949CC341B736773]    Script Date: 2020-05-15 15:46:28 ******/
ALTER TABLE [dbo].[Departments] ADD UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ParkingS__05E7698AFEB5C332]    Script Date: 2020-05-15 15:46:28 ******/
ALTER TABLE [dbo].[ParkingStatuses] ADD UNIQUE NONCLUSTERED 
(
	[StatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Prices__6089BD0966496154]    Script Date: 2020-05-15 15:46:28 ******/
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
/****** Object:  Index [UQ__TicketSt__05E7698A510A9EE2]    Script Date: 2020-05-15 15:46:28 ******/
ALTER TABLE [dbo].[TicketStatuses] ADD UNIQUE NONCLUSTERED 
(
	[StatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__VehicleT__D4E7DFA8B72EF048]    Script Date: 2020-05-15 15:46:28 ******/
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
ALTER TABLE [dbo].[StatusChanges]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([ID])
GO
ALTER TABLE [dbo].[StatusChanges]  WITH CHECK ADD FOREIGN KEY([TicketsID])
REFERENCES [dbo].[Tickets] ([ID])
GO
ALTER TABLE [dbo].[StatusChanges]  WITH CHECK ADD FOREIGN KEY([TicketStatusesID])
REFERENCES [dbo].[TicketStatuses] ([ID])
GO
ALTER TABLE [dbo].[StatusChanges] CHECK CONSTRAINT [FK__StatusCha__Ticke__48CFD27E]
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
