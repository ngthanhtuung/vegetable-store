USE [master]
GO
/****** Object:  Database [VegetableStore]    Script Date: 29/04/2022 10:55:07 PM ******/
CREATE DATABASE [VegetableStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VegetableStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VegetableStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VegetableStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VegetableStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VegetableStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VegetableStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VegetableStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VegetableStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VegetableStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VegetableStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VegetableStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [VegetableStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VegetableStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VegetableStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VegetableStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VegetableStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VegetableStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VegetableStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VegetableStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VegetableStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VegetableStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VegetableStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VegetableStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VegetableStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VegetableStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VegetableStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VegetableStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VegetableStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VegetableStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VegetableStore] SET  MULTI_USER 
GO
ALTER DATABASE [VegetableStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VegetableStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VegetableStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VegetableStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VegetableStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VegetableStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VegetableStore] SET QUERY_STORE = OFF
GO
USE [VegetableStore]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 29/04/2022 10:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [varchar](100) NOT NULL,
	[categoryName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__tblCateg__23CAF1F8D9B6E15D] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 29/04/2022 10:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [varchar](100) NOT NULL,
	[orderDate] [date] NULL,
	[total] [float] NULL,
	[email] [varchar](255) NOT NULL,
	[fullName] [nvarchar](255) NOT NULL,
	[phone] [char](15) NOT NULL,
	[address] [nvarchar](300) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK__tblOrder__0809337DAB149C06] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 29/04/2022 10:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [varchar](100) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[orderID] [varchar](100) NOT NULL,
	[productID] [int] NOT NULL,
 CONSTRAINT [PK__tblOrder__83077839EB0B0946] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 29/04/2022 10:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](255) NOT NULL,
	[price] [float] NOT NULL,
	[image] [varchar](250) NULL,
	[quantity] [int] NOT NULL,
	[categoryID] [varchar](100) NOT NULL,
	[importDate] [date] NULL,
	[usingDate] [date] NULL,
	[status] [bit] NULL,
	[unit] [nvarchar](100) NULL,
 CONSTRAINT [PK__tblProdu__2D10D14A50FD8107] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 29/04/2022 10:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 29/04/2022 10:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[email] [varchar](255) NOT NULL,
	[fullName] [nvarchar](255) NULL,
	[password] [char](200) NULL,
	[roleID] [int] NULL,
	[address] [nvarchar](300) NULL,
	[birthday] [char](10) NULL,
	[phone] [char](15) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK__tblUsers__AB6E6165F25569D3] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'D01', N'Other')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'F01       ', N'Fruit')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'V01       ', N'Vegetable')
