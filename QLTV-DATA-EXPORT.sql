USE [master]
GO
/****** Object:  Database [QLTV2]    Script Date: 20/07/2021 2:01:12 CH ******/
CREATE DATABASE [QLTV2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLTV2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLTV2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLTV2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLTV2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLTV2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTV2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTV2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTV2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTV2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTV2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTV2] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTV2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLTV2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTV2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTV2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTV2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTV2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTV2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTV2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTV2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTV2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLTV2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTV2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTV2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTV2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTV2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTV2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTV2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTV2] SET RECOVERY FULL 
GO
ALTER DATABASE [QLTV2] SET  MULTI_USER 
GO
ALTER DATABASE [QLTV2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTV2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLTV2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLTV2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLTV2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLTV2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLTV2', N'ON'
GO
ALTER DATABASE [QLTV2] SET QUERY_STORE = OFF
GO
USE [QLTV2]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[Ten] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[MaLop] [varchar](10) NOT NULL,
	[Ten] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NXB]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NXB](
	[MaNXB] [varchar](10) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](30) NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuMuon]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuMuon](
	[MaPhieuMuon] [varchar](10) NOT NULL,
	[MaSV] [varchar](10) NULL,
	[NgayMuon] [date] NULL,
	[NgayHenTra] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [varchar](10) NOT NULL,
	[TenSach] [nvarchar](50) NULL,
	[MaTheLoai] [varchar](10) NULL,
	[MaTG] [varchar](10) NULL,
	[SoLuong] [int] NULL,
	[MaNXB] [varchar](10) NULL,
	[NgayNhap] [date] NULL,
	[NDTT] [nvarchar](100) NULL,
	[Hinh] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SachPhieuMuon]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SachPhieuMuon](
	[MaPhieuMuon] [varchar](10) NOT NULL,
	[MaSach] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC,
	[MaPhieuMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SachTG]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SachTG](
	[MaTG] [varchar](10) NOT NULL,
	[MaSach] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [varchar](10) NOT NULL,
	[Password] [varchar](50) NULL,
	[MaLop] [varchar](10) NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [bit] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [varchar](11) NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[MaTG] [varchar](10) NOT NULL,
	[Ten] [nvarchar](30) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoaiSach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoaiSach](
	[MaTheLoai] [varchar](10) NOT NULL,
	[TenTheLoai] [nvarchar](50) NULL,
	[ViTri] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViPham]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViPham](
	[MaViPham] [varchar](10) NOT NULL,
	[MaSV] [varchar](10) NULL,
	[Ten] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaViPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PhieuMuon] ADD  DEFAULT (getdate()) FOR [NgayMuon]
