CREATE DATABASE QLHuanLuyen
GO
USE [QLHuanLuyen]
GO
/****** Object:  User [minchou]    Script Date: 17/12/2023 8:32:40 CH ******/
/****** Object:  Table [dbo].[BaiHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiHoc](
	[id_baiHoc] [varchar](10) NOT NULL,
	[tenBaiHoc] [nvarchar](200) NULL,
	[id_monHoc] [varchar](10) NULL,
	[soGio] [int] NULL,
	[soTiet] [int] NULL,
 CONSTRAINT [PK__BaiHoc__4EE1C3FF673D62A1] PRIMARY KEY CLUSTERED 
(
	[id_baiHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BienCheTTB]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  Table [dbo].[Canbo]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  Table [dbo].[CapDonVi]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  Table [dbo].[ChungLoai]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  Table [dbo].[DiemDanhHuanLuyen]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiemDanhHuanLuyen](
	[id_diemDanh] [int] IDENTITY(1,1) NOT NULL,
	[id_HV] [varchar](10) NULL,
	[id_KHHL] [int] NOT NULL,
	[isVangMat] [bit] NULL,
	[ghiChu] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_diemDanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonVi]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  Table [dbo].[DVTrucThuoc]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  Table [dbo].[HocVien]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  Table [dbo].[KetQuaHuanLuyen]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  Table [dbo].[KHHLDaiDoi]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHHLDaiDoi](
	[id_DV] [varchar](10) NOT NULL,
	[ngayHoc] [date] NULL,
	[diaDiem] [nvarchar](100) NULL,
	[id_CB] [varchar](10) NULL,
	[id_baiHoc] [varchar](10) NOT NULL,
	[id_KHHL] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_KHHLDaiDoi] PRIMARY KEY CLUSTERED 
(
	[id_KHHL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHHLTieuDoan]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHHLTieuDoan](
	[id_DV] [varchar](10) NOT NULL,
	[tgBatDau] [date] NULL,
	[id_CB] [varchar](10) NULL,
	[id_monHoc] [varchar](10) NOT NULL,
 CONSTRAINT [PK_KHHLTieuDoan] PRIMARY KEY CLUSTERED 
(
	[id_DV] ASC,
	[id_monHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHHLTrungDoan]    Script Date: 17/12/2023 8:32:40 CH ******/
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
	[ghiChu] [nvarchar](max) NULL,
	[ngayLapHK] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_monHoc] ASC,
	[id_DV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhoaHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  Table [dbo].[LoaiCanBo]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  Table [dbo].[MonHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  Table [dbo].[QuyenTK]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  Table [dbo].[TTB]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 17/12/2023 8:32:40 CH ******/
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
INSERT [dbo].[BaiHoc] ([id_baiHoc], [tenBaiHoc], [id_monHoc], [soGio], [soTiet]) VALUES (N'BH001', N'Giới thiệu về Hàm số', N'MH01', NULL, NULL)
INSERT [dbo].[BaiHoc] ([id_baiHoc], [tenBaiHoc], [id_monHoc], [soGio], [soTiet]) VALUES (N'BH002', N'Đạo hàm và Ứng dụng', N'MH01', NULL, NULL)
INSERT [dbo].[BaiHoc] ([id_baiHoc], [tenBaiHoc], [id_monHoc], [soGio], [soTiet]) VALUES (N'BH003', N'Tích phân và Ứng dụng', N'MH01', NULL, NULL)
INSERT [dbo].[BaiHoc] ([id_baiHoc], [tenBaiHoc], [id_monHoc], [soGio], [soTiet]) VALUES (N'BH004', N'Phân tích Hàm số', N'MH01', NULL, NULL)
INSERT [dbo].[BaiHoc] ([id_baiHoc], [tenBaiHoc], [id_monHoc], [soGio], [soTiet]) VALUES (N'BH005', N'Hàm nhiều biến', N'MH02', NULL, NULL)
INSERT [dbo].[BaiHoc] ([id_baiHoc], [tenBaiHoc], [id_monHoc], [soGio], [soTiet]) VALUES (N'BH006', N'Tích phân đa chiều', N'MH02', NULL, NULL)
INSERT [dbo].[BaiHoc] ([id_baiHoc], [tenBaiHoc], [id_monHoc], [soGio], [soTiet]) VALUES (N'BH007', N'Phương trình đạo hàm riêng và Ứng dụng', N'MH02', NULL, NULL)
INSERT [dbo].[BaiHoc] ([id_baiHoc], [tenBaiHoc], [id_monHoc], [soGio], [soTiet]) VALUES (N'BH008', N'Số nguyên hàm và các dạng hình học', N'MH02', NULL, NULL)
INSERT [dbo].[BaiHoc] ([id_baiHoc], [tenBaiHoc], [id_monHoc], [soGio], [soTiet]) VALUES (N'BH009', N'Tiểu đoàn bộ binh chiến đấu tiến công địch phòng ngự ở địa hình trung du', N'MH03', NULL, NULL)
INSERT [dbo].[BaiHoc] ([id_baiHoc], [tenBaiHoc], [id_monHoc], [soGio], [soTiet]) VALUES (N'BH010', N'Tiểu đoàn bộ binh chiến đấu phòng ngự ở địa hình trung du', N'MH03', NULL, NULL)
INSERT [dbo].[BaiHoc] ([id_baiHoc], [tenBaiHoc], [id_monHoc], [soGio], [soTiet]) VALUES (N'BH011', N'Tiểu đoàn bộ binh hành trú quân chiến đấu', N'MH03', NULL, NULL)
INSERT [dbo].[BaiHoc] ([id_baiHoc], [tenBaiHoc], [id_monHoc], [soGio], [soTiet]) VALUES (N'BH012', N'Tiểu đoàn bộ binh vượt sông chiến đấu', N'MH03', NULL, NULL)
INSERT [dbo].[BaiHoc] ([id_baiHoc], [tenBaiHoc], [id_monHoc], [soGio], [soTiet]) VALUES (N'BH013', N'Lịch sử và phát triển của Tin học', N'MH07', NULL, NULL)
INSERT [dbo].[BaiHoc] ([id_baiHoc], [tenBaiHoc], [id_monHoc], [soGio], [soTiet]) VALUES (N'BH014', N'Kiến thức về hệ thống máy tính', N'MH07', NULL, NULL)
GO
INSERT [dbo].[BienCheTTB] ([id_HV], [id_TTB], [id_monHoc], [thoiGianNhanTTB], [trangThai]) VALUES (N'HV003', N'AK-009', N'MH03', CAST(N'2020-12-08' AS Date), 0)
INSERT [dbo].[BienCheTTB] ([id_HV], [id_TTB], [id_monHoc], [thoiGianNhanTTB], [trangThai]) VALUES (N'HV004', N'AK-010', N'MH03', CAST(N'2020-12-08' AS Date), 0)
INSERT [dbo].[BienCheTTB] ([id_HV], [id_TTB], [id_monHoc], [thoiGianNhanTTB], [trangThai]) VALUES (N'HV009', N'AK-013', N'MH03', CAST(N'2024-08-29' AS Date), 1)
INSERT [dbo].[BienCheTTB] ([id_HV], [id_TTB], [id_monHoc], [thoiGianNhanTTB], [trangThai]) VALUES (N'HV011', N'AK-014', N'MH03', CAST(N'2023-09-13' AS Date), 1)
INSERT [dbo].[BienCheTTB] ([id_HV], [id_TTB], [id_monHoc], [thoiGianNhanTTB], [trangThai]) VALUES (N'HV015', N'AK-002', N'MH03', CAST(N'2021-12-08' AS Date), 0)
INSERT [dbo].[BienCheTTB] ([id_HV], [id_TTB], [id_monHoc], [thoiGianNhanTTB], [trangThai]) VALUES (N'HV016', N'AK-003', N'MH03', CAST(N'2021-12-08' AS Date), 0)
INSERT [dbo].[BienCheTTB] ([id_HV], [id_TTB], [id_monHoc], [thoiGianNhanTTB], [trangThai]) VALUES (N'HV017', N'AK-004', N'MH03', CAST(N'2021-12-08' AS Date), 0)
INSERT [dbo].[BienCheTTB] ([id_HV], [id_TTB], [id_monHoc], [thoiGianNhanTTB], [trangThai]) VALUES (N'HV018', N'AK-005', N'MH03', CAST(N'2021-12-08' AS Date), 0)
GO
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB000', N'Quản trị viên', NULL, NULL, NULL, N'e365', NULL, NULL, NULL, NULL, N'U06')
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB0000', N'Quản trị viên', NULL, NULL, NULL, N'e111', NULL, NULL, NULL, NULL, N'U11')
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB001', N'Nguyễn Trần Anh Tuấn', CAST(N'1975-05-05' AS Date), N'Nam', N'Quảng Ninh', N'd1', N'0123456789', N'Trung tá', 1, N'LCB1', N'U15')
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB002', N'Lê Hồng Anh', CAST(N'1977-05-02' AS Date), N'Nam', N'Thái Bình', N'd1', N'0123456789', N'Trung tá', 1, N'LCB3', N'U12')
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB003', N'Vũ Gia Huy', CAST(N'1987-04-01' AS Date), N'Nam', N'Nghệ An', N'c154', N'0123456789', N'Đại úy', 1, N'LCB1', N'U05')
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB005', N'Trần Quốc Thắng', CAST(N'1987-03-01' AS Date), N'Nam', N'Hải Dương', N'c155', N'0123456789', N'Trung tá', 1, N'LCB2', N'U14')
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB006', N'Trần Thị Thu', CAST(N'1985-09-09' AS Date), N'Nữ', N'Phú Thọ', N'd3', N'0123456789', N'Thiếu tá', 1, N'LCB1', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB007', N'Nguyễn Hữu Trường Phát', CAST(N'1988-10-10' AS Date), N'Nam', N'Bắc Ninh', N'c155', N'0123456789', N'Thượng úy', 1, N'LCB1', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB008', N'Phùng Quang Long', CAST(N'1989-01-06' AS Date), N'Nam', N'Bắc Giang', N'c156', N'0123456789', N'Thượng úy', 1, N'LCB1', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB010', N'Trần Văn Trà', CAST(N'1987-07-12' AS Date), N'Nam', N'Thanh Hóa', N'd3', N'0123456789', N'Trung tá', 1, N'LCB1', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB011', N'Võ Hoàng An ', CAST(N'1982-12-02' AS Date), N'Nam', N'Phú Thọ', N'c156', N'0123456789', N'Trung tá', 1, N'LCB1', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB012', N'Bùi Anh Duy ', CAST(N'1988-05-06' AS Date), N'Nam', N'Thái Bình', N'c156', N'0123456789', N'Trung tá', 1, N'LCB1', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB013', N'Lê Minh Đăng ', CAST(N'1984-12-03' AS Date), N'Nam', N'Thanh Hóa', N'c354', N'0123456789', N'Đại úy', 1, N'LCB1', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB016', N'Tạ Cao Tuấn ', CAST(N'1984-01-12' AS Date), N'Nam', N'Phú Thọ', N'c355', N'0123456789', N'Thiếu tá', 1, N'LCB1', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB018', N'Bùi Viết Anh', CAST(N'1982-11-05' AS Date), N'Nam', N'Thái Bình', N'c354', N'0123456789', N'Thiếu tá', 1, N'LCB1', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB019', N'Nguyễn Trọng Bảo', CAST(N'1971-06-11' AS Date), N'Nam', N'Phú Thọ', N'e365', N'0123456789', N'Đại tá', 1, N'LCB3', N'U04')
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB020', N'Ngô Thành Đạt ', CAST(N'1972-12-02' AS Date), N'Nam', N'Nghệ An', N'e365', N'0123456789', N'Đại tá', 1, N'LCB1', N'U03')
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB021', N'Nguyễn Ngọc Kim Ngân', CAST(N'1980-01-10' AS Date), N'Nữ', N'Hà Nội', N'e365', N'0123456789', N'Trung tá', 1, N'LCB1', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB022', N'Nguyễn Văn An', CAST(N'1988-11-04' AS Date), N'Nam', N'Tuyên Quang', N'd1', N'0123456789', N'Đại úy', 1, N'LCB2', N'U10')
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB023', N'Vũ Việt Hưng', CAST(N'1999-09-20' AS Date), N'Nam', N'Vĩnh Phúc', N'c156', N'0123456789', N'Trung úy', 1, N'LCB1', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB024', N'Lê Hải Sơn', CAST(N'1998-07-17' AS Date), N'Nam', N'Quảng Bình', N'c354', N'0123456789', N'Thượng úy', 1, N'LCB4', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB025', N'Huỳnh Minh Kiên', CAST(N'1988-06-10' AS Date), N'Nam', N'Hà Nội', N'e112', N'0123456789', N'Thiếu tá', 1, N'LCB4', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB027', N'Nguyễn Hữu Trường', CAST(N'1988-10-10' AS Date), N'Nam', N'Bắc Ninh', N'e111', N'0123456789', N'Thượng tá', 1, N'LCB1', N'U01')
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB028', N'Nguyễn Tuấn Anh', CAST(N'1988-10-10' AS Date), N'Nam', N'Bắc Ninh', N'e111', N'0123456789', N'Thượng úy', 1, N'LCB2', N'U02')
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB029', N'Nguyễn Hữu Trường Phát', CAST(N'1988-10-10' AS Date), N'Nam', N'Bắc Ninh', N'e111', N'0123456789', N'Thượng úy', 1, N'LCB4', N'U05')
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB030', N'Trần Đăng Khôi', CAST(N'1988-10-10' AS Date), N'Nam', N'Bắc Ninh', N'e111', N'0123456789', N'Thượng úy', 1, N'LCB4', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB031', N'Vũ Nam Khánh', CAST(N'1988-10-10' AS Date), N'Nam', N'Bắc Ninh', N'e111', N'0123456789', N'Thượng úy', 1, N'LCB2', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB032', N'Trương Minh Huy', CAST(N'1988-10-10' AS Date), N'Nam', N'Bắc Ninh', N'e111', N'0123456789', N'Thượng úy', 1, N'LCB4', N'U08')
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB033', N'Lê Gia Hưng', CAST(N'1988-10-10' AS Date), N'Nam', N'Bắc Ninh', N'e111', N'0123456789', N'Thượng úy', 1, N'LCB3', N'U13')
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB034', N'Nguyễn Minh Trí', CAST(N'1988-10-10' AS Date), N'Nam', N'Bắc Ninh', N'e111', N'0123456789', N'Thượng úy', 1, N'LCB4', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB035', N'Nguyễn Tuấn Anh', CAST(N'1988-10-10' AS Date), N'Nam', N'Bắc Ninh', N'e111', N'0123456789', N'Thượng úy', 1, N'LCB4', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB037', N'Tạ Huỳnh Anh', CAST(N'1990-07-26' AS Date), N'Nam', N'Nghệ An', N'e365', N'0123456789', N'Thiếu tá', 1, N'LCB2', N'U07')
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB038', N'Vũ Gia Huy', CAST(N'1983-12-22' AS Date), N'Nam', N'Quảng Bình', N'e365', N'0123456789', N'Trung tá', 1, N'LCB4', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB039', N'Lê Huy Giang', CAST(N'1985-12-14' AS Date), N'Nam', N'Hà Nội', N'e365', N'0123456789', N'Trung tá', 1, N'LCB4', NULL)
INSERT [dbo].[Canbo] ([id_CB], [tenCB], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [sdt], [capBac], [trangThai], [id_LoaiCB], [id_user]) VALUES (N'CB040', N'Lê Văn Điều', CAST(N'1985-12-14' AS Date), N'Nam', N'Hà Nội', N'd1', N'0123456789', N'Trung tá', 1, N'LCB2', N'U09')
GO
INSERT [dbo].[CapDonVi] ([id_capDV], [tenCapDV], [moTa]) VALUES (1, N'Đại đội', N'Đại đội là đơn vị cấp cơ sở')
INSERT [dbo].[CapDonVi] ([id_capDV], [tenCapDV], [moTa]) VALUES (2, N'Tiểu đoàn', N'Đơn vị nhỏ của tổ chức đơn vị quân đội, phân ra nhiều đại đội.')
INSERT [dbo].[CapDonVi] ([id_capDV], [tenCapDV], [moTa]) VALUES (3, N'Trung đoàn', N'Đơn vị trong quân đội có quy mô nhỏ hơn sư đoàn nhưng lớn hơn tiểu đoàn, thường gồm hai đến năm tiểu đoàn.')
INSERT [dbo].[CapDonVi] ([id_capDV], [tenCapDV], [moTa]) VALUES (4, N'Sư đoàn', N'Đơn vị quân đội, có quy mô tương đối lớn trong quân đội')
GO
INSERT [dbo].[ChungLoai] ([id_chungLoai], [tenChungLoai], [giaCa], [moTa]) VALUES (N'AK', N'Súng AK', 1900000, N'Là một trong những súng trường tấn công (theo phân loại của NATO) hoặc súng tiểu liên (theo phân loại của khối xã hội chủ nghĩa) thông dụng nhất của thế kỷ XX')
INSERT [dbo].[ChungLoai] ([id_chungLoai], [tenChungLoai], [giaCa], [moTa]) VALUES (N'B41', N'Súng chống tăng B41', 1900000, N'Là một loại súng chống tăng không giật dùng cá nhân, còn được gọi tại Việt Nam là B41.')
INSERT [dbo].[ChungLoai] ([id_chungLoai], [tenChungLoai], [giaCa], [moTa]) VALUES (N'DKZ', N'Súng pháo không giật', 2500000, N'Loại súng không giật này được thiết kế nhằm thay thể cho khẩu SPG-82 sử dụng từ Thế Chiến thứ hai.')
INSERT [dbo].[ChungLoai] ([id_chungLoai], [tenChungLoai], [giaCa], [moTa]) VALUES (N'K54', N'Súng ngắn K-54mm', 1900000, N'Là một loại súng ngắn bán tự động do Liên bang Xô-viết thiết kế và chế tạo.')
INSERT [dbo].[ChungLoai] ([id_chungLoai], [tenChungLoai], [giaCa], [moTa]) VALUES (N'M79', N'Súng phóng lựu M79', 1900000, N'Là một loại súng phóng lựu do Hoa Kỳ sản xuất. ')
GO
SET IDENTITY_INSERT [dbo].[DiemDanhHuanLuyen] ON 

INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (1, N'HV001', 1, 1, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (2, N'HV002', 1, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (3, N'HV003', 1, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (4, N'HV004', 1, 1, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (5, N'HV005', 1, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (6, N'HV006', 1, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (7, N'HV007', 1, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (8, N'HV008', 1, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (9, N'HV001', 2, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (10, N'HV002', 2, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (11, N'HV003', 2, 1, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (12, N'HV004', 2, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (13, N'HV005', 2, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (14, N'HV006', 2, 1, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (15, N'HV007', 2, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (16, N'HV008', 2, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (17, N'HV001', 3, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (18, N'HV002', 3, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (19, N'HV003', 3, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (20, N'HV004', 3, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (21, N'HV005', 3, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (22, N'HV006', 3, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (23, N'HV007', 3, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (24, N'HV008', 3, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (25, N'HV001', 4, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (26, N'HV002', 4, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (27, N'HV003', 4, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (28, N'HV004', 4, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (29, N'HV005', 4, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (30, N'HV006', 4, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (31, N'HV007', 4, 0, N'')
INSERT [dbo].[DiemDanhHuanLuyen] ([id_diemDanh], [id_HV], [id_KHHL], [isVangMat], [ghiChu]) VALUES (32, N'HV008', 4, 0, N'')
SET IDENTITY_INSERT [dbo].[DiemDanhHuanLuyen] OFF
GO
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'c152', N'Đại đội 152', 1, N'Là đại đội CNTT')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'c154', N'Đại đội 154', 1, N'Là đại đội khoa CNTT')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'c155', N'Đại đội 155', 1, N'Là đại đội khoa CNTT')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'c156', N'Đại đội 156', 1, N'Là đại đội khoa CNTT')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'c158', N'Đại đội 158', 1, N'Là đại đội khoa CNTT')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'c354', N'Đại đội 354', 1, N'Là đại đội khoa Vô tuyến điện tử')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'c355', N'Đại đội 355', 1, N'Là đại đội khoa Vô tuyến điện tử')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'c356', N'Đại đội 356', 1, N'Là đại đội khoa Vô tuyến điện tử')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'c36', N'Đại đội 36', 1, N'Là đại đội đào tạo nguồn')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'c4', N'Đại đội 4', 1, N'Là đại đội Vũ khí')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'c5', N'Đại đội 5', 1, N'Là đại đội Mìn hóa học')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'd1', N'Tiểu đoàn 1', 2, N'Là tiểu đoàn Công nghệ thông tin')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'd10', N'Tiểu đoàn 10', 2, N'Là tiểu đoàn Hóa học 1')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'd13', N'Tiểu đoàn 13', 2, N'Là tiểu đoàn Vũ khí')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'd23', N'Tiểu đoàn 23', 2, N'Là tiểu đoàn Tên lửa phòng không')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'd3', N'Tiểu đoàn 3', 2, N'Là tiểu đoàn khoa Vô tuyến điện tử')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'd5', N'Tiểu đoàn 5', 2, N'Là tiểu đoàn chuyên Toán học')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'e111', N'Trung đoàn 111', 3, N'Là Trung đoàn khoa CNTT')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'e112', N'Trung đoàn 112', 3, N'Là Trung đoàn Vũ khí')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'e113', N'Trung đoàn 113', 3, N'Là Trung đoàn Hóa học')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'e258', N'Trung đoàn 258', 3, N'Là Trung đoàn Phòng không')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'e365', N'Trung đoàn 365', 3, N'Là Trung đoàn Thông tin')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'e369', N'Trung đoàn 369', 3, N'Là trung đoàn tác chiến điện tử')
INSERT [dbo].[DonVi] ([id_DV], [tenDV], [id_capDV], [moTa]) VALUES (N'e375', N'Trung đoàn 375', 3, N'Là Trung đoàn Hải quân')
GO
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'd1', N'c152')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'd1', N'c154')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'd1', N'c155')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'd1', N'c156')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'd1', N'c158')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'd10', N'c36')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'd10', N'c4')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'd13', N'c5')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'd3', N'c354')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'd3', N'c355')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'd3', N'c356')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'e111', N'd1')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'e111', N'd5')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'e112', N'd13')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'e113', N'd10')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'e365', N'd23')
INSERT [dbo].[DVTrucThuoc] ([id_capTren], [id_capDuoi]) VALUES (N'e365', N'd3')
GO
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV001', N'Phạm Ngọc Kim Anh', CAST(N'2000-05-05' AS Date), N'Nữ', N'Ninh Bình', N'c154', N'Công nghệ thông tin', N'K54', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV002', N'Hồ Nguyễn Mai Anh', CAST(N'2000-07-06' AS Date), N'Nữ', N'Thái Bình', N'c154', N'Công nghệ thông tin', N'K54', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV003', N'Lê Hoàng Bảo An', CAST(N'2000-01-07' AS Date), N'Nam', N'Nghệ An', N'c154', N'Công nghệ thông tin', N'K54', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV004', N'Dương Ngọc An', CAST(N'2000-09-05' AS Date), N'Nữ', N'Nghệ An', N'c154', N'An ninh hệ thống thông tin', N'K54', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV005', N'Đoàn Lê Nhật Anh', CAST(N'2000-07-28' AS Date), N'Nam', N'Nam Định', N'c154', N'An ninh hệ thống thông tin', N'K54', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV006', N'Nguyễn Tuấn Anh', CAST(N'2000-05-05' AS Date), N'Nam', N'Ninh Bình', N'c154', N'An ninh hệ thống thông tin', N'K54', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV007', N'Nguyễn Lê Quang Vinh', CAST(N'2000-05-11' AS Date), N'Nam', N'Thái Bình', N'c154', N'Bảo đảm an toàn thông tin', N'K54', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV008', N'Nguyễn Minh Trí ', CAST(N'2000-04-11' AS Date), N'Nam', N'Nghệ An', N'c154', N'Bảo đảm an toàn thông tin', N'K54', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV009', N'Nguyễn Thị Thuỷ Tiên', CAST(N'2001-02-05' AS Date), N'Nữ', N'Hà Nội', N'c355', N'Thông tin', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV010', N'Thái Thị Thanh Thảo', CAST(N'2001-03-31' AS Date), N'Nữ', N'Nam Định', N'c355', N'Thông tin', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV011', N'Nguyễn Nhật Tân', CAST(N'2001-03-30' AS Date), N'Nam', N'Ninh Bình', N'c355', N'Thông tin', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV012', N'Dương Xuân Quế', CAST(N'2001-04-28' AS Date), N'Nam', N'Thái Bình', N'c355', N'Ra-đa', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV013', N'Hà Thanh Phúc', CAST(N'2000-05-27' AS Date), N'Nam', N'Nghệ An', N'c355', N'Ra-đa', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV014', N'Nguyễn Thanh Ngọc', CAST(N'2001-06-26' AS Date), N'Nữ', N'Hà Nội', N'c155', N'Công nghệ thông tin', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV015', N'Phạm Hồng Minh', CAST(N'2001-07-25' AS Date), N'Nam', N'Ninh Bình', N'c155', N'Công nghệ thông tin', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV016', N'Hồ Sông Lam ', CAST(N'1999-08-24' AS Date), N'Nam', N'Thái Bình', N'c155', N'Công nghệ thông tin', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV017', N'Phạm Minh Khôi', CAST(N'2001-09-26' AS Date), N'Nam', N'Hà Nội', N'c155', N'Công nghệ thông tin', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV018', N'Phan Tử Gia Khiêm', CAST(N'2000-12-22' AS Date), N'Nam', N'Bắc Giang', N'c155', N'Công nghệ thông tin', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV019', N'Phạm Ngọc Hưng', CAST(N'2001-11-16' AS Date), N'Nam', N'Bắc Giang', N'c155', N'Công nghệ thông tin', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV020', N'Trương Minh Huy ', CAST(N'2001-10-30' AS Date), N'Nam', N'Bắc Giang', N'c155', N'An ninh hệ thống thông tin', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV021', N'Nguyễn Thị Yến Nhi', CAST(N'2001-09-08' AS Date), N'Nữ', N'Nam Định', N'c155', N'An ninh hệ thống thông tin', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV022', N'Lê Gia Hưng', CAST(N'2001-08-21' AS Date), N'Nam', N'Nghệ An', N'c155', N'An ninh hệ thống thông tin', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV023', N'Vũ Nam Khánh', CAST(N'2001-07-05' AS Date), N'Nam', N'Hà Nội', N'c155', N'Bảo đảm an toàn thông tin', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV024', N'Trần Thùy Linh', CAST(N'2001-06-05' AS Date), N'Nữ', N'Bắc Giang', N'c155', N'Bảo đảm an toàn thông tin', N'K55', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV025', N'Lê Sỹ Nghiêm', CAST(N'2001-05-05' AS Date), N'Nam', N'Bắc Giang', N'c156', N'Công nghệ thông tin', N'K56', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV026', N'Lưu Thành Lợi ', CAST(N'2001-04-05' AS Date), N'Nam', N'Hà Nội', N'c156', N'Công nghệ thông tin', N'K56', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV027', N'Lương Nhi', CAST(N'2002-03-05' AS Date), N'Nữ', N'Nam Định', N'c156', N'An ninh hệ thống thông tin', N'K56', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV028', N'Huỳnh Hải Yến', CAST(N'2002-02-09' AS Date), N'Nữ', N'Nghệ An', N'c156', N'Bảo đảm an toàn thông tin', N'K56', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV029', N'Trần Đăng Khôi', CAST(N'2002-01-05' AS Date), N'Nam', N'Nghệ An', N'c156', N'Bảo đảm an toàn thông tin', N'K56', N'0987654321')
INSERT [dbo].[HocVien] ([id_HV], [tenHV], [ngaySinh], [gioiTinh], [queQuan], [id_DV], [tenLop], [id_khoaHoc], [sdt]) VALUES (N'HV030', N'Vũ Việt Hùng', CAST(N'2001-04-01' AS Date), N'Nam', N'Vĩnh Phúc', N'c354', N'Tên lữa phòng không', N'K54', N'0987456321')
GO
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV002', 9, 8.5, 8, N'2019-2020')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH02', N'HV002', 7, 8, 7, N'2019-2020')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV003', 8, 7, 8, N'2019-2020')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH02', N'HV003', 8, 3, 8, N'2019-2020')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV004', 5, 8, 8, N'2019-2020')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH02', N'HV004', 7, 5, 8, N'2019-2020')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV005', 6, 7, 8, N'2019-2020')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH02', N'HV005', 10, 9, 8, N'2019-2020')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV006', 5, 4, 8, N'2019-2020')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH02', N'HV006', 8, 9, 8, N'2019-2020')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV007', 7, 7, 8, N'2019-2020')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH02', N'HV007', 9, 7, 8, N'2019-2020')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV008', 6, 6, 8, N'2019-2020')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH02', N'HV008', 4, 2, 8, N'2019-2020')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV014', 0, 0, 0, N'2020 - 2021')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV015', 0, 0, 0, N'2020 - 2021')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV016', 0, 0, 0, N'2020 - 2021')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV017', 0, 0, 0, N'2020 - 2021')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV018', 0, 0, 0, N'2020 - 2021')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV019', 0, 0, 0, N'2020 - 2021')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV020', 0, 0, 0, N'2020 - 2021')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV021', 0, 0, 0, N'2020 - 2021')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV022', 0, 0, 0, N'2020 - 2021')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV023', 0, 0, 0, N'2020 - 2021')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV024', 0, 0, 0, N'2020 - 2021')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV025', 0, 0, 0, N'2021 - 2022')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV026', 0, 0, 0, N'2021 - 2022')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV027', 0, 0, 0, N'2021 - 2022')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV028', 0, 0, 0, N'2021 - 2022')
INSERT [dbo].[KetQuaHuanLuyen] ([id_monHoc], [id_HV], [diemCC], [diemTX], [diemThi], [namHoc]) VALUES (N'MH01', N'HV029', 0, 0, 0, N'2021 - 2022')
GO
SET IDENTITY_INSERT [dbo].[KHHLDaiDoi] ON 

