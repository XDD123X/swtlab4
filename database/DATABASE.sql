USE [master]
GO
/****** Object:  Database [PRJ301_Assignment]    Script Date: 21/7/2023 12:30:42 PM ******/
CREATE DATABASE [PRJ301_Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PRJ301_Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PRJ301_Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJ301_Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ301_Assignment', N'ON'
GO
ALTER DATABASE [PRJ301_Assignment] SET QUERY_STORE = ON
GO
ALTER DATABASE [PRJ301_Assignment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PRJ301_Assignment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 21/7/2023 12:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[role] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 21/7/2023 12:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 21/7/2023 12:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[product_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
	[comment_id] [int] NOT NULL,
	[comment] [nvarchar](max) NOT NULL,
	[rate] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 21/7/2023 12:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
	[total] [float] NULL,
	[status] [int] NOT NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_detail]    Script Date: 21/7/2023 12:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_detail](
	[order_detail_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[amount] [float] NULL,
	[price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 21/7/2023 12:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[upload_by] [int] NOT NULL,
	[rate] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Detail]    Script Date: 21/7/2023 12:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Detail](
	[product_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[detail] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NULL,
	[image] [nvarchar](100) NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 21/7/2023 12:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_level] [int] NOT NULL,
	[role_name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 21/7/2023 12:30:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[status_id] [int] NOT NULL,
	[status_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([account_id], [username], [password], [name], [address], [email], [phone], [role], [created_at], [status]) VALUES (1, N'user1', N'user1', N'customer 1', N'Address', N'user1@example.com', N'1111111111', 1, CAST(N'2023-07-15T13:55:45.797' AS DateTime), 0)
INSERT [dbo].[Account] ([account_id], [username], [password], [name], [address], [email], [phone], [role], [created_at], [status]) VALUES (2, N'user2', N'user2', N'customer 2', N'Address', N'user2@example.com', N'2222222222', 2, CAST(N'2023-07-15T13:55:45.797' AS DateTime), 1)
INSERT [dbo].[Account] ([account_id], [username], [password], [name], [address], [email], [phone], [role], [created_at], [status]) VALUES (3, N'seller', N'seller', N'tên của người bán', N'Address', N'seller@example.com', N'3333333333', 3, CAST(N'2023-07-15T13:55:45.797' AS DateTime), 1)
INSERT [dbo].[Account] ([account_id], [username], [password], [name], [address], [email], [phone], [role], [created_at], [status]) VALUES (4, N'manager', N'manager', N'tên của quản lý', N'Address', N'manager@example.com', N'4444444444', 4, CAST(N'2023-07-15T13:55:45.797' AS DateTime), 1)
INSERT [dbo].[Account] ([account_id], [username], [password], [name], [address], [email], [phone], [role], [created_at], [status]) VALUES (5, N'admin', N'admin', N'tên của quản trị viên', N'Address', N'admin@example.com', N'5555555555', 5, CAST(N'2023-07-15T13:55:45.797' AS DateTime), 1)
INSERT [dbo].[Account] ([account_id], [username], [password], [name], [address], [email], [phone], [role], [created_at], [status]) VALUES (6, N'user3', N'user3', N'customer 3', N'Address', N'user3@example.com', N'6666666666', 1, CAST(N'2023-07-15T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Account] ([account_id], [username], [password], [name], [address], [email], [phone], [role], [created_at], [status]) VALUES (7, N'test', N'test', N'test', N'Address', N'test@example.com', N'7777777777', 1, CAST(N'2023-07-15T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Account] ([account_id], [username], [password], [name], [address], [email], [phone], [role], [created_at], [status]) VALUES (8, N'1', N'1', N'nguyễn văn a', N'sửa địa chỉ', N'duchinh0306@gmail.com', N'0000000000', 1, CAST(N'2023-07-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Account] ([account_id], [username], [password], [name], [address], [email], [phone], [role], [created_at], [status]) VALUES (9, N'2', N'2', N'tài khoản 2', N'địa chỉ a', N'duchinh03063@gmail.com', N'1231231234', 1, CAST(N'2023-06-23T15:50:00.000' AS DateTime), 3)
GO
INSERT [dbo].[Category] ([category_id], [name], [status], [created_at], [updated_at]) VALUES (1, N'Category 1', 1, CAST(N'2023-07-15T13:55:45.800' AS DateTime), CAST(N'2023-07-15T13:55:45.800' AS DateTime))
INSERT [dbo].[Category] ([category_id], [name], [status], [created_at], [updated_at]) VALUES (2, N'Category 2', 1, CAST(N'2023-07-15T13:55:45.800' AS DateTime), CAST(N'2023-07-15T13:55:45.800' AS DateTime))
INSERT [dbo].[Category] ([category_id], [name], [status], [created_at], [updated_at]) VALUES (3, N'Category 3', 1, CAST(N'2023-07-15T13:55:45.800' AS DateTime), CAST(N'2023-07-15T13:55:45.800' AS DateTime))
GO
INSERT [dbo].[Comment] ([product_id], [account_id], [comment_id], [comment], [rate], [status], [created_at]) VALUES (1, 1, 1, N'Great product!', 5, 1, CAST(N'2023-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([product_id], [account_id], [comment_id], [comment], [rate], [status], [created_at]) VALUES (2, 2, 2, N'Good value for money.', 5, 1, CAST(N'2023-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([product_id], [account_id], [comment_id], [comment], [rate], [status], [created_at]) VALUES (3, 1, 3, N'Could be better.', 5, 1, CAST(N'2023-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([product_id], [account_id], [comment_id], [comment], [rate], [status], [created_at]) VALUES (4, 2, 4, N'Highly recommended!', 5, 1, CAST(N'2023-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([product_id], [account_id], [comment_id], [comment], [rate], [status], [created_at]) VALUES (5, 1, 5, N'Average product.', 5, 1, CAST(N'2023-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([product_id], [account_id], [comment_id], [comment], [rate], [status], [created_at]) VALUES (6, 2, 6, N'Not satisfied with the quality.', 5, 1, CAST(N'2023-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([product_id], [account_id], [comment_id], [comment], [rate], [status], [created_at]) VALUES (7, 1, 7, N'Fast shipping!', 5, 1, CAST(N'2023-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([product_id], [account_id], [comment_id], [comment], [rate], [status], [created_at]) VALUES (8, 2, 8, N'Excellent service.', 5, 1, CAST(N'2023-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([product_id], [account_id], [comment_id], [comment], [rate], [status], [created_at]) VALUES (9, 1, 9, N'Product as described.', 5, 1, CAST(N'2023-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([product_id], [account_id], [comment_id], [comment], [rate], [status], [created_at]) VALUES (1, 3, 10, N'Product is bad', 5, 1, CAST(N'2023-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([product_id], [account_id], [comment_id], [comment], [rate], [status], [created_at]) VALUES (1, 9, 11, N'This is a sample comment.', 5, 1, CAST(N'2023-07-20T06:57:00.927' AS DateTime))
INSERT [dbo].[Comment] ([product_id], [account_id], [comment_id], [comment], [rate], [status], [created_at]) VALUES (1, 9, 12, N'bad bad bad bad ', 1, 1, CAST(N'2023-07-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Order] ([order_id], [account_id], [total], [status], [created_at], [updated_at]) VALUES (1, 8, 1640, 1, CAST(N'2023-07-15' AS Date), CAST(N'2023-07-15' AS Date))
INSERT [dbo].[Order] ([order_id], [account_id], [total], [status], [created_at], [updated_at]) VALUES (2, 5, 170, 2, CAST(N'2023-07-20' AS Date), CAST(N'2023-07-20' AS Date))
INSERT [dbo].[Order] ([order_id], [account_id], [total], [status], [created_at], [updated_at]) VALUES (3, 5, 255, 2, CAST(N'2023-07-20' AS Date), CAST(N'2023-07-20' AS Date))
INSERT [dbo].[Order] ([order_id], [account_id], [total], [status], [created_at], [updated_at]) VALUES (4, 9, 20, 3, CAST(N'2023-07-20' AS Date), CAST(N'2023-07-20' AS Date))
INSERT [dbo].[Order] ([order_id], [account_id], [total], [status], [created_at], [updated_at]) VALUES (5, 9, 30, 2, CAST(N'2023-07-20' AS Date), CAST(N'2023-07-20' AS Date))
INSERT [dbo].[Order] ([order_id], [account_id], [total], [status], [created_at], [updated_at]) VALUES (6, 5, 20, 2, CAST(N'2023-07-20' AS Date), CAST(N'2023-07-20' AS Date))
INSERT [dbo].[Order] ([order_id], [account_id], [total], [status], [created_at], [updated_at]) VALUES (7, 3, 315, 2, CAST(N'2023-07-21' AS Date), CAST(N'2023-07-21' AS Date))
INSERT [dbo].[Order] ([order_id], [account_id], [total], [status], [created_at], [updated_at]) VALUES (8, 3, 100, 2, CAST(N'2023-07-21' AS Date), CAST(N'2023-07-21' AS Date))
GO
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (1, 1, 2, 2, 30, 15)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (2, 1, 3, 3, 60, 20)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (3, 1, 4, 4, 100, 25)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (4, 1, 5, 5, 150, 30)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (5, 1, 6, 6, 210, 35)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (6, 1, 7, 7, 280, 40)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (7, 1, 8, 8, 360, 45)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (8, 1, 9, 9, 450, 50)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (9, 2, 1, 5, 50, 10)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (10, 2, 2, 4, 60, 15)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (11, 2, 3, 3, 60, 20)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (12, 3, 1, 1, 10, 10)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (13, 3, 2, 11, 165, 15)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (14, 3, 8, 1, 55, 55)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (15, 3, 4, 1, 25, 25)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (16, 4, 1, 2, 20, 10)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (17, 5, 1, 3, 30, 10)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (18, 6, 1, 2, 20, 10)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (19, 7, 3, 2, 40, 20)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (20, 7, 1, 1, 10, 10)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (21, 7, 4, 1, 25, 25)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (22, 7, 5, 1, 30, 30)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (23, 7, 6, 1, 45, 45)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (24, 7, 7, 1, 50, 50)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (25, 7, 9, 1, 60, 60)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (26, 7, 8, 1, 55, 55)
INSERT [dbo].[Order_detail] ([order_detail_id], [order_id], [product_id], [quantity], [amount], [price]) VALUES (27, 8, 3, 5, 100, 20)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [status], [created_at], [upload_by], [rate]) VALUES (1, 1, 1, CAST(N'2023-07-15T13:55:45.803' AS DateTime), 3, 2)
INSERT [dbo].[Product] ([product_id], [category_id], [status], [created_at], [upload_by], [rate]) VALUES (2, 2, 1, CAST(N'2023-07-15T13:55:45.803' AS DateTime), 3, 5)
INSERT [dbo].[Product] ([product_id], [category_id], [status], [created_at], [upload_by], [rate]) VALUES (3, 3, 1, CAST(N'2023-07-15T13:55:45.803' AS DateTime), 3, 5)
INSERT [dbo].[Product] ([product_id], [category_id], [status], [created_at], [upload_by], [rate]) VALUES (4, 1, 1, CAST(N'2023-07-15T13:55:45.803' AS DateTime), 3, 5)
INSERT [dbo].[Product] ([product_id], [category_id], [status], [created_at], [upload_by], [rate]) VALUES (5, 2, 1, CAST(N'2023-07-15T13:55:45.803' AS DateTime), 3, 5)
INSERT [dbo].[Product] ([product_id], [category_id], [status], [created_at], [upload_by], [rate]) VALUES (6, 3, 1, CAST(N'2023-07-15T13:55:45.803' AS DateTime), 3, 5)
INSERT [dbo].[Product] ([product_id], [category_id], [status], [created_at], [upload_by], [rate]) VALUES (7, 1, 1, CAST(N'2023-07-15T13:55:45.803' AS DateTime), 3, 5)
INSERT [dbo].[Product] ([product_id], [category_id], [status], [created_at], [upload_by], [rate]) VALUES (8, 2, 1, CAST(N'2023-07-15T13:55:45.803' AS DateTime), 5, 5)
INSERT [dbo].[Product] ([product_id], [category_id], [status], [created_at], [upload_by], [rate]) VALUES (9, 1, 1, CAST(N'2023-07-21T12:26:31.827' AS DateTime), 3, 0)
GO
INSERT [dbo].[Product_Detail] ([product_id], [name], [detail], [quantity], [price], [image], [updated_at]) VALUES (1, N'Product 1', N'Product 1 detail', 30, 10, N'p1.png', CAST(N'2023-07-21T11:12:52.503' AS DateTime))
INSERT [dbo].[Product_Detail] ([product_id], [name], [detail], [quantity], [price], [image], [updated_at]) VALUES (2, N'Product 2', N'Product 2 detail', 0, 15, N'p2.png', CAST(N'2023-07-15T13:55:45.807' AS DateTime))
INSERT [dbo].[Product_Detail] ([product_id], [name], [detail], [quantity], [price], [image], [updated_at]) VALUES (3, N'Product 3', N'Product 3 detail', 5, 20, N'p3.png', CAST(N'2023-07-15T13:55:45.807' AS DateTime))
INSERT [dbo].[Product_Detail] ([product_id], [name], [detail], [quantity], [price], [image], [updated_at]) VALUES (4, N'Product 4', N'Product 4 detail', 13, 25, N'p4.png', CAST(N'2023-07-15T13:55:45.807' AS DateTime))
INSERT [dbo].[Product_Detail] ([product_id], [name], [detail], [quantity], [price], [image], [updated_at]) VALUES (5, N'Product 5', N'Product 5 detail', 14, 30, N'p5.png', CAST(N'2023-07-15T13:55:45.807' AS DateTime))
INSERT [dbo].[Product_Detail] ([product_id], [name], [detail], [quantity], [price], [image], [updated_at]) VALUES (6, N'Product 6', N'Product 6 detail', 14, 45, N'p6.png', CAST(N'2023-07-15T13:55:45.807' AS DateTime))
INSERT [dbo].[Product_Detail] ([product_id], [name], [detail], [quantity], [price], [image], [updated_at]) VALUES (7, N'Product 7', N'Product 7 detail', 14, 50, N'p7.png', CAST(N'2023-07-15T13:55:45.807' AS DateTime))
INSERT [dbo].[Product_Detail] ([product_id], [name], [detail], [quantity], [price], [image], [updated_at]) VALUES (8, N'Product 8', N'Product 8 detail', 13, 55, N'p8.png', CAST(N'2023-07-15T13:55:45.807' AS DateTime))
GO
INSERT [dbo].[Role] ([role_level], [role_name]) VALUES (1, N'customer')
INSERT [dbo].[Role] ([role_level], [role_name]) VALUES (2, N'vip')
INSERT [dbo].[Role] ([role_level], [role_name]) VALUES (3, N'seller')
INSERT [dbo].[Role] ([role_level], [role_name]) VALUES (4, N'manager')
INSERT [dbo].[Role] ([role_level], [role_name]) VALUES (5, N'admin')
GO
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (0, N'denied')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (1, N'accepted')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (2, N'pending')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (3, N'done')
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [upload_by]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((5)) FOR [rate]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_Assignment] SET  READ_WRITE 
GO