GO
ALTER TABLE [dbo].[PhieuMuon] ADD  DEFAULT (getdate()+(10)) FOR [NgayHenTra]
GO
ALTER TABLE [dbo].[PhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK_PM_MaSvPhieuMuon] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[PhieuMuon] CHECK CONSTRAINT [FK_PM_MaSvPhieuMuon]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_PM_MaSachNXB] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NXB] ([MaNXB])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_PM_MaSachNXB]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_TheLoai] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoaiSach] ([MaTheLoai])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_TheLoai]
GO
ALTER TABLE [dbo].[SachPhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK_PM_MaPhieuMuon] FOREIGN KEY([MaPhieuMuon])
REFERENCES [dbo].[PhieuMuon] ([MaPhieuMuon])
GO
ALTER TABLE [dbo].[SachPhieuMuon] CHECK CONSTRAINT [FK_PM_MaPhieuMuon]
GO
ALTER TABLE [dbo].[SachPhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK_PM_MaSachMuon] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[SachPhieuMuon] CHECK CONSTRAINT [FK_PM_MaSachMuon]
GO
ALTER TABLE [dbo].[SachTG]  WITH CHECK ADD  CONSTRAINT [FK_PM_MaSachTG] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[SachTG] CHECK CONSTRAINT [FK_PM_MaSachTG]
GO
ALTER TABLE [dbo].[SachTG]  WITH CHECK ADD  CONSTRAINT [FK_PM_MaTG] FOREIGN KEY([MaTG])
REFERENCES [dbo].[TacGia] ([MaTG])
GO
ALTER TABLE [dbo].[SachTG] CHECK CONSTRAINT [FK_PM_MaTG]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_PM_MaLop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_PM_MaLop]
GO
ALTER TABLE [dbo].[ViPham]  WITH CHECK ADD  CONSTRAINT [FK_PM_MaSV] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[ViPham] CHECK CONSTRAINT [FK_PM_MaSV]
GO
/****** Object:  StoredProcedure [dbo].[sp_GioiTinhSV]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_GioiTinhSV](@GioiTinh bit)
AS BEGIN 
 	Select * from SinhVien where GioiTinh = @GioiTinh
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_Maload]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Maload](@MaPhieuMuon varchar(50)) 
AS BEGIN 
 	Select spm.MaSach
	from PhieuMuon pm join SachPhieuMuon spm on spm.MaPhieuMuon = pm.MaPhieuMuon
	join Sach s on spm.MaSach = s.MaSach
	join SinhVien sv on pm.MaSV = sv.MaSV
	where pm.MaPhieuMuon = @MaPhieuMuon
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_MaPhieuMuon]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_MaPhieuMuon](@MaPhieuMuon varchar(50)) 
AS BEGIN 
 	Select pm.MaPhieuMuon, pm.MaSV, sv.HoTen, spm.MaSach, s.TenSach,COUNT(spm.MaSach) SoLuong, NgayMuon, NgayHenTra
	from PhieuMuon pm join SinhVien sv on pm.MaSV = sv.MaSV
	join SachPhieuMuon spm on spm.MaPhieuMuon = pm.MaPhieuMuon
	join Sach s on spm.MaSach = s.MaSach
	where pm.MaPhieuMuon = @MaPhieuMuon
	GROUP BY pm.MaPhieuMuon, pm.MaSV, sv.HoTen, spm.MaSach, s.TenSach,SoLuong, NgayMuon, NgayHenTra
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_MaSachLoad]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_MaSachLoad](@MaPhieuMuon varchar(50)) 
AS BEGIN 
 	Select spm.MaSach from PhieuMuon pm join SinhVien sv on pm.MaSV = sv.MaSV
	join SachPhieuMuon spm on spm.MaPhieuMuon = pm.MaPhieuMuon
	join Sach s on spm.MaSach = s.MaSach
	where pm.MaPhieuMuon = @MaPhieuMuon
	GROUP BY spm.MaSach
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_MaSachPM]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_MaSachPM](@MaSach varchar(10)) 
AS BEGIN 
 	Select pm.MaPhieuMuon, pm.MaSV, sv.HoTen, spm.MaSach, s.TenSach,COUNT(spm.MaSach) SoLuong, NgayMuon, NgayHenTra
	from PhieuMuon pm join SinhVien sv on pm.MaSV = sv.MaSV
	join SachPhieuMuon spm on spm.MaPhieuMuon = pm.MaPhieuMuon
	join Sach s on spm.MaSach = s.MaSach
	where s.MaSach = @MaSach
	GROUP BY pm.MaPhieuMuon, pm.MaSV, sv.HoTen, spm.MaSach, s.TenSach,SoLuong, NgayMuon, NgayHenTra
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_MaSVPM]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_MaSVPM](@MaSV varchar(50)) 
AS BEGIN 
 	Select spm.MaPhieuMuon, pm.MaSV, sv.HoTen, spm.MaSach, s.TenSach,COUNT(spm.MaSach) SoLuong, NgayMuon, NgayHenTra
	from PhieuMuon pm join SinhVien sv on pm.MaSV = sv.MaSV
	join SachPhieuMuon spm on spm.MaPhieuMuon = pm.MaPhieuMuon
	join Sach s on spm.MaSach = s.MaSach
	where sv.MaSV = @MaSV
	GROUP BY spm.MaPhieuMuon, pm.MaSV, sv.HoTen, spm.MaSach, s.TenSach,SoLuong, NgayMuon, NgayHenTra
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_MaTheLoaiSach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_MaTheLoaiSach](@MaTheLoai varchar(10)) 
AS BEGIN 
 	Select Tls.MaTheLoai, TenTheLoai, ViTri, MaSach, TenSach, SoLuong
	from TheLoaiSach tls join Sach s on tls.MaTheLoai = s.MaTheLoai 
	where tls.MaTheLoai = @MaTheLoai
	order by SoLuong desc
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_NgaySachGiam]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_NgaySachGiam](@ngayBD varchar(50), @ngayKT varchar(50))
AS BEGIN 
 	Select * from Sach
	where ngaynhap >= @ngayBD and ngaynhap <= @ngayKT
	order by SoLuong desc
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_NgaySachTang]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_NgaySachTang](@ngayBD varchar(50), @ngayKT varchar(50))
AS BEGIN 
 	Select * from Sach
	where ngaynhap >= @ngayBD and ngaynhap <= @ngayKT
	order by SoLuong asc
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_PhieuMuon]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_PhieuMuon]
AS BEGIN 
 	Select spm.MaPhieuMuon, pm.MaSV, sv.HoTen, s.MaSach, s.TenSach,COUNT(spm.MaSach) SoLuong, NgayMuon, NgayHenTra
	from SachPhieuMuon spm join PhieuMuon pm on pm.MaPhieuMuon = spm.MaPhieuMuon
	join Sach s on s.MaSach = spm.MaSach
	join SinhVien sv on pm.MaSV = sv.MaSV
	GROUP BY  spm.MaPhieuMuon, pm.MaSV, sv.HoTen, s.MaSach, s.TenSach,SoLuong, NgayMuon, NgayHenTra
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_SachMuonItNhat]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SachMuonItNhat]
AS BEGIN 
 	Select  spm.MaSach, s.TenSach, COUNT(spm.MaSach) SachMuonItNhat
	from SachPhieuMuon spm
	join Sach s on spm.MaSach = s.MaSach
	group by spm.MaSach,  s.TenSach
	order by SachMuonItNhat asc
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_SachMuonItNhatSVUI]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SachMuonItNhatSVUI]
AS BEGIN 
 	Select  spm.MaSach, s.TenSach, COUNT(spm.MaPhieuMuon) SachMuonItNhatSVUI
	from PhieuMuon pm
	join SachPhieuMuon spm on spm.MaPhieuMuon = pm.MaPhieuMuon
	join Sach s on spm.MaSach = s.MaSach
	group by spm.MaSach,  s.TenSach
	order by SachMuonItNhatSVUI asc
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_SachMuonNhieuNhat]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SachMuonNhieuNhat]
AS BEGIN 
 	Select  spm.MaSach, s.TenSach, COUNT(spm.MaSach) SachMuonNhieuNhat
	from SachPhieuMuon spm
	join Sach s on spm.MaSach = s.MaSach
	group by spm.MaSach,  s.TenSach
	order by SachMuonNhieuNhat desc
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_SachMuonNhieuNhatSVUI]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SachMuonNhieuNhatSVUI]
AS BEGIN 
 	Select  spm.MaSach, s.TenSach, COUNT(spm.MaPhieuMuon) SachMuonNhieuNhatSVUI
	from PhieuMuon pm
	join SachPhieuMuon spm on spm.MaPhieuMuon = pm.MaPhieuMuon
	join Sach s on spm.MaSach = s.MaSach
	group by spm.MaSach,  s.TenSach
	order by SachMuonNhieuNhatSVUI desc
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_soSachSVPM]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[sp_soSachSVPM](@MaSV varchar(50)) 
AS BEGIN 
 	Select COUNT(spm.MaSach) soSachSVPM, MaSV from PhieuMuon PM
	join SachPhieuMuon spm on spm.MaPhieuMuon = pm.MaPhieuMuon
	where pm.MaSV = @MaSV
	group by MaSV
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_soSachTLS]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROC [dbo].[sp_soSachTLS](@MaTheLoai varchar(10)) 
AS BEGIN 
 	Select SUM(SoLuong) tongSachTLS
	from Sach
	where MaTheLoai = @MaTheLoai
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_soSachViTriTLS]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROC [dbo].[sp_soSachViTriTLS](@ViTri nvarchar(50)) 
AS BEGIN 
 	Select SUM(SoLuong) tongSachViTriTLS
from TheLoaiSach tls join Sach s on tls.MaTheLoai = s.MaTheLoai 
	where ViTri = @ViTri
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_soSVMuonSachPM]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_soSVMuonSachPM](@MaSach varchar(10)) 
AS BEGIN 
 	Select COUNT(MaSV) tongSVMuonSach
	from PhieuMuon pm
	join SachPhieuMuon spm on spm.MaPhieuMuon = pm.MaPhieuMuon
	where MaSach = @MaSach
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_soTheLoaiTLS]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROC [dbo].[sp_soTheLoaiTLS](@MaTheLoai varchar(10)) 
AS BEGIN 
 	Select COUNT(tls.MaTheLoai) soTheLoaiTLS
from TheLoaiSach tls join Sach s on tls.MaTheLoai = s.MaTheLoai 
	where tls.MaTheLoai = @MaTheLoai
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_soTheLoaiViTriTLS]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_soTheLoaiViTriTLS](@ViTri nvarchar(50)) 
AS BEGIN 
 	Select count(MaTheLoai) soTheLoaiViTriTLS
	from TheLoaiSach 
	where ViTri = @ViTri
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaPhieu]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored 15-2
CREATE PROC [dbo].[sp_SuaPhieu](
	@MaPhieuMuon varchar(10),
	@MaSV varchar(10),
	@MaSach varchar(10),
	@NgayMuon date,
	@NgayHenTra date)
AS BEGIN
	DELETE SachPhieuMuon WHERE MaPhieuMuon = @MaPhieuMuon
	INSERT SachPhieuMuon VALUES(@MaPhieuMuon,@MaSV)
	UPDATE PhieuMuon SET MaSV = @MaSV, NgayMuon = @NgayMuon ,NgayHenTra = @NgayHenTra  WHERE MaPhieuMuon = @MaPhieuMuon
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SVChuaMuonSach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_SVChuaMuonSach]
AS BEGIN 
 	Select sv.MaSV, Password, HoTen, NgaySinh, GioiTinh, DiaChi, SDT, Email
	from SinhVien sv full join PhieuMuon pm on sv.MaSV = pm.MaSV
	where pm.MaSV IS NULL
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_SVConHanTraSach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_SVConHanTraSach]
AS BEGIN 
 	Select pm.MaPhieuMuon, pm.MaSV, sv.HoTen, spm.MaSach, s.TenSach, COUNT(spm.MaPhieuMuon) SoLuong, NgayMuon, NgayHenTra
	from PhieuMuon pm join SinhVien sv on pm.MaSV = sv.MaSV
	join SachPhieuMuon spm on spm.MaPhieuMuon = pm.MaPhieuMuon
	join Sach s on spm.MaSach = s.MaSach
	where NgayHenTra > (select GETDATE())
	GROUP BY pm.MaPhieuMuon, pm.MaSV, sv.HoTen, spm.MaSach, s.TenSach,SoLuong, NgayMuon, NgayHenTra
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_SVDaMuonSach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_SVDaMuonSach]
AS BEGIN 
 	Select DISTINCT pm.MaSV, Password, HoTen, NgaySinh, GioiTinh, DiaChi, SDT, Email
	from SinhVien sv join PhieuMuon pm on sv.MaSV = pm.MaSV
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_SVMuonItSachNhat]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SVMuonItSachNhat]
AS BEGIN 
 	Select  pm.MaSV, sv.HoTen, COUNT(spm.MaSach) SVMuonItSachNhat
	from PhieuMuon pm join SinhVien sv on pm.MaSV = sv.MaSV
	join SachPhieuMuon spm on spm.MaPhieuMuon = pm.MaPhieuMuon
	join Sach s on spm.MaSach = s.MaSach
	group by pm.MaSV, sv.HoTen
	order by SVMuonItSachNhat asc
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_SVMuonNhieuSachNhat]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SVMuonNhieuSachNhat]
AS BEGIN 
 	Select  pm.MaSV, sv.HoTen, COUNT(spm.MaSach) SVMuonNhieuSachNhat
	from PhieuMuon pm join SinhVien sv on pm.MaSV = sv.MaSV
	join SachPhieuMuon spm on spm.MaPhieuMuon = pm.MaPhieuMuon
	join Sach s on spm.MaSach = s.MaSach
	group by pm.MaSV, sv.HoTen
	order by SVMuonNhieuSachNhat desc
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_SVQuaHanTraSach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_SVQuaHanTraSach]
AS BEGIN 
 	Select pm.MaPhieuMuon, pm.MaSV, sv.HoTen, spm.MaSach, s.TenSach, COUNT(spm.MaPhieuMuon) SoLuong, NgayMuon, NgayHenTra
	from PhieuMuon pm join SinhVien sv on pm.MaSV = sv.MaSV
	join SachPhieuMuon spm on spm.MaPhieuMuon = pm.MaPhieuMuon
	join Sach s on spm.MaSach = s.MaSach
	where NgayHenTra < (select GETDATE())
	GROUP BY pm.MaPhieuMuon, pm.MaSV, sv.HoTen, spm.MaSach, s.TenSach,SoLuong, NgayMuon, NgayHenTra
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_TaoPhieu]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_TaoPhieu](
	@MaPhieuMuon varchar(10),
	@MaSV varchar(10),
	@NgayMuon date,
	@NgayHenTra date)
AS BEGIN
	INSERT INTO PhieuMuon(MaPhieuMuon,MaSV,NgayMuon,NgayHenTra) 
	VALUES (@MaPhieuMuon,@MaSV,@NgayMuon,@NgayHenTra)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TheLoaiSach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_TheLoaiSach]
AS BEGIN 
 	Select Tls.MaTheLoai, TenTheLoai, ViTri, MaSach, TenSach, SoLuong
	from TheLoaiSach tls join Sach s on tls.MaTheLoai = s.MaTheLoai 
	order by SoLuong desc
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_tongGioiTinhSV]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_tongGioiTinhSV](@GioiTinh bit)
AS BEGIN 
 	Select COUNT(GioiTinh) tongGioiTinhSV
	from SinhVien where GioiTinh = @GioiTinh
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_TongPM]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_TongPM]
AS BEGIN 
 	Select COUNT(MaPhieuMuon) TongPM
	from PhieuMuon
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_TongSach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_TongSach]
AS BEGIN 
 	Select sum(SoLuong) TongSach from Sach
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_TongSachNgaySach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_TongSachNgaySach](@ngayBD varchar(50), @ngayKT varchar(50))
AS BEGIN 
 	Select sum(SoLuong) TongNgaySach
	from Sach
	where ngaynhap >= @ngayBD and ngaynhap <= @ngayKT
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_TongSachSVMuon]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_TongSachSVMuon]
AS BEGIN 
 	Select COUNT(spm.MaSach) TongSachSVMuon from PhieuMuon pm
	join SachPhieuMuon spm on spm.MaPhieuMuon = pm.MaPhieuMuon
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_TongSoPhieuConHanTraSach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_TongSoPhieuConHanTraSach]
AS BEGIN 
 	Select COUNT(MaPhieuMuon) TongSoPhieuConHanTraSach
	from PhieuMuon
	where NgayHenTra > (select GETDATE())
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_TongSoPhieuQuaHanTraSach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_TongSoPhieuQuaHanTraSach]
AS BEGIN 
 	Select COUNT(MaPhieuMuon) TongSoPhieuQuaHanTraSach
	from PhieuMuon
	where NgayHenTra < (select GETDATE())
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_tongSV]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_tongSV]
AS BEGIN 
 	Select COUNT(MaSV) tongSV
	from SinhVien 
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_TongSVChuaMuonSach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_TongSVChuaMuonSach]
AS BEGIN 
 	Select COUNT(sv.MaSV) TongSVChuaMuonSach
	from SinhVien sv full join PhieuMuon pm on sv.MaSV = pm.MaSV
	where pm.MaSV IS NULL
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_TongSVConHanTraSach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_TongSVConHanTraSach]
AS BEGIN 
 	Select COUNT(DISTINCT MaSV) TongSVConHanTraSach 
	from PhieuMuon
	where NgayHenTra > (select GETDATE())
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_TongSVDaMuonSach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_TongSVDaMuonSach]
AS BEGIN 
 	Select COUNT(DISTINCT pm.MaSV) TongSVDaMuonSach
	from SinhVien sv join PhieuMuon pm on sv.MaSV = pm.MaSV
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_TongSVQuaHanTraSach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_TongSVQuaHanTraSach]
AS BEGIN 
 	Select COUNT(DISTINCT MaSV) TongSVQuaHanTraSach
	from PhieuMuon
	where NgayHenTra < (select GETDATE())
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_TongTheLoaiTLS]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[sp_TongTheLoaiTLS]
AS BEGIN 
 	Select count(MaTheLoai) TongTheLoaiTLS from TheLoaiSach
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_ViTriTheLoaiSach]    Script Date: 20/07/2021 2:01:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_ViTriTheLoaiSach](@ViTri nvarchar(50)) 
AS BEGIN 
 	Select Tls.MaTheLoai, TenTheLoai, ViTri, MaSach, TenSach, SoLuong
	from TheLoaiSach tls join Sach s on tls.MaTheLoai = s.MaTheLoai 
	where ViTri = @ViTri
	order by SoLuong desc
END 
GO
USE [master]
GO
ALTER DATABASE [QLTV2] SET  READ_WRITE 
GO