INSERT [dbo].[KHHLDaiDoi] ([id_DV], [ngayHoc], [diaDiem], [id_CB], [id_baiHoc], [id_KHHL]) VALUES (N'c154', CAST(N'2019-09-10' AS Date), N'Giảng đường H3-216', N'CB003', N'BH001', 1)
INSERT [dbo].[KHHLDaiDoi] ([id_DV], [ngayHoc], [diaDiem], [id_CB], [id_baiHoc], [id_KHHL]) VALUES (N'c154', CAST(N'2019-09-17' AS Date), N'Giảng đường H3-216', N'CB003', N'BH002', 2)
INSERT [dbo].[KHHLDaiDoi] ([id_DV], [ngayHoc], [diaDiem], [id_CB], [id_baiHoc], [id_KHHL]) VALUES (N'c154', CAST(N'2019-09-21' AS Date), N'Giảng đường H3-216', N'CB003', N'BH003', 3)
INSERT [dbo].[KHHLDaiDoi] ([id_DV], [ngayHoc], [diaDiem], [id_CB], [id_baiHoc], [id_KHHL]) VALUES (N'c154', CAST(N'2019-10-05' AS Date), N'Giảng đường H3-216', N'CB003', N'BH004', 4)
SET IDENTITY_INSERT [dbo].[KHHLDaiDoi] OFF
GO
INSERT [dbo].[KHHLTieuDoan] ([id_DV], [tgBatDau], [id_CB], [id_monHoc]) VALUES (N'c154', CAST(N'2019-09-05' AS Date), N'CB001', N'MH01')
INSERT [dbo].[KHHLTieuDoan] ([id_DV], [tgBatDau], [id_CB], [id_monHoc]) VALUES (N'c154', CAST(N'2020-01-17' AS Date), N'CB001', N'MH02')
INSERT [dbo].[KHHLTieuDoan] ([id_DV], [tgBatDau], [id_CB], [id_monHoc]) VALUES (N'c155', CAST(N'2020-09-04' AS Date), N'CB001', N'MH01')
INSERT [dbo].[KHHLTieuDoan] ([id_DV], [tgBatDau], [id_CB], [id_monHoc]) VALUES (N'c156', CAST(N'2021-09-02' AS Date), N'CB001', N'MH01')
GO
INSERT [dbo].[KHHLTrungDoan] ([id_monHoc], [id_DV], [id_CB], [idnguoiDay], [trangThai], [ghiChu], [ngayLapHK]) VALUES (N'MH01', N'd1', N'CB027', N'CB029', 1, N'Đối tượng: Học viên năm 2', CAST(N'2018-09-01' AS Date))
INSERT [dbo].[KHHLTrungDoan] ([id_monHoc], [id_DV], [id_CB], [idnguoiDay], [trangThai], [ghiChu], [ngayLapHK]) VALUES (N'MH01', N'd3', N'CB037', N'CB039', 1, NULL, NULL)
INSERT [dbo].[KHHLTrungDoan] ([id_monHoc], [id_DV], [id_CB], [idnguoiDay], [trangThai], [ghiChu], [ngayLapHK]) VALUES (N'MH02', N'd1', N'CB027', N'CB032', 1, N'Đối tượng: Học viên năm 2', CAST(N'2020-01-15' AS Date))
INSERT [dbo].[KHHLTrungDoan] ([id_monHoc], [id_DV], [id_CB], [idnguoiDay], [trangThai], [ghiChu], [ngayLapHK]) VALUES (N'MH02', N'd3', N'CB037', N'CB038', 1, NULL, NULL)
GO
INSERT [dbo].[KhoaHoc] ([id_khoaHoc], [tenKhoaHoc], [thoigianBD], [thoigianKT]) VALUES (N'K52', N'Khóa 52', CAST(N'2016-09-07' AS Date), CAST(N'2021-12-29' AS Date))
INSERT [dbo].[KhoaHoc] ([id_khoaHoc], [tenKhoaHoc], [thoigianBD], [thoigianKT]) VALUES (N'K53', N'Khóa 53', CAST(N'2017-09-05' AS Date), CAST(N'2022-12-29' AS Date))
INSERT [dbo].[KhoaHoc] ([id_khoaHoc], [tenKhoaHoc], [thoigianBD], [thoigianKT]) VALUES (N'K54', N'Khóa 54', CAST(N'2018-08-24' AS Date), CAST(N'2023-12-28' AS Date))
INSERT [dbo].[KhoaHoc] ([id_khoaHoc], [tenKhoaHoc], [thoigianBD], [thoigianKT]) VALUES (N'K55', N'Khóa 55', CAST(N'2019-08-25' AS Date), CAST(N'2024-12-28' AS Date))
INSERT [dbo].[KhoaHoc] ([id_khoaHoc], [tenKhoaHoc], [thoigianBD], [thoigianKT]) VALUES (N'K56', N'Khóa 56', CAST(N'2020-10-16' AS Date), CAST(N'2025-12-28' AS Date))
GO
INSERT [dbo].[LoaiCanBo] ([id_LoaiCB], [tenLoaiCB], [moTa]) VALUES (N'LCB1', N'Cán bộ kế hoạch', N'Quản lý kế hoạch, thống kê')
INSERT [dbo].[LoaiCanBo] ([id_LoaiCB], [tenLoaiCB], [moTa]) VALUES (N'LCB2', N'Cán bộ tổ chức', N'Quản lý tổ chức, thống kê')
INSERT [dbo].[LoaiCanBo] ([id_LoaiCB], [tenLoaiCB], [moTa]) VALUES (N'LCB3', N'Cán bộ quản lý huấn luyện', N'Quản lý vật chất, thống kê')
INSERT [dbo].[LoaiCanBo] ([id_LoaiCB], [tenLoaiCB], [moTa]) VALUES (N'LCB4', N'Cán bộ thực hiện huấn luyện', N'Quản lý quá trình huấn luyện, điểm danh, Kiểm tra, Thống Kê')
GO
INSERT [dbo].[MonHoc] ([id_monHoc], [tenMonHoc], [moTa], [doiTuong]) VALUES (N'MH01', N'Giải tích 1', N'Nhằm giúp sinh viên hiểu rõ về các khái niệm cơ bản của giải tích và phương pháp tính toán liên quan.', N'Năm 1')
INSERT [dbo].[MonHoc] ([id_monHoc], [tenMonHoc], [moTa], [doiTuong]) VALUES (N'MH02', N'Giải tích 2', N'Được thiết kế để đào tạo sinh viên về những khái niệm nâng cao của giải tích và cung cấp cơ sở cho nhiều lĩnh vực khác nhau. ', N'Năm 2')
INSERT [dbo].[MonHoc] ([id_monHoc], [tenMonHoc], [moTa], [doiTuong]) VALUES (N'MH03', N'Chiến thuật tiểu đoàn', N'Là một môn liên quan đến lĩnh vực quân sự hoặc chiến thuật, thường liên quan đến việc đào tạo về chiến lược và chiến thuật quân sự cấp độ tiểu đoàn trong quân đội.', N'Năm 2')
INSERT [dbo].[MonHoc] ([id_monHoc], [tenMonHoc], [moTa], [doiTuong]) VALUES (N'MH04', N'Triết học Mác - Lê nin', N'Nghiên cứu và hiểu rõ về triết học chính trị của Karl Marx và Friedrich Engels (Mác) và sau đó là triết học của Vladimir Lenin (Lê Nin).', N'Năm 1')
INSERT [dbo].[MonHoc] ([id_monHoc], [tenMonHoc], [moTa], [doiTuong]) VALUES (N'MH05', N'Kinh tế chính trị Mác - Lê nin', N'nghiên cứu và hiểu rõ về quan điểm kinh tế và chính trị của Karl Marx và Friedrich Engels (Mác) cũng như của Vladimir Lenin (Lê Nin).', N'Năm 2')
INSERT [dbo].[MonHoc] ([id_monHoc], [tenMonHoc], [moTa], [doiTuong]) VALUES (N'MH06', N'Toán rời rạc', N'Là một môn học quan trọng trong lĩnh vực Toán học, tập trung vào các khái niệm và cấu trúc toán học không liên tục.', N'Năm 3')
INSERT [dbo].[MonHoc] ([id_monHoc], [tenMonHoc], [moTa], [doiTuong]) VALUES (N'MH07', N'Tin học đại cương', N'Là một môn cơ bản trong các chương trình đào tạo liên quan đến Công nghệ Thông tin và máy tính.', N'Năm 2')
INSERT [dbo].[MonHoc] ([id_monHoc], [tenMonHoc], [moTa], [doiTuong]) VALUES (N'MH08', N'Tâm lý học', N'Giúp sinh viên hiểu rõ về tâm lý con người, các yếu tố ảnh hưởng đến hành vi, cảm xúc, và tư duy. ', N'Năm 1')
GO
INSERT [dbo].[QuyenTK] ([id_quyenTK], [tenQuyenTK], [moTa]) VALUES (1, N'Quản trị viên', N'Quản lý tài khoản, đơn vị')
INSERT [dbo].[QuyenTK] ([id_quyenTK], [tenQuyenTK], [moTa]) VALUES (2, N'Tài khoản đơn vị', N'Quản lý mọi hoạt động của đơn vị')
GO
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-001', N'AK', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-002', N'AK', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-003', N'AK', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-004', N'AK', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-005', N'AK', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-006', N'AK', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-007', N'AK', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-008', N'AK', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-009', N'AK', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-010', N'AK', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-011', N'AK', 0, N'Đang bảo trì, sửa chửa', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-012', N'AK', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-013', N'AK', 1, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-014', N'AK', 1, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-015', N'AK', 0, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-016', N'AK', 0, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-017', N'AK', 0, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-018', N'AK', 0, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-019', N'AK', 0, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-020', N'AK', 0, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-021', N'AK', 0, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-022', N'AK', 0, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-023', N'AK', 0, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-024', N'AK', 0, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-025', N'AK', 0, N'Sử dụng tốt', N'd1')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-026', N'AK', 0, N'Sử dụng tốt', N'd1')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-027', N'AK', 0, N'Sử dụng tốt', N'd1')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-028', N'AK', 0, N'Sử dụng tốt', N'd1')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-029', N'AK', 0, N'Sử dụng tốt', N'd1')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'AK-030', N'AK', 0, N'Sử dụng tốt', N'd1')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'DKZ-001', N'DKZ', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'DKZ-002', N'DKZ', 0, N'Đang bảo trì, sửa chửa', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'K54-001', N'K54', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'K54-0010', N'K54', 0, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'K54-002', N'K54', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'K54-003', N'K54', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'K54-004', N'K54', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'K54-005', N'K54', 0, N'Sử dụng tốt', N'e111')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'K54-006', N'K54', 0, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'K54-007', N'K54', 0, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'K54-008', N'K54', 0, N'Sử dụng tốt', N'e365')
INSERT [dbo].[TTB] ([id_TTB], [id_chungLoai], [trangThai], [tinhTrang], [id_DV]) VALUES (N'K54-009', N'K54', 0, N'Sử dụng tốt', N'e365')
GO
INSERT [dbo].[Users] ([id_user], [username], [passwrd], [id_quyenTK]) VALUES (N'U01', N'admin', N'123456', 2)
INSERT [dbo].[Users] ([id_user], [username], [passwrd], [id_quyenTK]) VALUES (N'U02', N'admin2', N'123456', 2)
INSERT [dbo].[Users] ([id_user], [username], [passwrd], [id_quyenTK]) VALUES (N'U03', N'abcdef', N'123456', 2)
INSERT [dbo].[Users] ([id_user], [username], [passwrd], [id_quyenTK]) VALUES (N'U04', N'admin3', N'123456', 2)
INSERT [dbo].[Users] ([id_user], [username], [passwrd], [id_quyenTK]) VALUES (N'U05', N'admin4', N'123456', 2)
INSERT [dbo].[Users] ([id_user], [username], [passwrd], [id_quyenTK]) VALUES (N'U06', N'admin5', N'123456', 1)
INSERT [dbo].[Users] ([id_user], [username], [passwrd], [id_quyenTK]) VALUES (N'U07', N'piwpiw', N'123456', 2)
INSERT [dbo].[Users] ([id_user], [username], [passwrd], [id_quyenTK]) VALUES (N'U08', N'hohooo', N'123456', 2)
INSERT [dbo].[Users] ([id_user], [username], [passwrd], [id_quyenTK]) VALUES (N'U09', N'mewmew', N'123456', 2)
INSERT [dbo].[Users] ([id_user], [username], [passwrd], [id_quyenTK]) VALUES (N'U10', N'hehee', N'123456', 2)
INSERT [dbo].[Users] ([id_user], [username], [passwrd], [id_quyenTK]) VALUES (N'U11', N'adminstrator', N'123456', 1)
INSERT [dbo].[Users] ([id_user], [username], [passwrd], [id_quyenTK]) VALUES (N'U12', N'trangbid', N'123456', 2)
INSERT [dbo].[Users] ([id_user], [username], [passwrd], [id_quyenTK]) VALUES (N'U13', N'trangbie111', N'123456', 2)
INSERT [dbo].[Users] ([id_user], [username], [passwrd], [id_quyenTK]) VALUES (N'U14', N'hocvienc', N'123456', 2)
INSERT [dbo].[Users] ([id_user], [username], [passwrd], [id_quyenTK]) VALUES (N'U15', N'KHHLTieuDoan', N'123456', 2)
GO
/****** Object:  Index [UQ__DiemDanh__FEC08514B12C4730]    Script Date: 17/12/2023 8:32:40 CH ******/
ALTER TABLE [dbo].[DiemDanhHuanLuyen] ADD UNIQUE NONCLUSTERED 
(
	[id_diemDanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BaiHoc]  WITH CHECK ADD  CONSTRAINT [FK__BaiHoc__id_monHo__5CD6CB2B] FOREIGN KEY([id_monHoc])
REFERENCES [dbo].[MonHoc] ([id_monHoc])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BaiHoc] CHECK CONSTRAINT [FK__BaiHoc__id_monHo__5CD6CB2B]
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
ALTER TABLE [dbo].[DiemDanhHuanLuyen]  WITH CHECK ADD FOREIGN KEY([id_HV])
REFERENCES [dbo].[HocVien] ([id_HV])
GO
ALTER TABLE [dbo].[DiemDanhHuanLuyen]  WITH CHECK ADD FOREIGN KEY([id_KHHL])
REFERENCES [dbo].[KHHLDaiDoi] ([id_KHHL])
ON DELETE CASCADE
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
ALTER TABLE [dbo].[KHHLDaiDoi]  WITH CHECK ADD  CONSTRAINT [FK__KeHoachHu__id_CB__01142BA1] FOREIGN KEY([id_CB])
REFERENCES [dbo].[Canbo] ([id_CB])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KHHLDaiDoi] CHECK CONSTRAINT [FK__KeHoachHu__id_CB__01142BA1]
GO
ALTER TABLE [dbo].[KHHLDaiDoi]  WITH CHECK ADD  CONSTRAINT [FK__KeHoachHu__id_DV__00200768] FOREIGN KEY([id_DV])
REFERENCES [dbo].[DonVi] ([id_DV])
GO
ALTER TABLE [dbo].[KHHLDaiDoi] CHECK CONSTRAINT [FK__KeHoachHu__id_DV__00200768]
GO
ALTER TABLE [dbo].[KHHLTieuDoan]  WITH CHECK ADD  CONSTRAINT [FK__KHHLTieuD__id_CB__3493CFA7] FOREIGN KEY([id_CB])
REFERENCES [dbo].[Canbo] ([id_CB])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KHHLTieuDoan] CHECK CONSTRAINT [FK__KHHLTieuD__id_CB__3493CFA7]
GO
ALTER TABLE [dbo].[KHHLTrungDoan]  WITH CHECK ADD FOREIGN KEY([id_CB])
REFERENCES [dbo].[Canbo] ([id_CB])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KHHLTrungDoan]  WITH CHECK ADD FOREIGN KEY([id_monHoc])
REFERENCES [dbo].[MonHoc] ([id_monHoc])
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
/****** Object:  StoredProcedure [dbo].[CapDV]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[CapDV]
as
begin
select id_capDV, tenCapDV from CapDonVi;
end;

GO
/****** Object:  StoredProcedure [dbo].[createBaiHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[createBaiHoc]
@idBaiHoc varchar(10), @tenBaiHoc nvarchar(100),@soGio int, @soTiet int, @idMonHoc varchar(10)
as
begin
insert into BaiHoc(id_baiHoc,tenBaiHoc,id_monHoc,soGio, soTiet) values (@idBaiHoc,@tenBaiHoc,@idMonHoc,@soGio, @soTiet);
end
GO
/****** Object:  StoredProcedure [dbo].[createBienCheTTB]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[createCB]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[createChungLoai]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[createDV]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[createDVCapDuoi]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[createDVCapDuoi]
@id_DV varchar(10), @tenDV nvarchar(100), @id_capDV int, @moTa nvarchar(100), @idDVCapTren varchar(10)
as
begin
insert into DonVi(id_DV, tenDV, id_capDV, moTa) values (@id_DV, @tenDV, @id_capDV, @moTa);
insert into DVTrucThuoc(id_capDuoi, id_capTren) values (@id_DV,@idDVCapTren);
end 
GO
/****** Object:  StoredProcedure [dbo].[createHV]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[createKHHLDaiDoi]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[createKHHLDaiDoi]
@id_baiHoc varchar(10), @id_DV varchar(10), @id_CB varchar(10), @ngayHoc date, @diaDiem nvarchar(100)
as
begin
insert into KHHLDaiDoi (id_baiHoc, id_DV, id_CB, ngayHoc, diaDiem) values (@id_baiHoc, @id_DV, @id_CB,@ngayHoc, @diaDiem);
declare @idKHHL int
select @idKHHL = id_KHHL from KHHLDaiDoi where id_baiHoc =@id_baiHoc and id_DV = @id_DV and id_CB = @id_CB;
exec InsertDiemDanh @id_KHHL=@idKHHL,  @id_DV=@id_DV

end
GO
/****** Object:  StoredProcedure [dbo].[createKHHLTieuDoan]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createKHHLTieuDoan]
    @id_monHoc VARCHAR(10),
    @id_DV VARCHAR(10),
    @tgBatDau DATE,
    @id_CB VARCHAR(10)
AS
BEGIN
    DECLARE @namHoc NVARCHAR(100);

    SET @namHoc = CONVERT(NVARCHAR(4), YEAR(@tgBatDau)) + ' - ' + CONVERT(NVARCHAR(4), YEAR(@tgBatDau) + 1);

    INSERT INTO KHHLTieuDoan (id_monHoc, id_DV, tgBatDau, id_CB)
    VALUES (@id_monHoc, @id_DV, @tgBatDau, @id_CB);

    EXEC InsertKetQuaHuanLuyen @idDV = @id_DV, @id_monHoc = @id_monHoc, @namHoc = @namHoc;
END;
GO
/****** Object:  StoredProcedure [dbo].[createKHHLTrungDoan]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[createKHHLTrungDoan]
@id_monHoc varchar(10), @id_DV varchar(10), @idNguoiDay varchar(10), @id_CB varchar(10), @ngayLapHK date, @ghiChu nvarchar(MAX), @trangThai bit
as
begin
insert into KHHLTrungDoan(id_monHoc, id_DV, idnguoiDay, id_CB, ngayLapHK, ghiChu, trangThai) values (@id_monHoc, @id_DV, @idnguoiDay, @id_CB, @ngayLapHK, @ghiChu, @trangThai);
end
GO
/****** Object:  StoredProcedure [dbo].[createKhoaHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[createMonHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
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

exec createMonHoc @idMonHoc = 'MH07', @tenMonHoc = N'Tin học đại cương',@doiTuong=N'Năm 2', @moTa = N'Là một môn cơ bản trong các chương trình đào tạo liên quan đến Công nghệ Thông tin và máy tính.'

GO
/****** Object:  StoredProcedure [dbo].[createNoiDungBaiHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[createTaiKhoan]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[createTaiKhoan]
@id_CB varchar(10), @id_user varchar(10), @username varchar(100), @passwrd varchar(100), @id_quyenTK int
as 
begin
insert into Users(id_user, username, passwrd, id_quyenTK) values (@id_user, @username, @passwrd, @id_quyenTK);
update Canbo set id_user = @id_user where id_CB = @id_CB
end
GO
/****** Object:  StoredProcedure [dbo].[createTTB]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[deleteBienCheTTB]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[deleteCanBo]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[deleteChungLoaitheoDonVi]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[deleteDV]    Script Date: 17/12/2023 8:32:40 CH ******/
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


