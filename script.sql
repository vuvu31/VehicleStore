USE [ShoppingCart]
GO
ALTER TABLE [dbo].[tblUsers] DROP CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblProducts] DROP CONSTRAINT [FK_tblProducts_tblCategories]
GO
ALTER TABLE [dbo].[tblOrders] DROP CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblOrderDetails] DROP CONSTRAINT [FK_OrderDetails_tblProducts]
GO
ALTER TABLE [dbo].[tblOrderDetails] DROP CONSTRAINT [FK_OrderDetails_tblOrders]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 24/08/2021 3:34:05 CH ******/
DROP TABLE [dbo].[tblUsers]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 24/08/2021 3:34:05 CH ******/
DROP TABLE [dbo].[tblRoles]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 24/08/2021 3:34:05 CH ******/
DROP TABLE [dbo].[tblProducts]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 24/08/2021 3:34:05 CH ******/
DROP TABLE [dbo].[tblOrders]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 24/08/2021 3:34:05 CH ******/
DROP TABLE [dbo].[tblOrderDetails]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 24/08/2021 3:34:05 CH ******/
DROP TABLE [dbo].[tblCategories]
GO
USE [master]
GO
/****** Object:  Database [ShoppingCart]    Script Date: 24/08/2021 3:34:05 CH ******/
DROP DATABASE [ShoppingCart]
GO
/****** Object:  Database [ShoppingCart]    Script Date: 24/08/2021 3:34:05 CH ******/
CREATE DATABASE [ShoppingCart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingCart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShoppingCart.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShoppingCart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShoppingCart_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShoppingCart] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingCart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingCart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingCart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingCart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingCart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingCart] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingCart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingCart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingCart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingCart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingCart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingCart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingCart] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingCart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingCart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingCart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingCart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingCart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingCart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingCart] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoppingCart] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingCart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingCart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingCart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingCart] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ShoppingCart]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 24/08/2021 3:34:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[categoryID] [int] NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategorys] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 24/08/2021 3:34:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[productID] [nvarchar](50) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 24/08/2021 3:34:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[date] [date] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 24/08/2021 3:34:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [nvarchar](50) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[categoryID] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 24/08/2021 3:34:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](10) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 24/08/2021 3:34:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[roleID] [nvarchar](10) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (1, N'Toyota')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (2, N'KIA')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (3, N'Audi')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (4, N'Mazda')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (5, N'Mercedes')
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [status]) VALUES (N'1', N'Vios', 478000, 10, 1, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [status]) VALUES (N'2', N'Camry', 102900, 5, 1, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [status]) VALUES (N'3', N'KIA Morning', 3040000, 20, 2, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [status]) VALUES (N'4', N'KIA Sorento', 769000, 10, 2, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [status]) VALUES (N'5', N'GLE', 4409000, 5, 5, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [status]) VALUES (N'6', N'Mercedes-Maybach GLS', 1150000, 7, 5, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [status]) VALUES (N'7', N'Audi A6', 250000, 5, 3, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [status]) VALUES (N'8', N'Mazda3 Sport', 699000, 5, 4, 1)
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'user')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [roleID], [email], [password]) VALUES (N'abc1', N'asdasd', N'1234567890', N'quan 1', N'US', N'abc@gmail.com', N'12345678')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [roleID], [email], [password]) VALUES (N'abc123', N'abc45', N'1234568978', N'quan 1', N'US', N'abc@gmail.com', N'12345678')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [roleID], [email], [password]) VALUES (N'admin', N'admin', N'1235648906', N'quan 9', N'AD', N'ad@gmail.com', N'1')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [roleID], [email], [password]) VALUES (N'example', N'example', N'0123456789', N'quan 7', N'US', N'admin@gmail.com', N'12345678')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [roleID], [email], [password]) VALUES (N'khoa', N'Tien Khoa', N'1234567890', N'123 Lý Thái Tổ', N'US', N'example@gmail.com', N'123')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [roleID], [email], [password]) VALUES (N'teo em', N'teo nguyen', N'1245678905', N'quan 9', N'US', N'teoem@gmail.com', N'12345678')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [roleID], [email], [password]) VALUES (N'us123', N'teo nguyen', N'1234567890', N'quan 8', N'US', N'teo@gmail.com', N'12345678')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [roleID], [email], [password]) VALUES (N'user', N'user', N'4564486465', N'quận 8', N'US', N'user@gmail.com', N'1')
INSERT [dbo].[tblUsers] ([userID], [fullName], [phone], [address], [roleID], [email], [password]) VALUES (N'user1', N'user1', N'1234567890', N'quan 1', N'US', NULL, N'12345678')
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_OrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_OrderDetails_tblProducts]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblCategories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblCategories]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
USE [master]
GO
ALTER DATABASE [ShoppingCart] SET  READ_WRITE 
GO
