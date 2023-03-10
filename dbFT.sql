USE [master]
GO
/****** Object:  Database [dbFT]    Script Date: 2023/2/1 上午 10:14:04 ******/
CREATE DATABASE [dbFT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbFT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbFT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbFT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbFT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbFT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbFT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbFT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbFT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbFT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbFT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbFT] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbFT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbFT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbFT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbFT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbFT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbFT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbFT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbFT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbFT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbFT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbFT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbFT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbFT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbFT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbFT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbFT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbFT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbFT] SET RECOVERY FULL 
GO
ALTER DATABASE [dbFT] SET  MULTI_USER 
GO
ALTER DATABASE [dbFT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbFT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbFT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbFT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbFT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbFT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbFT', N'ON'
GO
ALTER DATABASE [dbFT] SET QUERY_STORE = OFF
GO
USE [dbFT]
GO
/****** Object:  Table [dbo].[ActDetail]    Script Date: 2023/2/1 上午 10:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActDetail](
	[活動ID] [int] IDENTITY(1,1) NOT NULL,
	[營區ID] [int] NULL,
	[活動方式] [nvarchar](30) NULL,
	[活動種類] [nvarchar](30) NULL,
	[活動名稱] [nvarchar](200) NULL,
	[開始日期] [datetime] NULL,
	[結束日期] [datetime] NULL,
	[預計人數] [int] NULL,
	[活動介紹] [nvarchar](500) NULL,
	[門票價格] [int] NULL,
	[活動圖片] [nvarchar](50) NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_tLocalCampaign] PRIMARY KEY CLUSTERED 
(
	[活動ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Camp]    Script Date: 2023/2/1 上午 10:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camp](
	[營區ID] [int] IDENTITY(1,1) NOT NULL,
	[營區名稱] [nvarchar](20) NULL,
	[營區地址] [nvarchar](80) NULL,
	[地區] [nvarchar](10) NULL,
	[縣市] [nvarchar](10) NULL,
	[營區介紹] [nvarchar](300) NULL,
	[容納人數] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_tCampSite] PRIMARY KEY CLUSTERED 
(
	[營區ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampDetail]    Script Date: 2023/2/1 上午 10:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampDetail](
	[營區細項ID] [int] IDENTITY(1,1) NOT NULL,
	[營區ID] [int] NULL,
	[活動ID] [int] NULL,
	[露營形式ID] [int] NULL,
	[詳細內容] [nvarchar](200) NULL,
	[圖片] [nvarchar](200) NULL,
	[單價] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_tCarPark] PRIMARY KEY CLUSTERED 
(
	[營區細項ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampStyle]    Script Date: 2023/2/1 上午 10:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampStyle](
	[露營形式ID] [int] IDENTITY(1,1) NOT NULL,
	[項目內容] [nvarchar](50) NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_項目] PRIMARY KEY CLUSTERED 
(
	[露營形式ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberInfo]    Script Date: 2023/2/1 上午 10:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberInfo](
	[會員ID] [int] IDENTITY(1,1) NOT NULL,
	[姓名] [nvarchar](50) NOT NULL,
	[性別] [bit] NULL,
	[出生日期] [date] NOT NULL,
	[電話號碼] [nvarchar](50) NULL,
	[連絡信箱] [nvarchar](50) NOT NULL,
	[會員帳號] [nvarchar](50) NOT NULL,
	[會員密碼] [nvarchar](50) NOT NULL,
	[照片] [nvarchar](500) NULL,
	[權限] [bit] NULL,
	[建立時間] [datetime] NULL,
	[修改時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
 CONSTRAINT [PK_會員資料庫] PRIMARY KEY CLUSTERED 
(
	[會員ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentDetail]    Script Date: 2023/2/1 上午 10:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentDetail](
	[租賃商店ID] [int] IDENTITY(1,1) NOT NULL,
	[產品名稱] [nvarchar](100) NULL,
	[產品說明] [nvarchar](300) NULL,
	[庫存] [int] NULL,
	[圖片] [nvarchar](500) NULL,
	[數量] [int] NULL,
	[單日租金] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_租賃商店] PRIMARY KEY CLUSTERED 
(
	[租賃商店ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SelfFood]    Script Date: 2023/2/1 上午 10:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelfFood](
	[自選飲食ID] [int] IDENTITY(1,1) NOT NULL,
	[圖片] [nvarchar](50) NULL,
	[需求人數] [int] NULL,
	[需求份數] [int] NULL,
	[商品名稱] [nvarchar](50) NULL,
	[商品內容] [nvarchar](300) NULL,
	[單價] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_自選飲食編號ID] PRIMARY KEY CLUSTERED 
(
	[自選飲食ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SelfOrder]    Script Date: 2023/2/1 上午 10:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelfOrder](
	[自選訂單ID] [int] IDENTITY(1,1) NOT NULL,
	[會員ID] [int] NULL,
	[自選訂單編號] [int] NULL,
	[入住時間] [datetime] NULL,
	[退住時間] [datetime] NULL,
	[露營天數] [int] NULL,
	[預計人數] [int] NULL,
	[營區細項ID] [int] NULL,
	[自選飲食ID] [int] NULL,
	[租賃商店ID] [int] NULL,
	[租借總價] [int] NULL,
	[自選訂單總價] [int] NULL,
	[評論] [nvarchar](500) NULL,
	[評分] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_自選訂單編號ID] PRIMARY KEY CLUSTERED 
(
	[自選訂單ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetFood]    Script Date: 2023/2/1 上午 10:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetFood](
	[餐廳ID] [int] IDENTITY(1,1) NOT NULL,
	[餐廳名] [nvarchar](50) NULL,
	[餐廳電話] [nvarchar](50) NULL,
	[地址] [nvarchar](100) NULL,
	[餐點細項] [nvarchar](300) NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_set餐廳] PRIMARY KEY CLUSTERED 
(
	[餐廳ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetOrder]    Script Date: 2023/2/1 上午 10:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetOrder](
	[套裝訂單ID] [int] IDENTITY(1,1) NOT NULL,
	[套裝行程ID] [int] NOT NULL,
	[會員ID] [int] NULL,
	[套裝訂單編號] [int] NULL,
	[入住時間] [datetime] NULL,
	[退住時間] [datetime] NULL,
	[預計人數] [int] NULL,
	[合計總價] [int] NULL,
	[評論] [nvarchar](500) NULL,
	[評分] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_set訂單] PRIMARY KEY CLUSTERED 
(
	[套裝訂單ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetOrderDetail]    Script Date: 2023/2/1 上午 10:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetOrderDetail](
	[套裝行程ID] [int] IDENTITY(1,1) NOT NULL,
	[營地ID] [int] NULL,
	[營區細項ID] [int] NULL,
	[餐廳ID] [int] NULL,
	[套裝方案] [nvarchar](300) NULL,
	[套裝細項] [nvarchar](300) NULL,
	[套裝行程價格] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_set行程] PRIMARY KEY CLUSTERED 
(
	[套裝行程ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopDetail]    Script Date: 2023/2/1 上午 10:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopDetail](
	[商品細項ID] [int] IDENTITY(1,1) NOT NULL,
	[品牌名稱] [nvarchar](100) NULL,
	[產品名稱] [nvarchar](100) NULL,
	[產品說明] [nvarchar](300) NULL,
	[產品圖片] [nvarchar](500) NULL,
	[庫存] [int] NULL,
	[單價] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_購物商店] PRIMARY KEY CLUSTERED 
(
	[商品細項ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopOrder]    Script Date: 2023/2/1 上午 10:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopOrder](
	[商店ID] [int] IDENTITY(1,1) NOT NULL,
	[商品細項ID] [int] NULL,
	[會員ID] [int] NULL,
	[商店訂單編號] [int] NULL,
	[成立時間] [datetime] NULL,
	[細項] [nvarchar](1000) NULL,
	[總價] [int] NULL,
	[購物評價] [nvarchar](200) NULL,
	[購物評分] [int] NULL,
	[建立人] [nvarchar](50) NULL,
	[建立時間] [datetime] NULL,
	[修改人] [nvarchar](50) NULL,
	[修改時間] [datetime] NULL,
 CONSTRAINT [PK_購物訂單] PRIMARY KEY CLUSTERED 
(
	[商店ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SetFood] ON 

INSERT [dbo].[SetFood] ([餐廳ID], [餐廳名], [餐廳電話], [地址], [餐點細項], [建立人], [建立時間], [修改人], [修改時間]) VALUES (1, N'蟬說：夕陽漫漫園區', N'04-37022557', N'台中市清水區美堤街8號', N'園區Buffet 下午茶：14:30-16:30 晚餐時間：18:00-19:30 (最晚入場18:30) 早餐時間：08:00-09:30', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SetFood] OFF
GO
ALTER TABLE [dbo].[ActDetail]  WITH CHECK ADD  CONSTRAINT [FK_tLocalCampaign_tCampSite] FOREIGN KEY([營區ID])
REFERENCES [dbo].[Camp] ([營區ID])
GO
ALTER TABLE [dbo].[ActDetail] CHECK CONSTRAINT [FK_tLocalCampaign_tCampSite]
GO
ALTER TABLE [dbo].[CampDetail]  WITH CHECK ADD  CONSTRAINT [FK_tCampDetale_tCampSite] FOREIGN KEY([營區ID])
REFERENCES [dbo].[Camp] ([營區ID])
GO
ALTER TABLE [dbo].[CampDetail] CHECK CONSTRAINT [FK_tCampDetale_tCampSite]
GO
ALTER TABLE [dbo].[CampDetail]  WITH CHECK ADD  CONSTRAINT [FK_tCampDetale_tLocalCampaign] FOREIGN KEY([活動ID])
REFERENCES [dbo].[ActDetail] ([活動ID])
GO
ALTER TABLE [dbo].[CampDetail] CHECK CONSTRAINT [FK_tCampDetale_tLocalCampaign]
GO
ALTER TABLE [dbo].[CampDetail]  WITH CHECK ADD  CONSTRAINT [FK_tCampDetale_項目] FOREIGN KEY([露營形式ID])
REFERENCES [dbo].[CampStyle] ([露營形式ID])
GO
ALTER TABLE [dbo].[CampDetail] CHECK CONSTRAINT [FK_tCampDetale_項目]
GO
ALTER TABLE [dbo].[SelfOrder]  WITH CHECK ADD  CONSTRAINT [FK_自選行程訂單_tCampDetale] FOREIGN KEY([營區細項ID])
REFERENCES [dbo].[CampDetail] ([營區細項ID])
GO
ALTER TABLE [dbo].[SelfOrder] CHECK CONSTRAINT [FK_自選行程訂單_tCampDetale]
GO
ALTER TABLE [dbo].[SelfOrder]  WITH CHECK ADD  CONSTRAINT [FK_自選行程訂單_會員資料庫] FOREIGN KEY([會員ID])
REFERENCES [dbo].[MemberInfo] ([會員ID])
GO
ALTER TABLE [dbo].[SelfOrder] CHECK CONSTRAINT [FK_自選行程訂單_會員資料庫]
GO
ALTER TABLE [dbo].[SelfOrder]  WITH CHECK ADD  CONSTRAINT [FK_自選行程訂單_飲食] FOREIGN KEY([自選飲食ID])
REFERENCES [dbo].[SelfFood] ([自選飲食ID])
GO
ALTER TABLE [dbo].[SelfOrder] CHECK CONSTRAINT [FK_自選行程訂單_飲食]
GO
ALTER TABLE [dbo].[SelfOrder]  WITH CHECK ADD  CONSTRAINT [FK_自選行程訂單_租賃商店] FOREIGN KEY([租賃商店ID])
REFERENCES [dbo].[RentDetail] ([租賃商店ID])
GO
ALTER TABLE [dbo].[SelfOrder] CHECK CONSTRAINT [FK_自選行程訂單_租賃商店]
GO
ALTER TABLE [dbo].[SetOrder]  WITH CHECK ADD  CONSTRAINT [FK_set訂單_set行程] FOREIGN KEY([套裝行程ID])
REFERENCES [dbo].[SetOrderDetail] ([套裝行程ID])
GO
ALTER TABLE [dbo].[SetOrder] CHECK CONSTRAINT [FK_set訂單_set行程]
GO
ALTER TABLE [dbo].[SetOrder]  WITH CHECK ADD  CONSTRAINT [FK_set訂單_會員資料庫] FOREIGN KEY([會員ID])
REFERENCES [dbo].[MemberInfo] ([會員ID])
GO
ALTER TABLE [dbo].[SetOrder] CHECK CONSTRAINT [FK_set訂單_會員資料庫]
GO
ALTER TABLE [dbo].[SetOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_set行程_set餐廳] FOREIGN KEY([餐廳ID])
REFERENCES [dbo].[SetFood] ([餐廳ID])
GO
ALTER TABLE [dbo].[SetOrderDetail] CHECK CONSTRAINT [FK_set行程_set餐廳]
GO
ALTER TABLE [dbo].[SetOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_set行程_tCampDetale] FOREIGN KEY([營區細項ID])
REFERENCES [dbo].[CampDetail] ([營區細項ID])
GO
ALTER TABLE [dbo].[SetOrderDetail] CHECK CONSTRAINT [FK_set行程_tCampDetale]
GO
ALTER TABLE [dbo].[SetOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_set行程_tCampSite] FOREIGN KEY([營地ID])
REFERENCES [dbo].[Camp] ([營區ID])
GO
ALTER TABLE [dbo].[SetOrderDetail] CHECK CONSTRAINT [FK_set行程_tCampSite]
GO
ALTER TABLE [dbo].[ShopOrder]  WITH CHECK ADD  CONSTRAINT [FK_購物訂單_購物商店] FOREIGN KEY([商品細項ID])
REFERENCES [dbo].[ShopDetail] ([商品細項ID])
GO
ALTER TABLE [dbo].[ShopOrder] CHECK CONSTRAINT [FK_購物訂單_購物商店]
GO
ALTER TABLE [dbo].[ShopOrder]  WITH CHECK ADD  CONSTRAINT [FK_購物訂單_會員資料庫] FOREIGN KEY([會員ID])
REFERENCES [dbo].[MemberInfo] ([會員ID])
GO
ALTER TABLE [dbo].[ShopOrder] CHECK CONSTRAINT [FK_購物訂單_會員資料庫]
GO
USE [master]
GO
ALTER DATABASE [dbFT] SET  READ_WRITE 
GO