EXEC deleteDV @id_DV = 'e113';

GO
/****** Object:  StoredProcedure [dbo].[deleteHVtheoDonVi]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[deleteHVtheoKhoaHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[deleteTaiKhoan]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteTaiKhoan]
@id_CB varchar(10), @id_user varchar(10)
as
begin
update Canbo set id_user = null where id_CB = @id_CB;
delete from Users where id_user = @id_user;
end
GO
/****** Object:  StoredProcedure [dbo].[deleteTTB]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[DiemDanh]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DiemDanh]
 @id_HV varchar(10), @isVangMat bit, @ghiChu nvarchar(100), @idKHHL int
 as
 begin
 update DiemDanhHuanLuyen set isVangMat = @isVangMat, ghiChu=@ghiChu where id_HV = @id_HV and id_KHHL = @idKHHL
end
GO
/****** Object:  StoredProcedure [dbo].[DonViTheoCap]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Proc ngày 23/11/2023*/
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
/****** Object:  StoredProcedure [dbo].[DonViTrucThuoc]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[getCanBo]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[getCBkhongTaiKhoan]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getCBkhongTaiKhoan]
AS
BEGIN
    SELECT * 
    FROM Canbo 
    WHERE id_user IS NULL OR id_user = '';
END;
GO
/****** Object:  StoredProcedure [dbo].[getCBtheoUsername]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getCBtheoUsername]
@username nvarchar(100)
as
begin
declare @id_user varchar(10), @id_CB varchar(10);
select @id_user = id_user from Users where username = @username;

 select CB.id_CB, CB.tenCB, CB.id_DV, DV.id_capDV, U.id_quyenTK  from Canbo as CB inner join DonVi as DV on CB.id_DV = DV.id_DV inner join Users as U on CB.id_user = U.id_user where CB.id_user = @id_user;
end
GO
/****** Object:  StoredProcedure [dbo].[getDonVi]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getDonVi]
as
begin
select DV.tenDV, DV.id_DV, DV.id_capDV, CDV.tenCapDV, DV.moTa from DonVi as DV inner join CapDonVi as CDV on DV.id_capDV = CDV.id_capDV full outer join DVTrucThuoc as DVTT on DV.id_DV = DVTT.id_capDuoi where CDV.id_capDV = '3'
end;
GO
/****** Object:  StoredProcedure [dbo].[getDonViThucHien]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getDonViThucHien]
@idDV varchar(10)
as
begin
select * from DonVi as DV inner join DVTrucThuoc as DVTT on DV.id_DV = DVTT.id_capDuoi where DVTT.id_capTren=@idDV;
end
GO
/****** Object:  StoredProcedure [dbo].[getdsBaiHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getdsBaiHoc] 
@idMonHoc varchar(10)
as
begin
select id_baiHoc, tenBaiHoc, soGio, soTiet from BaiHoc where id_monHoc = @idMonHoc;
end
GO
/****** Object:  StoredProcedure [dbo].[getdsBaiHocchuaKHHL]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getdsBaiHocchuaKHHL]
@idDV varchar(10)
as
begin
SELECT *
FROM BaiHoc 
WHERE id_monHoc IN (SELECT id_monHoc FROM KHHLTieuDoan WHERE id_DV = @idDV)
  AND id_baiHoc NOT IN (SELECT id_baiHoc FROM KHHLDaiDoi WHERE id_DV = @idDV)
  ;
end
GO
/****** Object:  StoredProcedure [dbo].[getdsBienChe]    Script Date: 17/12/2023 8:32:40 CH ******/
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