GO
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (1, N'Đậu cove', 39900, N'https://cooponline.vn/wp-content/uploads/2021/08/dau-cove-thuong-2-300x300.jpg', 100, N'V01       ', CAST(N'2022-04-29' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (2, N'Cải xanh Đà Lạt', 14500, N'https://cdn.tgdd.vn/Products/Images/8820/223329/bhx/cai-be-xanh-baby-tui-300g-202012082224129697.jpg', 100, N'V01       ', CAST(N'2022-04-29' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (3, N'Cải thìa Đà Lạt', 14500, N'https://cdn.tgdd.vn/Products/Images/8820/238557/bhx/cai-thia-da-lat-500g-202105061414524285.jpg', 100, N'V01       ', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (4, N'Trái Bầu', 14500, N'https://cooponline.vn/wp-content/uploads/2020/02/trai-bau-1-300x300.jpg', 100, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (5, N'Cà rốt Đà Lạt', 32000, N'https://cooponline.vn/wp-content/uploads/2020/06/ca-rot-da-lat-300x300.jpg', 100, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (6, N'Khoai lang tím', 23000, N'https://cooponline.vn/wp-content/uploads/2021/10/khoai-lang-tim-giong-nhat-kg-300x300.jpg', 100, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (7, N'Chanh không hạt', 39950, N'https://product.hstatic.net/1000282430/product/organic-seedless-lime_456e3363df7240c0a755876157124fde_grande.jpg', 100, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (8, N'Ớt chuông xanh', 19975, N'https://product.hstatic.net/1000282430/product/ot-chuong-xanh_large.jpg', 100, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (10, N'Ớt chuông vàng', 21725, N'https://product.hstatic.net/1000282430/product/ot-chuong-vang_large.jpg', 100, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (11, N'Khoai tây', 36750, N'https://product.hstatic.net/1000282430/product/upload_4cf55b050da744589e0b9ac7a3e8db1a_large.jpg', 100, N'V01', CAST(N'2022-03-04' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (12, N'Việt quất', 148900, N'https://product.hstatic.net/1000282430/product/viet-quat_large.jpg', 100, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (13, N'Chuối Fohla', 25750, N'https://product.hstatic.net/1000282430/product/chuoi-fohla_large.jpg', 100, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (14, N'Ổi', 29950, N'https://product.hstatic.net/1000282430/product/oi-phuc-loc-tho_9a1f6289626b43a88da39041dd9977c3_large.jpg', 100, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (15, N'Cam vàng', 98900, N'https://product.hstatic.net/1000282430/product/cam-navel_large.jpg', 100, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (16, N'Táo xanh', 155900, N'https://product.hstatic.net/1000282430/product/tao_xanh_my_large.jpg', 100, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (17, N'Bơ Đà Lạt', 49950, N'https://product.hstatic.net/1000282430/product/bo_large.jpg', 100, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (18, N'Quýt', 84950, N'https://product.hstatic.net/1000282430/product/quyt_large.jpg', 100, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (19, N'Dưa lưới', 109900, N'https://product.hstatic.net/1000282430/product/cantaloupe_002e4fedb6dc45aaa6be6e679c77f62b_large.jpg', 100, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (20, N'Đu đủ ruột đỏ', 39900, N'https://product.hstatic.net/1000282430/product/du_d__large.jpg', 100, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (21, N'Cam sành', 83900, N'https://product.hstatic.net/1000282430/product/cam-sanh_large.jpg', 100, N'F01       ', CAST(N'2022-04-29' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (22, N'Dưa hấu không hạt', 137700, N'https://product.hstatic.net/1000282430/product/seedless-watermelon-around-2.5kg-whole-fruit_23a860613aa94413aca16b9d766f6291_large.jpg', 100, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (23, N'Bưởi da xanh', 97500, N'https://product.hstatic.net/1000282430/product/buoi-da-xanh_large.jpg', 100, N'F01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (24, N'Măng tây', 25000, N'https://cdn.tgdd.vn/Products/Images/8820/222783/bhx/mang-tay-bo-200g-202012082233230054.jpg', 100, N'V01', CAST(N'2022-03-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (25, N'Mướp hương', 11500, N'https://cdn.tgdd.vn/Products/Images/8785/217180/bhx/muop-huong-tui-1kg-202011111017133769.jpg', 100, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (26, N'Lá giang', 12000, N'https://cdn.tgdd.vn/Products/Images/8820/271745/bhx/la-giang-tuoi-goi-200g-202202121608455174.jpg', 100, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (27, N'Bắp cải trắng', 11000, N'https://cdn.tgdd.vn/Products/Images/8820/232782/bhx/bap-cai-trang-tui-1kg-202012282215020640.jpg', 100, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (28, N'Xà lách', 9000, N'https://cdn.tgdd.vn/Products/Images/8820/226900/bhx/xa-lach-lolo-xanh-tui-500g-202009300006152955.jpg', 100, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (29, N'Củ cải trắng', 9000, N'https://cdn.tgdd.vn/Products/Images/8785/271469/bhx/cu-cai-trang-tui-500g-4-6-cu-202203030852549834.jpg', 100, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (30, N'Su hào', 7500, N'https://cdn.tgdd.vn/Products/Images/8785/222924/bhx/su-hao-xanh-tui-300g-202012282254138489.jpg', 100, N'V01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (31, N'Chuối sấy', 63000, N'https://product.hstatic.net/1000303672/product/chuoi_say__400g__bich__mau_mawashi_-_01_0887273819a3433ebfd351eecf592ee3.jpg', 100, N'D01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'hộp')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (32, N'Khoai lang tím sấy', 65000, N'https://product.hstatic.net/1000303672/product/khoai_lang_tim_say_soi__350g__bich__mau_mawashi_-_01_2c154bdf4e1b440faec99a2c7b9b650a.jpg', 100, N'D01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'hộp')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (33, N'Khoai lang vàng sấy', 75000, N'https://product.hstatic.net/1000303672/product/khoai_lang_vang_say_soi__350g__bich__mau_mawashi_-_01_5ace6e96b18c49ba9eaa90b6949a9190.jpg', 100, N'D01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'hộp')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (34, N'Mít sấy', 76000, N'https://product.hstatic.net/1000303672/product/mit_say__250g__bich__mau_mawashi_-_01_17da6c3a0a8741238bbe9a5ee3b7f642.jpg', 100, N'D01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'hộp')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (35, N'Khoai môn sấy', 106000, N'https://product.hstatic.net/1000303672/product/khoai_mon_say__350g__bich__mau_mawashi_-_01_c6a4eb6571954a2ea8a1396cf7852510.jpg', 100, N'D01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'hộp')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (36, N'Cà chua bi sấy dẻo', 98000, N'https://product.hstatic.net/1000303672/product/cp7a0816_c999df7c829b42fdb242d8126a03d6ef.jpg', 100, N'D01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'hộp')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (37, N'Chuối sấy dẻo', 55000, N'https://product.hstatic.net/1000303672/product/200608_chuoi_say_deo__300g__bich__mau_hut_chan_khong_-_110083_-_02_2f5c883690054bf8b1764b4b96f1b1bc.jpg', 100, N'D01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'hộp')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (38, N'Khoai lang sấy dẻo', 85000, N'https://product.hstatic.net/1000303672/product/00608_khoai_lang_say_deo__300g__bich__mau_hut_chan_khong_-_110107_-_02_ddfaf33ca8a44983894ccd2345b64ab6.jpg', 100, N'D01', CAST(N'2022-02-07' AS Date), CAST(N'2024-01-01' AS Date), 1, N'hộp')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (49, N'Hồng chẻ sấy dẻo', 104000, N'https://product.hstatic.net/1000303672/product/200608_hong_che_say_deo__300g__bich__mau_hut_chan_khong_-_110109_-_02_88d06c69ad2e4453b5e416a56080f1d7.jpg', 100, N'D01', CAST(N'2022-03-09' AS Date), CAST(N'2024-01-01' AS Date), 1, N'hộp')
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [image], [quantity], [categoryID], [importDate], [usingDate], [status], [unit]) VALUES (55, N'Lê đường', 55000, N'https://suckhoedoisong.qltns.mediacdn.vn/2015/1-two-pears-2405-1425959375-1426076921348.jpg', 100, N'F01', CAST(N'2022-03-11' AS Date), CAST(N'2024-01-01' AS Date), 1, N'kg')
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRoles] ON 

INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (1, N'AD')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (2, N'US')
SET IDENTITY_INSERT [dbo].[tblRoles] OFF
GO
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'admin@gmail.com', N'Admin', N'c4ca4238a0b923820dcc509a6f75849b                                                                                                                                                                        ', 1, N'FU', N'2001-01-01', N'0123456789     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'user@gmail.com', N'User', N'c4ca4238a0b923820dcc509a6f75849b                                                                                                                                                                        ', 2, N'FU', N'2001-01-01', N'0123456789     ', 1)
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUsers] FOREIGN KEY([email])
REFERENCES [dbo].[tblUsers] ([email])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUsers]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
/****** Object:  StoredProcedure [dbo].[checkUsingDate]    Script Date: 29/04/2022 10:55:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[checkUsingDate] @productID INT
AS
BEGIN
    IF (SELECT DATEDIFF(DAY, GETDATE(), usingDate)
        FROM tblProduct
        WHERE productID = @productID) <= 0
        BEGIN
        UPDATE tblProduct
        SET quantity = 0
        WHERE productID = @productID 
        END
END
GO
USE [master]
GO
ALTER DATABASE [VegetableStore] SET  READ_WRITE 
GO
