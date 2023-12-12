USE [master]
GO
/****** Object:  Database [QLHuanLuyen]    Script Date: 13/12/2023 4:40:44 SA ******/
CREATE DATABASE [QLHuanLuyen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLHuanLuyen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QLHuanLuyen.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLHuanLuyen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QLHuanLuyen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLHuanLuyen] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLHuanLuyen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLHuanLuyen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLHuanLuyen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLHuanLuyen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLHuanLuyen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLHuanLuyen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLHuanLuyen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLHuanLuyen] SET  MULTI_USER 
GO
ALTER DATABASE [QLHuanLuyen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLHuanLuyen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLHuanLuyen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLHuanLuyen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLHuanLuyen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLHuanLuyen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLHuanLuyen] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLHuanLuyen] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLHuanLuyen]
GO
/****** Object:  User [minchou]    Script Date: 13/12/2023 4:40:44 SA ******/
CREATE USER [minchou] FOR LOGIN [minchou] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [minchou]
GO
/****** Object:  Table [dbo].[BaiHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiHoc](
	[id_baiHoc] [nvarchar](10) NOT NULL,
	[tenBaiHoc] [nvarchar](200) NULL,
	[id_monHoc] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_baiHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BienCheTTB]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BienCheTTB](
	[id_HV] [varchar](10) NOT NULL,
	[id_TTB] [varchar](10) NOT NULL,
	[id_monHoc] [varchar](10) NOT NULL,
	[thoiGianNhanTTB] [date] NULL,
	[trangThai] [bit] NULL,
 CONSTRAINT [PK_BienCheTTB] PRIMARY KEY CLUSTERED 
(
	[id_HV] ASC,
	[id_TTB] ASC,
	[id_monHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canbo]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canbo](
	[id_CB] [varchar](10) NOT NULL,
	[tenCB] [nvarchar](100) NULL,
	[ngaySinh] [date] NULL,
	[gioiTinh] [nvarchar](50) NULL,
	[queQuan] [nvarchar](100) NULL,
	[id_DV] [varchar](10) NULL,
	[sdt] [varchar](10) NULL,
	[capBac] [nvarchar](100) NULL,
	[trangThai] [bit] NULL,
	[id_LoaiCB] [varchar](10) NULL,
	[id_user] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_CB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CapDonVi]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapDonVi](
	[id_capDV] [int] NOT NULL,
	[tenCapDV] [nvarchar](100) NULL,
	[moTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_capDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChungLoai]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChungLoai](
	[id_chungLoai] [varchar](10) NOT NULL,
	[tenChungLoai] [nvarchar](100) NULL,
	[giaCa] [int] NULL,
	[moTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_chungLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonVi]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonVi](
	[id_DV] [varchar](10) NOT NULL,
	[tenDV] [nvarchar](100) NULL,
	[id_capDV] [int] NULL,
	[moTa] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_DV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DVTrucThuoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DVTrucThuoc](
	[id_capTren] [varchar](10) NOT NULL,
	[id_capDuoi] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_capTren] ASC,
	[id_capDuoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocVien]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocVien](
	[id_HV] [varchar](10) NOT NULL,
	[tenHV] [nvarchar](100) NULL,
	[ngaySinh] [date] NULL,
	[gioiTinh] [nvarchar](50) NULL,
	[queQuan] [nvarchar](100) NULL,
	[id_DV] [varchar](10) NULL,
	[tenLop] [nvarchar](100) NULL,
	[id_khoaHoc] [varchar](10) NULL,
	[sdt] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_HV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KetQuaHuanLuyen]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KetQuaHuanLuyen](
	[id_monHoc] [varchar](10) NOT NULL,
	[id_HV] [varchar](10) NOT NULL,
	[diemCC] [float] NULL,
	[diemTX] [float] NULL,
	[diemThi] [float] NULL,
	[namHoc] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_HV] ASC,
	[id_monHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHHLDaiDoi]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHHLDaiDoi](
	[id_NDBH] [varchar](10) NOT NULL,
	[id_DV] [varchar](10) NOT NULL,
	[tgBatDau] [date] NULL,
	[diaDiem] [nvarchar](100) NULL,
	[id_CB] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_NDBH] ASC,
	[id_DV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHHLTieuDoan]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHHLTieuDoan](
	[id_baiHoc] [nvarchar](10) NOT NULL,
	[id_DV] [varchar](10) NOT NULL,
	[tgBatDau] [date] NULL,
	[id_CB] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_baiHoc] ASC,
	[id_DV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHHLTrungDoan]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHHLTrungDoan](
	[id_monHoc] [varchar](10) NOT NULL,
	[id_DV] [varchar](10) NOT NULL,
	[id_CB] [varchar](10) NULL,
	[idnguoiDay] [varchar](10) NULL,
	[trangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_monHoc] ASC,
	[id_DV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhoaHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoaHoc](
	[id_khoaHoc] [varchar](10) NOT NULL,
	[tenKhoaHoc] [nvarchar](100) NULL,
	[thoigianBD] [date] NULL,
	[thoigianKT] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_khoaHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiCanBo]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiCanBo](
	[id_LoaiCB] [varchar](10) NOT NULL,
	[tenLoaiCB] [nvarchar](100) NULL,
	[moTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_LoaiCB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[id_monHoc] [varchar](10) NOT NULL,
	[tenMonHoc] [nvarchar](100) NULL,
	[moTa] [nvarchar](max) NULL,
	[doiTuong] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_monHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoiDungBaiHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoiDungBaiHoc](
	[id_NDBH] [varchar](10) NOT NULL,
	[tenNDBH] [nvarchar](100) NULL,
	[thoiGian] [int] NULL,
	[soTiet] [int] NULL,
	[id_baiHoc] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_NDBH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyenTK]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyenTK](
	[id_quyenTK] [int] NOT NULL,
	[tenQuyenTK] [nvarchar](100) NULL,
	[moTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_quyenTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TTB]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TTB](
	[id_TTB] [varchar](10) NOT NULL,
	[id_chungLoai] [varchar](10) NULL,
	[trangThai] [bit] NULL,
	[tinhTrang] [nvarchar](100) NULL,
	[id_DV] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_TTB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [varchar](10) NULL,
	[username] [varchar](100) NULL,
	[passwrd] [varchar](100) NULL,
	[id_quyenTK] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BaiHoc]  WITH CHECK ADD FOREIGN KEY([id_monHoc])
REFERENCES [dbo].[MonHoc] ([id_monHoc])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BienCheTTB]  WITH CHECK ADD  CONSTRAINT [FK__BienCheTT__id_HV__6C190EBB] FOREIGN KEY([id_HV])
REFERENCES [dbo].[HocVien] ([id_HV])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BienCheTTB] CHECK CONSTRAINT [FK__BienCheTT__id_HV__6C190EBB]
GO
ALTER TABLE [dbo].[BienCheTTB]  WITH CHECK ADD  CONSTRAINT [FK__BienCheTT__id_mo__6E01572D] FOREIGN KEY([id_monHoc])
REFERENCES [dbo].[MonHoc] ([id_monHoc])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BienCheTTB] CHECK CONSTRAINT [FK__BienCheTT__id_mo__6E01572D]
GO
ALTER TABLE [dbo].[BienCheTTB]  WITH CHECK ADD  CONSTRAINT [FK__BienCheTT__id_TT__6D0D32F4] FOREIGN KEY([id_TTB])
REFERENCES [dbo].[TTB] ([id_TTB])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BienCheTTB] CHECK CONSTRAINT [FK__BienCheTT__id_TT__6D0D32F4]
GO
ALTER TABLE [dbo].[Canbo]  WITH CHECK ADD FOREIGN KEY([id_DV])
REFERENCES [dbo].[DonVi] ([id_DV])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Canbo]  WITH CHECK ADD FOREIGN KEY([id_LoaiCB])
REFERENCES [dbo].[LoaiCanBo] ([id_LoaiCB])
GO
ALTER TABLE [dbo].[DonVi]  WITH CHECK ADD FOREIGN KEY([id_capDV])
REFERENCES [dbo].[CapDonVi] ([id_capDV])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DVTrucThuoc]  WITH CHECK ADD FOREIGN KEY([id_capTren])
REFERENCES [dbo].[DonVi] ([id_DV])
GO
ALTER TABLE [dbo].[DVTrucThuoc]  WITH CHECK ADD FOREIGN KEY([id_capDuoi])
REFERENCES [dbo].[DonVi] ([id_DV])
GO
ALTER TABLE [dbo].[HocVien]  WITH CHECK ADD FOREIGN KEY([id_DV])
REFERENCES [dbo].[DonVi] ([id_DV])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HocVien]  WITH CHECK ADD FOREIGN KEY([id_khoaHoc])
REFERENCES [dbo].[KhoaHoc] ([id_khoaHoc])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KetQuaHuanLuyen]  WITH CHECK ADD FOREIGN KEY([id_HV])
REFERENCES [dbo].[HocVien] ([id_HV])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KetQuaHuanLuyen]  WITH CHECK ADD FOREIGN KEY([id_monHoc])
REFERENCES [dbo].[MonHoc] ([id_monHoc])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KHHLDaiDoi]  WITH CHECK ADD FOREIGN KEY([id_CB])
REFERENCES [dbo].[Canbo] ([id_CB])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KHHLDaiDoi]  WITH CHECK ADD FOREIGN KEY([id_DV])
REFERENCES [dbo].[DonVi] ([id_DV])
GO
ALTER TABLE [dbo].[KHHLDaiDoi]  WITH CHECK ADD FOREIGN KEY([id_NDBH])
REFERENCES [dbo].[NoiDungBaiHoc] ([id_NDBH])
GO
ALTER TABLE [dbo].[KHHLTieuDoan]  WITH CHECK ADD FOREIGN KEY([id_baiHoc])
REFERENCES [dbo].[BaiHoc] ([id_baiHoc])
GO
ALTER TABLE [dbo].[KHHLTieuDoan]  WITH CHECK ADD FOREIGN KEY([id_CB])
REFERENCES [dbo].[Canbo] ([id_CB])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KHHLTrungDoan]  WITH CHECK ADD FOREIGN KEY([id_CB])
REFERENCES [dbo].[Canbo] ([id_CB])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KHHLTrungDoan]  WITH CHECK ADD FOREIGN KEY([id_monHoc])
REFERENCES [dbo].[MonHoc] ([id_monHoc])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NoiDungBaiHoc]  WITH CHECK ADD FOREIGN KEY([id_baiHoc])
REFERENCES [dbo].[BaiHoc] ([id_baiHoc])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TTB]  WITH CHECK ADD FOREIGN KEY([id_chungLoai])
REFERENCES [dbo].[ChungLoai] ([id_chungLoai])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TTB]  WITH CHECK ADD FOREIGN KEY([id_DV])
REFERENCES [dbo].[DonVi] ([id_DV])
GO
ALTER TABLE [dbo].[TTB]  WITH CHECK ADD FOREIGN KEY([id_DV])
REFERENCES [dbo].[DonVi] ([id_DV])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([id_quyenTK])
REFERENCES [dbo].[QuyenTK] ([id_quyenTK])
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[create_c_tructhuoc_d]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[create_c_tructhuoc_d]
@id_DV varchar(10), @tenDV nvarchar(100), @moTa nvarchar(100), @id_capTren varchar(10)
as
begin
insert into DonVi(id_DV, tenDV, id_capDV, moTa) values (@id_DV, @tenDV, '1', @moTa);
insert into DVTrucThuoc(id_capTren,id_capDuoi) values (@id_capTren,@id_DV);
end;
GO
/****** Object:  StoredProcedure [dbo].[create_d_tructhuoc_e]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[create_d_tructhuoc_e]
@id_DV varchar(10), @tenDV nvarchar(100), @moTa nvarchar(100), @id_capTren varchar(10)
as
begin
insert into DonVi(id_DV, tenDV, id_capDV, moTa) values (@id_DV, @tenDV, '2', @moTa);
insert into DVTrucThuoc(id_capTren,id_capDuoi) values (@id_capTren,@id_DV);
end;
GO
/****** Object:  StoredProcedure [dbo].[createBaiHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[createBaiHoc]
@idBaiHoc varchar(10), @tenBaiHoc nvarchar(100), @idMonHoc varchar(10)
as
begin
insert into BaiHoc(id_baiHoc,tenBaiHoc,id_monHoc) values (@idBaiHoc,@tenBaiHoc,@idMonHoc);
end
GO
/****** Object:  StoredProcedure [dbo].[createBienCheTTB]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[createBienCheTTB]
@id_HV varchar(10), @id_TTB varchar(10), @id_monHoc varchar(10), @thoiGianNhanTTB date
as
begin
insert into BienCheTTB(id_HV, id_monHoc, id_TTB, thoiGianNhanTTB, trangThai) values (@id_HV,@id_monHoc,@id_TTB,@thoiGianNhanTTB,'1');
update TTB set trangThai = '1' where id_TTB = @id_TTB;
end
GO
/****** Object:  StoredProcedure [dbo].[createCB]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[createCB]
@tenCB nvarchar(100), @id_CB varchar(10), @ngaySinh date, @gioiTinh nvarchar(50), @queQuan nvarchar(100), @capBac nvarchar(100), @sdt varchar(10), @tenLoaiCB nvarchar(100), @trangThai bit, @id_DV varchar(10)
as
begin
declare @id_LoaiCB varchar(10)
select @id_LoaiCB = id_LoaiCB from LoaiCanBo where tenLoaiCB = @tenLoaiCB;

insert into Canbo(tenCB , id_CB, ngaySinh ,gioiTinh, queQuan, capBac, sdt, id_LoaiCB, trangThai, id_DV) values (@tenCB , @id_CB, @ngaySinh , @gioiTinh, @queQuan, @capBac, @sdt, @id_LoaiCB, @trangThai, @id_DV);
end
GO
/****** Object:  StoredProcedure [dbo].[createChungLoai]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[createChungLoai] 
@id_chungLoai varchar(10), @tenChungLoai nvarchar(100), @giaCa int, @moTa nvarchar(max)
as
begin
insert into ChungLoai(id_chungLoai, tenChungLoai, giaCa, moTa) values (@id_chungLoai, @tenChungLoai, @giaCa, @moTa);
end
GO
/****** Object:  StoredProcedure [dbo].[createDV]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[createDV]
@id_DV varchar(10), @tenDV nvarchar(100), @id_capDV int, @moTa nvarchar(100)
as
begin
insert into DonVi(id_DV, tenDV, id_capDV, moTa) values (@id_DV, @tenDV, @id_capDV, @moTa);
end;
GO
/****** Object:  StoredProcedure [dbo].[createHV]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[createHV]
@tenHV nvarchar(100), @id_HV varchar(10), @ngaySinhHV date, @gioiTinh nvarchar(50), @queQuan nvarchar(100), @tenLop nvarchar(100), @id_DV varchar(10), @sdt varchar(10), @idKhoaHoc varchar(10)
as
begin
insert into HocVien(id_HV,tenHV,ngaySinh,gioiTinh,queQuan, id_DV, tenLop, id_khoaHoc,sdt) values (@id_HV, @tenHV, @ngaySinhHV, @gioiTinh, @queQuan,@id_DV,@tenLop,@idKhoaHoc,@sdt);
end
GO
/****** Object:  StoredProcedure [dbo].[createKhoaHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[createKhoaHoc] 
@id_khoaHoc varchar(10), @tenKhoaHoc nvarchar(100), @thoigianBD date, @thoigianKT date
as
begin
insert into KhoaHoc(id_khoaHoc,tenKhoaHoc,thoigianBD,thoigianKT) values (@id_khoaHoc,@tenKhoaHoc,@thoigianBD,@thoigianKT);
end
GO
/****** Object:  StoredProcedure [dbo].[createMonHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[createMonHoc]
@idMonHoc varchar(10), @tenMonHoc nvarchar(100),@doiTuong nvarchar(100), @moTa nvarchar(max)
as
begin 
insert into MonHoc(id_monHoc,tenMonHoc, doiTuong, moTa) values (@idMonHoc, @tenMonHoc,@doiTuong, @moTa);
end
GO
/****** Object:  StoredProcedure [dbo].[createNoiDungBaiHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[createNoiDungBaiHoc]
@id_NDBH varchar(10), @tenNDBH nvarchar(100), @thoiGian int, @soTiet int, @id_baiHoc varchar(10)
as
begin
insert into NoiDungBaiHoc (id_NDBH,tenNDBH,thoiGian,soTiet,id_baiHoc) values (@id_NDBH,@tenNDBH,@thoiGian,@soTiet,@id_baiHoc);
end
GO
/****** Object:  StoredProcedure [dbo].[createTTB]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[createTTB]
@id_TTB varchar(10), @id_chungLoai varchar(10), @tinhTrang nvarchar(100), @idDV varchar(10)
as
begin
insert into TTB(id_TTB, id_chungLoai, trangThai, tinhTrang, id_DV) values (@id_TTB,@id_chungLoai,'0',@tinhTrang,@idDV);
end
GO
/****** Object:  StoredProcedure [dbo].[delete_c_tructhuoc_d]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delete_c_tructhuoc_d]
@id_DV varchar(10)
as
begin
delete from DVTrucThuoc where id_capDuoi = @id_DV;
delete from DonVi where id_DV = @id_DV;
end; 
GO
/****** Object:  StoredProcedure [dbo].[deleteBienCheTTB]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[deleteBienCheTTB]
@id_HV varchar(10), @id_monHoc varchar(10)
as
begin
declare @trangThai bit;
select @trangThai = trangThai from BienCheTTB where id_HV = @id_HV and id_monHoc = @id_monHoc;
if @trangThai!=0
begin
update TTB set trangThai = '0' where id_TTB in (select id_TTB from BienCheTTB where id_HV = @id_HV and id_monHoc = @id_monHoc);
delete from BienCheTTB where id_HV = @id_HV and id_monHoc = @id_monHoc;
end
else
begin
delete from BienCheTTB where id_HV = @id_HV and id_monHoc = @id_monHoc;
end


end
GO
/****** Object:  StoredProcedure [dbo].[deleteCanBo]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteCanBo]
@id_CB varchar(10)
as
begin
delete from KHHLDaiDoi where id_CB = @id_CB;
delete from KHHLTieuDoan where id_CB = @id_CB;
delete from KHHLTrungDoan where id_CB = @id_CB;
delete from Canbo where id_CB = @id_CB;
end
GO
/****** Object:  StoredProcedure [dbo].[deleteChungLoaitheoDonVi]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteChungLoaitheoDonVi]
@id_chungLoai varchar(10), @idDV varchar(10)
as
begin
delete from BienCheTTB where id_TTB in (select id_TTB from TTB where id_chungLoai = @id_chungLoai and id_DV = @idDV);
delete from TTB where id_TTB in (select id_TTB from TTB where id_chungLoai = @id_chungLoai and id_DV = @idDV);
end
GO
/****** Object:  StoredProcedure [dbo].[deleteDV]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteDV]
    @id_DV NVARCHAR(10)
AS
BEGIN
    -- Lấy danh sách các đơn vị cấp dưới
    DECLARE @ChildUnits TABLE (id_DV NVARCHAR(10));
    INSERT INTO @ChildUnits SELECT id_capDuoi FROM DVTrucThuoc WHERE id_capTren = @id_DV;

    -- Xóa các dòng trong bảng DVTrucThuoc có id_capTren hoặc id_capDuoi là @id_DV
    DELETE FROM DVTrucThuoc WHERE id_capTren = @id_DV OR id_capDuoi = @id_DV;

    -- Xóa đơn vị hiện tại từ bảng DonVi
    DELETE FROM DonVi WHERE id_DV = @id_DV;

    -- Đệ quy để xóa các đơn vị cấp dưới
    WHILE EXISTS (SELECT * FROM @ChildUnits)
    BEGIN
        DECLARE @ChildUnit NVARCHAR(10);
        SELECT TOP 1 @ChildUnit = id_DV FROM @ChildUnits;

        -- Xóa đơn vị cấp dưới hiện tại từ bảng tạm thời
		delete from KHHLDaiDoi where id_DV = @ChildUnit;
		delete from KHHLTieuDoan where id_DV = @ChildUnit;
		delete from KHHLTrungDoan where id_DV = @ChildUnit;
		delete from Canbo where id_DV = @ChildUnit;
		delete from KetQuaHuanLuyen where id_HV in (select id_HV from HocVien where id_DV = @ChildUnit);
		delete from BienCheTTB where id_HV in (select id_HV from HocVien where id_DV = @ChildUnit);
		delete from TTB where id_DV = @ChildUnit;
        DELETE FROM @ChildUnits WHERE id_DV = @ChildUnit;


        -- Thực hiện xóa đơn vị cấp dưới hiện tại và đệ quy
        EXEC deleteDV @ChildUnit;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[deleteHVtheoDonVi]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteHVtheoDonVi]
@id_HV varchar(10)
as
begin
delete from KetQuaHuanLuyen where id_HV = @id_HV;
delete from BienCheTTB where id_HV = @id_HV;
delete from HocVien where id_HV = @id_HV;
end
GO
/****** Object:  StoredProcedure [dbo].[deleteHVtheoKhoaHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteHVtheoKhoaHoc]
@id_khoaHoc varchar(10)
as
begin
delete from KetQuaHuanLuyen where id_HV in (select id_HV from HocVien where id_khoaHoc = @id_khoaHoc);
delete from BienCheTTB where id_HV in (select id_HV from HocVien where id_khoaHoc = @id_khoaHoc);
delete from HocVien where id_HV in (select id_HV from HocVien where id_khoaHoc = @id_khoaHoc);
delete from KhoaHoc where id_khoaHoc = @id_khoaHoc;
end
GO
/****** Object:  StoredProcedure [dbo].[deleteTTB]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteTTB]
@id_TTB varchar(10)
as
begin
delete from BienCheTTB where id_TTB = @id_TTB
delete from TTB where id_TTB = @id_TTB
end
GO
/****** Object:  StoredProcedure [dbo].[DonViTheoCap]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DonViTheoCap]
@capDV int
as
begin
if @capDV != 0
begin
	select DV.tenDV, DV.id_DV, CDV.tenCapDV, DVTT.id_capTren, DV.moTa from DonVi as DV inner join CapDonVi as CDV on DV.id_capDV = CDV.id_capDV full outer join DVTrucThuoc as DVTT on DV.id_DV = DVTT.id_capDuoi where DV.id_capDV = @capDV;
end
else
begin
	select DV.tenDV, DV.id_DV, CDV.tenCapDV, DV.moTa from DonVi as DV inner join CapDonVi as CDV on DV.id_capDV = CDV.id_capDV;
end
end;
GO
/****** Object:  StoredProcedure [dbo].[DonViTrucThuoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DonViTrucThuoc]
@dvCapTren varchar(10)
as
begin
select DV.tenDV, DV.id_DV, CDV.tenCapDV, DV.moTa from DVTrucThuoc as DVTT inner join DonVi as DV on DVTT.id_capDuoi = DV.id_DV inner join CapDonVi as CDV on DV.id_capDV = CDV.id_capDV where DVTT.id_capTren = @dvCapTren;
end;
GO
/****** Object:  StoredProcedure [dbo].[getCanBo]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getCanBo]
@idDV varchar(10)
as
begin
select CB.id_CB, CB.tenCB, format(CB.ngaySinh,'dd/MM/yyyy') as ngaySinh, CB.gioiTinh, CB.queQuan, CB.capBac, CB.sdt,LCB.tenLoaiCB, CB.trangThai  from Canbo as CB inner join LoaiCanBo as LCB on CB.id_LoaiCB = LCB.id_LoaiCB where CB.id_DV = @idDV
end
GO
/****** Object:  StoredProcedure [dbo].[getCBtheoUsername]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getCBtheoUsername]
@username nvarchar(100)
as
begin
declare @id_user varchar(10), @id_CB varchar(10);
select @id_user = id_user from Users where username = @username;
select id_CB, tenCB from Canbo where id_user = @id_user;
end
GO
/****** Object:  StoredProcedure [dbo].[getDonVi]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getDonVi]
as
begin
select DV.tenDV, DV.id_DV, DV.id_capDV, CDV.tenCapDV,DVTT.id_capTren, DV.moTa from DonVi as DV inner join CapDonVi as CDV on DV.id_capDV = CDV.id_capDV full outer join DVTrucThuoc as DVTT on DV.id_DV = DVTT.id_capDuoi
end;
GO
/****** Object:  StoredProcedure [dbo].[getdsBaiHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getdsBaiHoc] 
@idMonHoc varchar(10)
as
begin
select id_baiHoc, tenBaiHoc from BaiHoc where id_monHoc = @idMonHoc;
end
GO
/****** Object:  StoredProcedure [dbo].[getdsBienChe]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getdsBienChe]
@idDV varchar(10)
as
begin
-- Lấy danh sách id_DV cấp 1 là đơn vị cấp dưới trực thuộc của id_DV_Cap2
WITH DonViCap1 AS (
    SELECT DISTINCT d1.id_DV, d1.tenDV
    FROM DonVi d1
    JOIN DVTrucThuoc dv1 ON d1.id_DV = dv1.id_capDuoi
    WHERE dv1.id_capTren in (
        SELECT id_DV
        FROM DonVi
        JOIN DVTrucThuoc dv2 ON DonVi.id_DV = dv2.id_capDuoi
        WHERE dv2.id_capTren = @idDV
    )
)

-- Lấy danh sách HocVien từ những đơn vị cấp dưới đã lấy được ở trên
SELECT hv.id_HV, hv.tenHV, dv1.tenDV, MH.tenMonHoc, BC.id_TTB,format(BC.thoiGianNhanTTB,'dd/MM/yyyy') as thoiGianNhanTTB , BC.trangThai
FROM HocVien hv
inner JOIN DonViCap1 dv1 ON hv.id_DV = dv1.id_DV inner join BienCheTTB as BC on hv.id_HV = BC.id_HV inner join MonHoc as MH on BC.id_monHoc = MH.id_monHoc;
end
GO
/****** Object:  StoredProcedure [dbo].[getdsDonVitheoMonHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getdsDonVitheoMonHoc]
@id_monHoc varchar(10)
as
begin
select DV.id_DV, DV.tenDV,DVTT.id_capTren, DV.moTa from DonVi as DV inner join DVTrucThuoc as DVTT on DV.id_DV = DVTT.id_capDuoi where  id_DV in (select id_capDuoi from DVTrucThuoc where id_capTren in (select id_DV from KHHLTrungDoan where id_monHoc = @id_monHoc))
end
GO
/****** Object:  StoredProcedure [dbo].[getdsHocVien]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getdsHocVien]
as
begin
select HV.id_HV, HV.tenHV, format(HV.ngaySinh,'dd/MM/yyyy') as ngaySinh, HV.gioiTinh, HV.queQuan, HV.tenLop, DV.tenDV, KH.tenKhoaHoc, HV.sdt from HocVien as HV inner join DonVi as DV on HV.id_DV = DV.id_DV inner join KhoaHoc as KH on HV.id_khoaHoc = KH.id_khoaHoc
end;
GO
/****** Object:  StoredProcedure [dbo].[getdsHVtheoDaiDoi]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getdsHVtheoDaiDoi]
    @idDV VARCHAR(10)
AS
BEGIN
    -- Lấy danh sách id_DV cấp 1 là đơn vị cấp dưới trực thuộc của @idDV
    WITH DonViCap1 AS (
        SELECT DISTINCT d1.id_DV, d1.tenDV
        FROM DonVi d1
        JOIN DVTrucThuoc dv1 ON d1.id_DV = dv1.id_capDuoi
        WHERE dv1.id_capTren in (
            SELECT id_DV
            FROM DonVi
            JOIN DVTrucThuoc dv2 ON DonVi.id_DV = dv2.id_capDuoi
            WHERE dv2.id_capTren = @idDV
        )
    )

    -- Lấy danh sách HocVien từ những đơn vị cấp dưới đã lấy được ở trên
    SELECT hv.id_HV, hv.tenHV, dv1.tenDV
    FROM HocVien hv
    INNER JOIN DonViCap1 dv1 ON hv.id_DV = dv1.id_DV
    WHERE hv.id_HV NOT IN (SELECT bc.id_HV FROM BienCheTTB bc WHERE bc.trangThai = 0)

    UNION

    SELECT hv.id_HV, hv.tenHV, dv1.tenDV
    FROM HocVien hv
    INNER JOIN DonViCap1 dv1 ON hv.id_DV = dv1.id_DV
    INNER JOIN BienCheTTB bc ON hv.id_HV = bc.id_HV
    WHERE bc.trangThai = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[getdsHVtheoDonVi]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getdsHVtheoDonVi]
@idDV varchar(10)
as
begin
select HV.id_HV, HV.tenHV, format(HV.ngaySinh,'dd/MM/yyyy') as ngaySinh, HV.gioiTinh, HV.queQuan, HV.tenLop, KH.tenKhoaHoc, HV.sdt from HocVien as HV inner join KhoaHoc as KH on HV.id_khoaHoc = KH.id_khoaHoc where HV.id_DV = @idDV;
end
GO
/****** Object:  StoredProcedure [dbo].[getdsHVtheoKhoaHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getdsHVtheoKhoaHoc]
@idKhoaHoc varchar(10)
as
begin
select HV.id_HV, HV.tenHV, format(HV.ngaySinh,'dd/MM/yyyy') as ngaySinh, HV.gioiTinh, HV.queQuan, HV.tenLop, DV.tenDV, HV.sdt from HocVien as HV inner join DonVi as DV on HV.id_DV = DV.id_DV where HV.id_khoaHoc = @idKhoaHoc;
end
GO
/****** Object:  StoredProcedure [dbo].[getdsKhoaHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getdsKhoaHoc]
as
begin
select id_khoaHoc, tenKhoaHoc, format(thoigianBD,'dd/MM/yyyy') as ngayBĐ, format(thoigianKT,'dd/MM/yyyy') as ngayKT  from KhoaHoc
end
GO
/****** Object:  StoredProcedure [dbo].[getdsMonHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[getdsMonHoc]
as
begin
select id_monHoc, tenMonHoc, doiTuong, moTa from MonHoc;
end
GO
/****** Object:  StoredProcedure [dbo].[getdsNoiDungBaiHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getdsNoiDungBaiHoc]
@idBaiHoc varchar(10)
as
begin
select id_NDBH, tenNDBH, thoiGian, soTiet from NoiDungBaiHoc where id_baiHoc = @idBaiHoc;
end
GO
/****** Object:  StoredProcedure [dbo].[getDV_CapDV]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getDV_CapDV] 
as
begin
select tenDV from DonVi;
select tenCapDV from CapDonVi;
end
GO
/****** Object:  StoredProcedure [dbo].[getKetQuaHuanLuyen]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getKetQuaHuanLuyen]
@id_monHoc varchar(10), @idDV varchar(10)
as
begin
select HV.id_HV, HV.tenHV, MH.id_monHoc, MH.tenMonHoc, KQ.namHoc, KQ.diemCC, KQ.diemTX, KQ.diemThi, ROUND(KQ.diemCC*0.1+KQ.diemTX*0.3+KQ.diemThi*0.6,2) as diemTB from KetQuaHuanLuyen as KQ inner join HocVien as HV on KQ.id_HV = HV.id_HV inner join MonHoc as MH on KQ.id_monHoc = MH.id_monHoc where HV.id_DV = @idDV and KQ.id_monHoc = @id_monHoc;
end
GO
/****** Object:  StoredProcedure [dbo].[getTTB]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTTB]
@id_chungLoai varchar(10), @idDV varchar(10)
as
begin
select * from TTB where id_DV = @idDV and id_chungLoai = @id_chungLoai;
end
GO
/****** Object:  StoredProcedure [dbo].[getTTBchuaBienChe]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTTBchuaBienChe] 
@idDV varchar(10)
as
begin
select * from TTB where id_DV = @idDV and trangThai = '0'
end
GO
/****** Object:  StoredProcedure [dbo].[InsertKetQuaHuanLuyen]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertKetQuaHuanLuyen]
    @idDV varchar(10),
    @id_monHoc varchar(10),
	@namHoc varchar(100)
AS
BEGIN
    -- Thêm dữ liệu từ bảng HocVien vào bảng KetQuaHuanLuyen
    INSERT INTO KetQuaHuanLuyen (id_monHoc, id_HV, diemCC, diemTX, diemThi, hocKy, namHoc)
    SELECT @id_monHoc, id_HV, '', '', '', '', @namHoc
    FROM HocVien
    WHERE id_DV = @idDV;
END;
GO
/****** Object:  StoredProcedure [dbo].[TongDV]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[TongDV]
@TongDV INT OUTPUT
as
begin
select @tongDV = count(*) from DonVi
end;
GO
/****** Object:  StoredProcedure [dbo].[updateBaiHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateBaiHoc]
@idBaiHoc varchar(10), @tenBaiHoc nvarchar(100)
as
begin
update BaiHoc set tenBaiHoc = @tenBaiHoc where id_baiHoc = @idBaiHoc
end
GO
/****** Object:  StoredProcedure [dbo].[updateBienCheTTB]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateBienCheTTB]
@id_HV varchar(10), @id_TTB varchar(10), @id_monHoc varchar(10), @thoiGianNhanTTB date, @trangThai bit
as
begin
if @trangThai != 1
begin
update BienCheTTB set  thoiGianNhanTTB = @thoiGianNhanTTB, trangThai = @trangThai where id_TTB = @id_TTB and id_HV = @id_HV and id_monHoc = @id_monHoc;
update TTB set trangThai = '0' where id_TTB = @id_TTB;
end
else
begin
update BienCheTTB set thoiGianNhanTTB = @thoiGianNhanTTB, trangThai = @trangThai where id_TTB = @id_TTB and id_HV = @id_HV and id_monHoc = @id_monHoc;
update TTB set trangThai = '1' where id_TTB = @id_TTB;
end
end
GO
/****** Object:  StoredProcedure [dbo].[updateCB]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateCB]
@tenCB nvarchar(100), @id_CB varchar(10), @ngaySinh date, @gioiTinh nvarchar(50), @queQuan nvarchar(100), @capBac nvarchar(100), @sdt varchar(10), @tenLoaiCB nvarchar(100), @id_DV varchar(10), @trangThai bit
as
begin 
declare @id_LoaiCB varchar(10)
select @id_LoaiCB = id_LoaiCB from LoaiCanBo where tenLoaiCB = @tenLoaiCB;
update Canbo set tenCB = @tenCB, ngaySinh = @ngaySinh, gioiTinh = @gioiTinh, queQuan = @queQuan, capBac = @capBac, sdt = @sdt, id_LoaiCB = @id_LoaiCB, id_DV = @id_DV, trangThai = @trangThai where id_CB = @id_CB;

end
GO
/****** Object:  StoredProcedure [dbo].[updateChungLoai]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateChungLoai] 
@id_chungLoai varchar(10), @tenChungLoai nvarchar(100), @giaCa int, @moTa nvarchar(max)
as
begin
update ChungLoai set tenChungLoai = @tenChungLoai, giaCa = @giaCa where id_chungLoai = @id_chungLoai;
end
GO
/****** Object:  StoredProcedure [dbo].[updateDV]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateDV]
@id_DV varchar(10), @tenDV nvarchar(100), @id_capDV int, @idDVCapTren varchar(10), @moTa nvarchar(100)
as
begin
update DonVi set tenDV = @tenDV, moTa = @moTa where id_DV = @id_DV;
if (@idDVCapTren != '')
begin
if EXISTS (select * from DVTrucThuoc where id_capTren = @idDVCapTren and id_capDuoi = @id_DV)
begin
update DVTrucThuoc set id_capTren = @idDVCapTren where id_capDuoi = @id_DV;
end
else
begin
insert into DVTrucThuoc(id_capTren,id_capDuoi) values (@idDVCapTren,@id_DV);
end
end
end
GO
/****** Object:  StoredProcedure [dbo].[updateDVCoBan]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateDVCoBan]
@id_DV varchar(10), @tenDV nvarchar(100), @moTa nvarchar(100)
as
begin
update DonVi set tenDV = @tenDV, moTa = @moTa where id_DV = @id_DV;
end
GO
/****** Object:  StoredProcedure [dbo].[updateHV]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[updateHV]
@tenHV nvarchar(100), @id_HV varchar(10), @ngaySinhHV date, @gioiTinh nvarchar(50), @queQuan nvarchar(100), @tenLop nvarchar(100), @tenDV nvarchar(100), @sdt varchar(10), @idKhoaHoc varchar(10)
as
begin
declare @id_DV varchar(10)
select @id_DV = id_DV from DonVi where tenDV = @tenDV;

update HocVien set tenHV = @tenHV, ngaySinh = @ngaySinhHV, gioiTinh = @gioiTinh, queQuan =@queQuan, id_DV =@id_DV, tenLop = @tenLop, id_khoaHoc = @idKhoaHoc, sdt = @sdt where id_HV = @id_HV;
end
GO
/****** Object:  StoredProcedure [dbo].[updateKetQuaHuanLuyen]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateKetQuaHuanLuyen]
@id_monHoc varchar(10),@id_HV varchar(10), @diemCC float, @diemTX float, @diemThi float
as
begin
update KetQuaHuanLuyen set diemCC = @diemCC, diemTX = @diemTX, diemThi = @diemThi where id_HV = @id_HV and id_monHoc = id_monHoc;
end
GO
/****** Object:  StoredProcedure [dbo].[updateKhoaHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[updateKhoaHoc] 
@id_khoaHoc varchar(10), @tenKhoaHoc nvarchar(100), @thoigianBD date, @thoigianKT date
as
begin
update KhoaHoc set tenKhoaHoc = @tenKhoaHoc, thoigianBD = @thoigianBD, thoigianKT =  @thoigianKT  where id_khoaHoc = @id_khoaHoc
end
GO
/****** Object:  StoredProcedure [dbo].[updateMonHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateMonHoc]
@idMonHoc varchar(10), @tenMonHoc nvarchar(100),@doiTuong nvarchar(100), @moTa nvarchar(max)
as
begin
update MonHoc set tenMonHoc = @tenMonHoc, doiTuong = @doiTuong, moTa = @moTa where id_monHoc = @idMonHoc
end
GO
/****** Object:  StoredProcedure [dbo].[updateNoiDungBaiHoc]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateNoiDungBaiHoc]
@id_NDBH varchar(10), @tenNDBH nvarchar(100), @thoiGian int, @soTiet int
as
begin
update NoiDungBaiHoc set tenNDBH = @tenNDBH, thoiGian = @thoiGian, soTiet = @soTiet where id_NDBH = @id_NDBH
end
GO
/****** Object:  StoredProcedure [dbo].[updateTTB]    Script Date: 13/12/2023 4:40:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateTTB]
@id_TTB varchar(10), @tinhTrang nvarchar(100)
as
begin
update TTB set tinhTrang = @tinhTrang where id_TTB = @id_TTB
end
GO
USE [master]
GO
ALTER DATABASE [QLHuanLuyen] SET  READ_WRITE 
GO