exec getdsBienChe @idDV = 'e365'
GO
/****** Object:  StoredProcedure [dbo].[getdsBuoiHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getdsBuoiHoc]
@id_DV varchar(10), @id_monHoc varchar(10)
as
begin
select KHHL.id_KHHL, format(KHHL.ngayHoc, 'dd/MM/yyyy') as ngayHoc, BH.id_baiHoc, BH.tenBaiHoc, BH.soTiet from KHHLDaiDoi as KHHL inner join BaiHoc as BH on KHHL.id_baiHoc = BH.id_baiHoc where id_DV = @id_DV and KHHL.id_baiHoc in (select id_baiHoc from BaiHoc where id_monHoc = @id_monHoc)
end
GO
/****** Object:  StoredProcedure [dbo].[getdsCapDuoi]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getdsCapDuoi]
@idDV varchar(10)
as
begin
select DV.tenDV, DV.id_DV, CDV.tenCapDV, CDV.id_capDV, DV.moTa  from DonVi as DV inner join CapDonVi as CDV on DV.id_capDV = CDV.id_capDV inner join DVTrucThuoc as DVTT on DV.id_DV = DVTT.id_capDuoi where DVTT.id_capTren = @idDV ;
end
GO
/****** Object:  StoredProcedure [dbo].[getdsDiemDanh]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getdsDiemDanh]
@id_KHHL int, @id_DV varchar(10)
as
begin
select DD.id_HV, HV.tenHV, DD.isVangMat, DD.ghiChu, DD.id_KHHL from DiemDanhHuanLuyen as DD inner join HocVien as HV on DD.id_HV = HV.id_HV where DD.id_KHHL = @id_KHHL and HV.id_DV = @id_DV

end
GO
/****** Object:  StoredProcedure [dbo].[getdsDonVitheoMonHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getdsDonVitheoMonHoc]
@id_monHoc varchar(10)
as
begin
select DV.id_DV, DV.tenDV,DVTT.id_capTren, DV.moTa from DonVi as DV inner join DVTrucThuoc as DVTT on DV.id_DV = DVTT.id_capDuoi where  id_DV in (select id_DV from KHHLTieuDoan where id_monHoc = @id_monHoc);
end
GO
/****** Object:  StoredProcedure [dbo].[getdsHocVien]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[getdsHVtheoDaiDoi]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[getdsHVtheoDonVi]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[getdsHVtheoKhoaHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[getdsKhoaHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[getdsMonHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[getdsMonHoc]
as
begin
select id_monHoc, tenMonHoc, doiTuong, moTa from MonHoc;
end

exec getdsMonHoc
GO
/****** Object:  StoredProcedure [dbo].[getdsNoiDungBaiHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
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

exec getdsNoiDungBaiHoc @idBaiHoc = 'BH001'
GO
/****** Object:  StoredProcedure [dbo].[getDV_CapDV]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[getGVnhapdiem]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getGVnhapdiem]
@id_DV varchar(10), @id_monHoc varchar(10)
as
begin
select idnguoiDay from KHHLTrungDoan where id_DV in (select DVTT.id_capTren from DVTrucThuoc as DVTT inner join KHHLTieuDoan as TD on DVTT.id_capDuoi = TD.id_DV where id_DV in (select id_DV from DVTrucThuoc where id_capDuoi = @id_DV)) and id_monHoc = @id_monHoc;
end
GO
/****** Object:  StoredProcedure [dbo].[getInfoDV]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[getInfoDV] 
@id_DV varchar(10)
as
begin
select DV.id_DV,DV.tenDV,CDV.tenCapDV, DV.moTa from DonVi as DV inner join CapDonVi as CDV on DV.id_capDV = CDV.id_capDV where DV.id_DV = @id_DV;
end;
GO
/****** Object:  StoredProcedure [dbo].[getKetQuaHuanLuyen]    Script Date: 17/12/2023 8:32:40 CH ******/
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

exec getKetQuaHuanLuyen @id_monHoc = 'MH01', @idDV = 'c155';

select tenMonHoc from MonHoc where id_monHoc='MH01'

update KetQuaHuanLuyen set namHoc = '2020-2021' where id_monHoc = 'MH01'
GO
/****** Object:  StoredProcedure [dbo].[getKHHLCapTren]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getKHHLCapTren]
@id_DV varchar(10) 
as
begin
declare @idCapTren varchar(10)
select @idCapTren = id_capTren from DVTrucThuoc where id_capDuoi = @id_DV
exec getKHHLTrungDoan @idDV = @idCapTren
end
GO
/****** Object:  StoredProcedure [dbo].[getKHHLDaiDoi]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getKHHLDaiDoi]
@id_DV varchar(10) 
as
begin
select BH.id_baiHoc, BH.tenBaiHoc, DV.id_DV, DV.tenDV, format(KHHL.ngayHoc, 'dd/MM/yyyy') as ngayHoc, KHHL.diaDiem, BH.soTiet, CB.id_CB, CB.tenCB from KHHLDaiDoi as KHHL 
inner join Canbo as CB on KHHL.id_CB = CB.id_CB
inner join DonVi as DV on KHHL.id_DV = DV.id_DV
inner join BaiHoc as BH on KHHL.id_baiHoc = BH.id_baiHoc
where KHHL.id_DV = @id_DV
end
GO
/****** Object:  StoredProcedure [dbo].[getKHHLTieuDoan]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getKHHLTieuDoan]
@idDV varchar(10)
as
begin
select DV.id_DV, DV.tenDV, MH.id_monHoc, MH.tenMonHoc,format( KHHL.tgBatDau, 'dd/MM/yyyy') as tgBatDau, CB1.id_CB, CB1.tenCB from KHHLTieuDoan as KHHL 
inner join Canbo as CB1 on CB1.id_CB = KHHL.id_CB 
inner join DonVi as DV on KHHL.id_DV = DV.id_DV 
inner join  MonHoc as MH on MH.id_monHoc =KHHL.id_monHoc 
inner join DVTrucThuoc as DVTT on DVTT.id_capDuoi = DV.id_DV
where DVTT.id_capTren = @idDV;
end
GO
/****** Object:  StoredProcedure [dbo].[getKHHLTrungDoan]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getKHHLTrungDoan]
@idDV varchar(10)
as
begin
select DV.id_DV, DV.tenDV, MH.id_monHoc, MH.tenMonHoc, CB1.id_CB, CB1.tenCB, CB2.id_CB as idNguoiDay, CB2.tenCB as nguoiDay, KHHL.trangThai,format(KHHL.ngayLapHK, 'dd/MM/yyyy') as ngayLapHK, KHHL.ghiChu from KHHLTrungDoan as KHHL 
inner join Canbo as CB1 on CB1.id_CB = KHHL.id_CB 
inner join DonVi as DV on KHHL.id_DV = DV.id_DV 
inner join  MonHoc as MH on MH.id_monHoc =KHHL.id_monHoc 
inner join Canbo as CB2 on CB2.id_CB = KHHL.idnguoiDay 
inner join DVTrucThuoc as DVTT on DVTT.id_capDuoi = DV.id_DV
where DVTT.id_capTren = @idDV;
end
GO
/****** Object:  StoredProcedure [dbo].[getMonHocfromKHHL]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getMonHocfromKHHL]
@id_KHHL int
as
begin
select id_monHoc, tenMonHoc  from MonHoc where id_monHoc in (select id_monHoc from BaiHoc where id_baiHoc in (select id_baiHoc from KHHLDaiDoi where id_KHHL = @id_KHHL))
end
GO
/****** Object:  StoredProcedure [dbo].[getMonHocinKHHLCapTren]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getMonHocinKHHLCapTren]
@idDV varchar(10)
as
begin
select * from MonHoc as MH where exists (select id_monHoc from KHHLTrungDoan as KHHL inner join DVTrucThuoc as DVTT on KHHL.id_DV = DVTT.id_capTren where MH.id_monHoc = KHHL.id_monHoc and DVTT.id_capTren=@idDV);
end
GO
/****** Object:  StoredProcedure [dbo].[getMonHockhongKHHL]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getMonHockhongKHHL]
@idDV varchar(10)
as
begin
select * from MonHoc as MH where not exists (select id_monHoc from KHHLTrungDoan as KHHL inner join DVTrucThuoc as DVTT on KHHL.id_DV = DVTT.id_capDuoi where MH.id_monHoc = KHHL.id_monHoc and KHHL.trangThai = '1' and DVTT.id_capTren=@idDV);
end
GO
/****** Object:  StoredProcedure [dbo].[getQuanLyTaiKhoan]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getQuanLyTaiKhoan]
as
begin
select CB.id_CB, CB.tenCB, DV.id_DV, DV.tenDV, U.id_user, U.username, U.passwrd,QTK.id_quyenTK, QTK.tenQuyenTK from Users as U inner join Canbo as CB on U.id_user = CB.id_user inner join QuyenTK as QTK on U.id_quyenTK = QTK.id_quyenTK inner join DonVi as DV on DV.id_DV = CB.id_DV;
end
GO
/****** Object:  StoredProcedure [dbo].[getTTB]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[getTTBchuaBienChe]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[InsertDiemDanh]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertDiemDanh]
    @id_KHHL INT,
    @id_DV VARCHAR(10)
AS
BEGIN
    -- Tạo bảng tạm thời chứa danh sách id_HV từ HocVien thuộc id_DV
    CREATE TABLE #TempHocVien (
        id_HV VARCHAR(10)
    );

    -- Chèn dữ liệu từ HocVien vào bảng tạm thời
    INSERT INTO #TempHocVien (id_HV)
    SELECT id_HV
    FROM HocVien
    WHERE id_DV = @id_DV;

    -- Insert dữ liệu vào bảng DiemDanhHuanLuyen
    INSERT INTO DiemDanhHuanLuyen (id_HV, id_KHHL, isVangMat, ghiChu)
    SELECT thv.id_HV, @id_KHHL, '', ''
    FROM #TempHocVien thv;

    -- Xóa bảng tạm thời sau khi sử dụng
    DROP TABLE #TempHocVien;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertKetQuaHuanLuyen]    Script Date: 17/12/2023 8:32:40 CH ******/
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
    INSERT INTO KetQuaHuanLuyen (id_monHoc, id_HV, diemCC, diemTX, diemThi, namHoc)
    SELECT @id_monHoc, id_HV, '', '', '', @namHoc
    FROM HocVien
    WHERE id_DV = @idDV;
END;

EXEC InsertKetQuaHuanLuyen @idDV = 'c157', @id_monHoc = 'MH01', @namHoc='2022-2023'

GO
/****** Object:  StoredProcedure [dbo].[ThongKeChuyenCan]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThongKeChuyenCan]
@id_monHoc varchar(10), @id_DV varchar(10)
as
begin
SELECT
    HV.id_HV,
    HV.tenHV,
    COUNT(DDHL.id_diemDanh) AS SoBuoiDenLop
FROM
    HocVien HV
JOIN
    DiemDanhHuanLuyen DDHL ON HV.id_HV = DDHL.id_HV
JOIN
    KHHLDaiDoi KHHL ON DDHL.id_KHHL = KHHL.id_KHHL
JOIN
    BaiHoc BH ON KHHL.id_baiHoc = BH.id_baiHoc
WHERE
    BH.id_monHoc = @id_monHoc
    AND DDHL.isVangMat = 0
    AND HV.id_DV = @id_DV
GROUP BY
    HV.id_HV, HV.tenHV;

end
GO
/****** Object:  StoredProcedure [dbo].[ThongKeDiemTB]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThongKeDiemTB]
    @idDV VARCHAR(10),
    @id_monHoc VARCHAR(10)
AS
BEGIN
with KetQuaDonVi as (select HV.id_HV, HV.tenHV, MH.id_monHoc, MH.tenMonHoc, KQ.namHoc, KQ.diemCC, KQ.diemTX, KQ.diemThi, ROUND(KQ.diemCC*0.1+KQ.diemTX*0.3+KQ.diemThi*0.6,2) as diemTB from KetQuaHuanLuyen as KQ inner join HocVien as HV on KQ.id_HV = HV.id_HV inner join MonHoc as MH on KQ.id_monHoc = MH.id_monHoc where HV.id_DV = @idDV and KQ.id_monHoc = @id_monHoc)
    SELECT
        CASE
            WHEN diemTB >= 8.0 THEN N'Giỏi'
            WHEN diemTB >= 6.0 AND diemTB < 8.0 THEN N'Khá'
            WHEN diemTB >= 5.0 AND diemTB < 6.0 THEN N'Trung bình'
            ELSE N'Yếu'
        END AS XepLoai,
        COUNT(HV.id_HV) AS SoLuong
    FROM
        MonHoc AS MH
    LEFT JOIN
        KetQuaDonVi AS KQ ON MH.id_monHoc = KQ.id_monHoc
    LEFT JOIN
        HocVien AS HV ON KQ.id_HV = HV.id_HV AND HV.id_DV = @idDV
    WHERE
        MH.id_monHoc = @id_monHoc
    GROUP BY
        CASE
            WHEN diemTB >= 8.0 THEN N'Giỏi'
            WHEN diemTB >= 6.0 AND diemTB < 8.0 THEN N'Khá'
            WHEN diemTB >= 5.0 AND diemTB < 6.0 THEN N'Trung bình'
            ELSE N'Yếu'
        END;
END;
GO
/****** Object:  StoredProcedure [dbo].[TongDV]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[updateBaiHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateBaiHoc]
@idBaiHoc varchar(10), @tenBaiHoc nvarchar(100), @soGio int, @soTiet int
as
begin
update BaiHoc set tenBaiHoc = @tenBaiHoc, soGio=@soGio, soTiet=@soTiet where id_baiHoc = @idBaiHoc
end
GO
/****** Object:  StoredProcedure [dbo].[updateBienCheTTB]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[updateCB]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[updateChungLoai]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[updateDV]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[updateDV]
@id_DV varchar(10), @tenDV nvarchar(100), @id_capDV int, @moTa nvarchar(100)
as
begin
update DonVi set tenDV = @tenDV, moTa = @moTa where id_DV = @id_DV;
end
GO
/****** Object:  StoredProcedure [dbo].[updateDVCoBan]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[updateHV]    Script Date: 17/12/2023 8:32:40 CH ******/
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

exec updateHV @tenHV=N'Vũ Việt Hùng', @id_HV='HV030', @ngaySinhHV = '2001-04-01', @gioiTinh = N'Nam', @queQuan = N'Vĩnh Phúc', @tenLop = N'Tên lữa phòng không', @tenDV = N'Đại đội 354', @sdt = '0987456321', @idKhoaHoc = 'K54'
GO
/****** Object:  StoredProcedure [dbo].[updateKetQuaHuanLuyen]    Script Date: 17/12/2023 8:32:40 CH ******/
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

exec updateKetQuaHuanLuyen @id_monHoc = 'MH01', @id_HV='HV014', @diemCC = '8', @diemTX = '8.5', @diemThi='8.00'
GO
/****** Object:  StoredProcedure [dbo].[updateKHHLDaiDoi]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateKHHLDaiDoi]
@id_baiHoc varchar(10), @id_DV varchar(10),@ngayHoc date, @diaDiem nvarchar(100)
as
begin
update KHHLDaiDoi set ngayHoc=@ngayHoc, diaDiem=@diaDiem where id_baiHoc=@id_baiHoc and id_DV = @id_DV
end
GO
/****** Object:  StoredProcedure [dbo].[updateKHHLTieuDoan]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateKHHLTieuDoan]
@tenMonHoc nvarchar(100), @tenDV nvarchar(100), @tgBatDau date
as
begin
update KHHLTieuDoan set tgBatDau=@tgBatDau where id_DV in (select id_DV from DonVi where tenDV = @tenDV) and id_monHoc in (select id_monHoc from MonHoc where tenMonHoc= @tenMonHoc)
end
GO
/****** Object:  StoredProcedure [dbo].[updateKHHLTrungDoan]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateKHHLTrungDoan]
@id_monHoc nvarchar(100), @id_DV nvarchar(100), @idNguoiDay varchar(10), @ngayLapHK date, @ghiChu nvarchar(MAX), @trangThai bit
as
begin
update KHHLTrungDoan set idnguoiDay=@idNguoiDay, ngayLapHK=@ngayLapHK, ghiChu=@ghiChu, trangThai=@trangThai where id_DV in (select id_DV from DonVi where tenDV = @id_DV) and id_monHoc in (select id_monHoc from MonHoc where tenMonHoc= @id_monHoc)
end
GO
/****** Object:  StoredProcedure [dbo].[updateKhoaHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[updateMonHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
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

exec updateMonHoc @idMonHoc = 'MH05', @tenMonHoc = N'Kinh tế chính trị Mác - Lê nin haha',@doiTuong = N'Năm 2', @moTa = N'nghiên cứu và hiểu rõ về quan điểm kinh tế và chính trị của Karl Marx và Friedrich Engels (Mác) cũng như của Vladimir Lenin (Lê Nin).'

GO
/****** Object:  StoredProcedure [dbo].[updateNoiDungBaiHoc]    Script Date: 17/12/2023 8:32:40 CH ******/
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
/****** Object:  StoredProcedure [dbo].[updateTaiKhoan]    Script Date: 17/12/2023 8:32:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateTaiKhoan]
 @id_user varchar(10), @username varchar(100), @passwrd varchar(100), @id_quyenTK int
as 
begin
update Users set username = @username, passwrd=@passwrd, id_quyenTK=@id_quyenTK where id_user=@id_user;

end
GO
/****** Object:  StoredProcedure [dbo].[updateTTB]    Script Date: 17/12/2023 8:32:40 CH ******/
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
