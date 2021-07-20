use master 
go
drop database QLTV2
go
create database QLTV2
go
use QLTV2
Create table Admin(
	Username varchar(50) primary key,
	Password varchar(50),
	Ten nvarchar(50)
)

Create table NXB(
	MaNXB varchar(10) primary key,
	Ten nvarchar(50),
	DiaChi nvarchar(30),
	Email nvarchar(50)
)
Create table TacGia(
	MaTG varchar(10) primary key,
	Ten nvarchar(30),
	NgaySinh date,
	DiaChi nvarchar(50),
	Email nvarchar(20)
	
)
Create table ViPham(
	MaViPham varchar(10) primary key ,
	MaSV varchar(10),
	Ten nvarchar(30)

)
Create table Lop(
	MaLop varchar(10) primary key ,
	Ten varchar(30)
)
Create table SinhVien(
	MaSV varchar(10) primary key,
	Password varchar(50),
	MaLop varchar(10),
	HoTen nvarchar(50),
	NgaySinh date,
	GioiTinh bit,
	DiaChi nvarchar(50),
	SDT varchar(11),
	Email nvarchar(50)
)
Create table TheLoaiSach(
	MaTheLoai varchar(10) primary key,
	TenTheLoai nvarchar(50),
	ViTri nvarchar(50)
)

Create table PhieuMuon(
	MaPhieuMuon varchar(10) primary key,
	MaSV varchar(10),
	MaSach varchar(10),
	SoLuong int,
	NgayMuon date DEFAULT GETDATE(),
	NgayHenTra date DEFAULT (GETDATE() + 10)
)
Create table SachPhieuMuon(
	Ma int primary key ,
	MaSach varchar(10),
	MaPhieuMuon varchar(10)
)


Create table SachTG(
	Ma int primary key,
	MaTG varchar(10),
	MaSach varchar(10),
)
Create table Sach(
	MaSach varchar(10) primary key,
	TenSach nvarchar(50),
	MaTheLoai varchar(10),
	TacGia nvarchar(50),
	SoLuong int,
	MaNXB varchar(10) ,
	NgayNhap date,
	NDTT nvarchar(100),
	Hinh nvarchar(50)
)


alter table SinhVien add CONSTRAINT FK_PM_MaLop FOREIGN KEY (MaLop) REFERENCES Lop (MaLop)
alter table ViPham add CONSTRAINT FK_PM_MaSV FOREIGN KEY (MaSV) REFERENCES SinhVien (MaSV)
alter table PhieuMuon add CONSTRAINT FK_PM_MaSvPhieuMuon FOREIGN KEY (MaSV) REFERENCES SinhVien (MaSV)
alter table Sach add CONSTRAINT FK_Sach_TheLoai FOREIGN KEY (MaTheLoai) REFERENCES TheLoaiSach (MaTheLoai)
alter table PhieuMuon add CONSTRAINT FK_PM_MaSach FOREIGN KEY (MaSach) REFERENCES Sach (MaSach)
alter table SachPhieuMuon add CONSTRAINT FK_PM_MaSachMuon FOREIGN KEY (MaSach) REFERENCES Sach (MaSach)
alter table SachPhieuMuon add CONSTRAINT FK_PM_MaPhieuMuon FOREIGN KEY (MaPhieuMuon) REFERENCES PhieuMuon (MaPhieuMuon)
alter table SachTG add CONSTRAINT FK_PM_MaTG FOREIGN KEY (MaTG) REFERENCES TacGia (MaTG)
alter table SachTG add CONSTRAINT FK_PM_MaSachTG FOREIGN KEY (MaSach) REFERENCES Sach (MaSach)
alter table Sach add CONSTRAINT FK_PM_MaSachNXB FOREIGN KEY (MaNXB) REFERENCES NXB (MaNXB)


-- Insert dữ liệu
-- Bảng Admin
Insert into Admin values('admin','admin','ADMIN')

--Bang NXB
Insert into NXB values ('NXB01',N'Mat Trang',N'Quận 1',N'Qasdb89@fpt.edu.vn')
Insert into NXB values ('NXB08',N'Sao Hoa',N'Quận 2',N'HdaKim@yahoo.com.vn')
Insert into NXB values ('NXB07',N'Kim Tinh',N'Quận 3',N'asdasda@yahoo.com.vn')
Insert into NXB values ('NXB06',N'Moc Tinh',N'Quận 4',N'vanasdphu@yahoo.com.vn')
Insert into NXB values ('NXB02',N'Hoa Ngoc',N'Quận 6',N'kimasdhoa@yahoo.com.vn')
Insert into NXB values ('NXB03',N'Thien Vuong',N'Quận Tân Bình',N'nguyenxuan@gmail.com')
Insert into NXB values ('NXB04',N'Bac Dau',N'Quận 12',N'asdsdasddd@gmail.com')
Insert into NXB values ('NXB05',N'Diem Vuong',N'Quận 9',N'suswwan0175@gmail.com')
Insert into NXB values ('NXB09',N'Persider',N'Quận Thủ Đức',N'viwwwenbui@gmail.com')
Insert into NXB values ('NXB10',N'GUT CHOP',N'Quận 5',N'xuanetbui@gmail.com')

-- Bang Tac Gia
Insert into TacGia values ('TG01',N'Nam Cao','2/22/1970',N'Quận 1',N'Quyps9@fpt.edu.vn')
Insert into TacGia values ('TG03',N'To Huu','2/2/1890',N'Quận 2',N'HaKim@yahoo.com.vn')
Insert into TacGia values ('TG04',N'Chau Tinh Tri','5/22/1879',N'Quận 3',N'huntran@yahoo.com.vn')
Insert into TacGia values ('TG05',N'Ton Ngo Khong','6/25/1879',N'Quận 4',N'vanphu@yahoo.com.vn')
Insert into TacGia values ('TG08',N'Bùi Kim Hoa','1/12/1879',N'Quận 6',N'kimhoa@yahoo.com.vn')
Insert into TacGia values ('TG06',N'Nguyễn Thị Chat','2/26/1879',N'Quận Tân Bình',N'nguyenxuan@gmail.com')
Insert into TacGia values ('TG02',N'Trương Mỹ Tho','4/15/1879',N'Quận 12',N'chautruong@gmail.com')
Insert into TacGia values ('TG07',N'Phan Trung Kien','7/30/1879',N'Quận 9',N'susan0175@gmail.com')
Insert into TacGia values ('TG09',N'La Van Viện','9/2/1879',N'Quận Thủ Đức',N'vienbui@gmail.com')
Insert into TacGia values ('TG10',N'Bùi Viết Ngo','3/28/1879',N'Quận 5',N'xuanvibui@gmail.com')



--Bang lop
Insert into Lop values ('ML01','C1903I')
Insert into Lop values ('ML02','C1906I')
Insert into Lop values ('ML03','C1904I')
Insert into Lop values ('ML04','C1908I')
Insert into Lop values ('ML05','C1902I')
Insert into Lop values ('ML06','C1907I')
Insert into Lop values ('ML07','C1908I')
Insert into Lop values ('ML08','C1900I')
Insert into Lop values ('ML09','C1923I')
Insert into Lop values ('ML10','C1922I')

-- Bảng SinhVien
Insert into SinhVien values ('SV01','123','ML01',N'Đỗ Bùi Quý','2/22/2000',0,N'Quận 1','0933662633','Quydbps00389@fpt.edu.vn')
Insert into SinhVien values ('SV02','123','ML02',N'Bùi Thị Kim Hà','2/2/2000',1,N'Quận 2','0930000000','HaKim@yahoo.com.vn')
Insert into SinhVien values ('SV03','123','ML10',N'Đỗ Huyền Trân','5/22/2000',1,N'Quận 3','0931111111','huyentran@yahoo.com.vn')
Insert into SinhVien values ('SV04','123','ML09',N'Đỗ Văn Phú','6/25/2000',0,N'Quận 4','0932222222','vanphu@yahoo.com.vn')
Insert into SinhVien values ('SV05','123','ML08',N'Bùi Thị Kim Hoa','1/12/2000',0,N'Quận 6','0933334444','kimhoa@yahoo.com.vn')
Insert into SinhVien values ('SV06','123','ML07',N'Nguyễn Thị Xuân','2/29/2000',0,N'Quận Tân Bình','0932156482','nguyenxuan@gmail.com')
Insert into SinhVien values ('SV07','123','ML06',N'Trương Mỹ Châu','4/15/2000',0,N'Quận 12','0935811169','chautruong@gmail.com')
Insert into SinhVien values ('SV08','123','ML03',N'Phan Tấn Trung','7/30/2000',0,N'Quận 9','0969169169','susan0175@gmail.com')
Insert into SinhVien values ('SV09','123','ML05',N'Bùi Viện','9/2/2000',0,N'Quận Thủ Đức','0938149159','vienbui@gmail.com')
Insert into SinhVien values ('SV10','123','ML04',N'Bùi Xuân Viết','3/28/2000',0,N'Quận 5','0989189189','xuanvietbui@gmail.com')

-- Bảng Thể Loại Sách
Insert into TheLoaiSach values ('MTL1',N'Truyện Tranh',N'Tủ số 1')
Insert into TheLoaiSach values ('MTL2',N'Ẩm thực',N'Tủ số 2')
Insert into TheLoaiSach values ('MTL3',N'Cổ tích',N'Tủ số 3')
Insert into TheLoaiSach values ('MTL4',N'Công nghệ thông tin',N'Tủ số 4')
Insert into TheLoaiSach values ('MTL5',N'Kỹ năng sống',N'Tủ số 5')
Insert into TheLoaiSach values ('MTL6',N'Kinh Tế',N'Tủ số 5')
Insert into TheLoaiSach values ('MTL7',N'Trẻ Em',N'Tủ số 6')
Insert into TheLoaiSach values ('MTL8',N'Trinh Thám',N'Tủ số 8')
Insert into TheLoaiSach values ('MTL9',N'Kinh dị',N'Tủ số 8')
Insert into TheLoaiSach values ('MTL10',N'Khám Phá Thế Giới',N'Tủ số 7')

-- Bảng Sách
Insert into Sach values ('MS1',N'Kingdom Vương giả thiên hạ','MTL1','Hara Yasuhisa',3,'NXB01','02/15/2019',N'abc','ms1.jpg')
Insert into Sach values ('MS2',N'Những món cơm ngon','MTL2',N'Tiêu Quỳnh',1,'NXB02','02/20/2019',N'abc','ms2.jpg')	
Insert into Sach values ('MS3',N'Truyện kể tây tạng','MTL3',N'Nhiều tác giả',1,'NXB03','02/22/2019',N'abc','ms3.jpg')
Insert into Sach values ('MS4',N'Giải thuật và lập trình','MTL4',N'Lê Minh Hoàng',7,'NXB04','02/24/2019',N'abc','ms4.jpg')
Insert into Sach values ('MS5',N'Biết hài lòng','MTL5','Leo Babauta',4,'NXB05','02/27/2019',N'abc','ms5.png')
Insert into Sach values ('MS6',N'Điểm mù','MTL6','Max H',2,'NXB01','02/27/2019',N'abc','ms6.jpg')
Insert into Sach values ('MS7',N'Kinh Tế Học','MTL6',N'Nhiều Tác Giả',6,'NXB07','02/27/2019',N'abc','ms7.jpg')
Insert into Sach values ('MS8',N'Đắc Nhân Tâm','MTL5','Dale Carnegie',6,'NXB08','02/27/2019',N'abc','ms8.jpg')
Insert into Sach values ('MS9',N'SherLock Holmes','MTL9','Arthur Conan Doyle',6,'NXB01','02/27/2019',N'abc','ms9.jpg')
Insert into Sach values ('MS10',N'Khám Phá Thế Giới Diệu Kì','MTL10','Marfé Ferguson Delano',7,'NXB06','02/27/2019',N'abc','ms10.jpg')

---- Bảng Phiếu Mượn
Insert into PhieuMuon  values ('PM01','SV01','MS1','1','12/1/2019','12/11/2019')
Insert into PhieuMuon  values ('PM06','SV02','MS2','2','12/5/2019','12/15/2019')
Insert into PhieuMuon  values ('PM07','SV03','MS3','1','12/6/2019','12/16/2019')
Insert into PhieuMuon  values ('PM05','SV04','MS4','1','12/11/2019','12/21/2019')
Insert into PhieuMuon  values ('PM03','SV05','MS5','2','12/14/2019','12/24/2019')
Insert into PhieuMuon  values ('PM04','SV06','MS6','1','12/15/2019','12/25/2019')
Insert into PhieuMuon  values ('PM02','SV07','MS7','4','12/12/2019','12/22/2019')
Insert into PhieuMuon  values ('PM08','SV08','MS8','2','12/2/2019','12/12/2019')
Insert into PhieuMuon  values ('PM09','SV09','MS9','3','12/8/2019','12/18/2019')
Insert into PhieuMuon  values ('PM10','SV10','MS10','5','12/10/2019','12/20/2019')




--Bang Vi Pham
Insert into ViPham values ('VP01','SV01',N'hen khong tra')
Insert into ViPham values ('VP02','SV04',N'co giu mat dung tim')	
Insert into ViPham values ('VP03','SV02',N'Khong cho fb')
Insert into ViPham values ('VP04','SV06',N'Xin so khong cho')
Insert into ViPham values ('VP05','SV03',N'Lam rach sach')
Insert into ViPham values ('VP06','SV02',N'Mat nhieu mun')
Insert into ViPham values ('VP07','SV05',N'Deo co nguoi yeu')
Insert into ViPham values ('VP08','SV06',N'deo tam')
Insert into ViPham values ('VP09','SV07',N'o ban')
Insert into ViPham values ('VP10','SV01',N'met')



Select *from NXB
Select * from Lop
Select * from ViPham
Select *from TacGia
Select * from SinhVien
Select * from Sach
Select * from PhieuMuon
Select * from TheLoaiSach
Select * from Sach where TenSach like '%D%'


-- Stored 1
go

CREATE PROC sp_MaTheLoaiSach(@MaTheLoai varchar(10)) 
AS BEGIN 
 	Select Tls.MaTheLoai, TenTheLoai, ViTri, MaSach, TenSach, SoLuong
	from TheLoaiSach tls join Sach s on tls.MaTheLoai = s.MaTheLoai 
	where tls.MaTheLoai = @MaTheLoai
	order by SoLuong desc
END 
go

exec sp_MaTheLoaiSach 'MTL5'

-- Stored 2
go

CREATE PROC sp_TheLoaiSach
AS BEGIN 
 	Select Tls.MaTheLoai, TenTheLoai, ViTri, MaSach, TenSach, SoLuong
	from TheLoaiSach tls join Sach s on tls.MaTheLoai = s.MaTheLoai 
	order by SoLuong desc
END 
go

exec sp_TheLoaiSach 
-- Stored 3
go

CREATE PROC sp_ViTriTheLoaiSach(@ViTri nvarchar(50)) 
AS BEGIN 
 	Select Tls.MaTheLoai, TenTheLoai, ViTri, MaSach, TenSach, SoLuong
	from TheLoaiSach tls join Sach s on tls.MaTheLoai = s.MaTheLoai 
	where ViTri = @ViTri
	order by SoLuong desc
END 
go

exec sp_ViTriTheLoaiSach  'Tu so 2'
	


Select SUM(SoLuong) 
	from Sach
	where MaTheLoai = 'MTL5'
--Stored 4
go

	CREATE PROC sp_soSachTLS(@MaTheLoai varchar(10)) 
AS BEGIN 
 	Select SUM(SoLuong) tongSachTLS
	from Sach
	where MaTheLoai = @MaTheLoai
END 
go
exec sp_soSachTLS  'MTL6'
--Stored 5	
go

	CREATE PROC sp_soSachViTriTLS(@ViTri nvarchar(50)) 
AS BEGIN 
 	Select SUM(SoLuong) tongSachViTriTLS
from TheLoaiSach tls join Sach s on tls.MaTheLoai = s.MaTheLoai 
	where ViTri = @ViTri
END 
go
exec sp_soSachViTriTLS  'Tu so 5'
--Stored 6
go

	CREATE PROC sp_soTheLoaiTLS(@MaTheLoai varchar(10)) 
AS BEGIN 
 	Select COUNT(tls.MaTheLoai) soTheLoaiTLS
from TheLoaiSach tls join Sach s on tls.MaTheLoai = s.MaTheLoai 
	where tls.MaTheLoai = @MaTheLoai
END 
go
exec sp_soTheLoaiTLS  'MTL6'
--Stored 7
go
	CREATE PROC sp_soTheLoaiViTriTLS(@ViTri nvarchar(50)) 
AS BEGIN 
 	Select count(MaTheLoai) soTheLoaiViTriTLS
	from TheLoaiSach 
	where ViTri = @ViTri
END 
go
exec sp_soTheLoaiViTriTLS  'Tu so 5'
--Stored 8
go
	CREATE PROC sp_TongTheLoaiTLS
AS BEGIN 
 	Select count(MaTheLoai) TongTheLoaiTLS from TheLoaiSach
END 
go
exec sp_TongTheLoaiTLS
--Stored 8
go
	CREATE PROC sp_GioiTinhSV(@GioiTinh bit)
AS BEGIN 
 	Select * from SinhVien where GioiTinh = @GioiTinh
END 
go
exec sp_GioiTinhSV 0
--Stored 9
go
	CREATE PROC sp_tongGioiTinhSV(@GioiTinh bit)
AS BEGIN 
 	Select COUNT(GioiTinh) tongGioiTinhSV
	from SinhVien where GioiTinh = @GioiTinh
END 
go
exec sp_tongGioiTinhSV 1
--Stored 10
go
	CREATE PROC sp_tongSV
AS BEGIN 
 	Select COUNT(MaSV) tongSV
	from SinhVien 
END 
go
exec sp_tongSV
--Stored 11
go
	CREATE PROC sp_NgaySachGiam(@ngayBD varchar(50), @ngayKT varchar(50))
AS BEGIN 
 	Select * from Sach
	where ngaynhap >= @ngayBD and ngaynhap <= @ngayKT
	order by SoLuong desc
END 
go
exec sp_NgaySachGiam '2019-02-15', '2019-02-22'
--Stored 12
go
	CREATE PROC sp_NgaySachTang(@ngayBD varchar(50), @ngayKT varchar(50))
AS BEGIN 
 	Select * from Sach
	where ngaynhap >= @ngayBD and ngaynhap <= @ngayKT
	order by SoLuong asc
END 
go
exec sp_NgaySachTang '2019-02-15', '2019-02-22'
--Stored 13
go
	CREATE PROC sp_TongSachNgaySach(@ngayBD varchar(50), @ngayKT varchar(50))
AS BEGIN 
 	Select sum(SoLuong) TongNgaySach
	from Sach
	where ngaynhap >= @ngayBD and ngaynhap <= @ngayKT
END 
go
exec sp_TongSachNgaySach '2019-02-15', '2019-02-22'
--Stored 14
go
	CREATE PROC sp_TongSach
AS BEGIN 
 	Select sum(SoLuong) TongSach from Sach
END 
go
exec sp_TongSach
--Stored 15
go
	CREATE PROC sp_PhieuMuon
AS BEGIN 
 	Select MaPhieuMuon, pm.MaSV, sv.HoTen, pm.MaSach, s.TenSach, pm.SoLuong, NgayMuon, NgayHenTra
	from PhieuMuon pm join SinhVien sv on pm.MaSV = sv.MaSV
	join Sach s on pm.MaSach = s.MaSach
END 
go
exec sp_PhieuMuon
-- Stored 16
go

CREATE PROC sp_MaSVPM(@MaSV varchar(50)) 
AS BEGIN 
 	Select MaPhieuMuon, pm.MaSV, sv.HoTen, pm.MaSach, s.TenSach, pm.SoLuong, NgayMuon, NgayHenTra
	from PhieuMuon pm join SinhVien sv on pm.MaSV = sv.MaSV
	join Sach s on pm.MaSach = s.MaSach
	where sv.MaSV = @MaSV
END 
go
exec sp_MaSVPM 'PS001'
-- Stored 16-1
go

CREATE PROC sp_MaPhieuMuon(@MaPhieuMuon varchar(50)) 
AS BEGIN 
 	Select MaPhieuMuon,pm.MaSV,pm.MaSach, pm.SoLuong, NgayMuon, NgayHenTra
	from PhieuMuon pm join Sach s on pm.MaSV = s.MaSach
	join SinhVien sv on pm.MaSV = sv.MaSV
	where pm.MaPhieuMuon = @MaPhieuMuon
END 
go
exec sp_MaPhieuMuon 'PM02'
-- Stored 17
go


CREATE PROC sp_soSachSVPM(@MaSV varchar(50)) 
AS BEGIN 
 	Select sum(SoLuong) soSachSVPM, MaSV from PhieuMuon
	where MaSV = @MaSV
	group by MaSV
END 
go
exec sp_soSachSVPM 'PS001'
-- Stored 18
go

CREATE PROC sp_MaSachPM(@MaSach varchar(10)) 
AS BEGIN 
 	Select MaPhieuMuon, pm.MaSV, sv.HoTen, pm.MaSach, s.TenSach, pm.SoLuong, NgayMuon, NgayHenTra
	from PhieuMuon pm join SinhVien sv on pm.MaSV = sv.MaSV
	join Sach s on pm.MaSach = s.MaSach
	where s.MaSach = @MaSach
END 
go
exec sp_MaSachPM 'MS5'
-- Stored 19
go
CREATE PROC sp_soSVMuonSachPM(@MaSach varchar(10)) 
AS BEGIN 
 	Select COUNT(MaSV) tongSVMuonSach
	from PhieuMuon
	where MaSach = @MaSach
END 
go
exec sp_soSVMuonSachPM 'MS10'
-- Stored 20
go
	CREATE PROC sp_TongSachSVMuon
AS BEGIN 
 	Select sum(SoLuong) TongSachSVMuon from PhieuMuon
END 
go
exec sp_TongSachSVMuon
-- Stored 21
go
CREATE PROC sp_SVMuonNhieuSachNhat
AS BEGIN 
 	Select  pm.MaSV, sv.HoTen, sum(pm.SoLuong) SVMuonNhieuSachNhat
	from PhieuMuon pm join SinhVien sv on pm.MaSV = sv.MaSV
	join Sach s on pm.MaSach = s.MaSach
	group by pm.MaSV, sv.HoTen
	order by sum(pm.SoLuong) desc
END 
go
exec sp_SVMuonNhieuSachNhat
-- Stored 22
go
CREATE PROC sp_SVMuonItSachNhat
AS BEGIN 
 	Select  pm.MaSV, sv.HoTen, sum(pm.SoLuong) SVMuonItSachNhat
	from PhieuMuon pm join SinhVien sv on pm.MaSV = sv.MaSV
	join Sach s on pm.MaSach = s.MaSach
	group by pm.MaSV, sv.HoTen
	order by sum(pm.SoLuong) asc
END 
go
exec sp_SVMuonItSachNhat
-- Stored 23
go
CREATE PROC sp_SachMuonNhieuNhat
AS BEGIN 
 	Select  pm.MaSach, s.TenSach, sum(pm.SoLuong) SachMuonNhieuNhat
	from PhieuMuon pm join Sach s on pm.MaSach = s.MaSach
	group by pm.MaSach,  s.TenSach
	order by sum(pm.SoLuong) desc
END 
go
exec sp_SachMuonNhieuNhat
-- Stored 24
go
CREATE PROC sp_SachMuonItNhat
AS BEGIN 
 	Select  pm.MaSach, s.TenSach, sum(pm.SoLuong) SachMuonItNhat
	from PhieuMuon pm join Sach s on pm.MaSach = s.MaSach
	group by pm.MaSach,  s.TenSach
	order by sum(pm.SoLuong) asc
END 
go
exec sp_SachMuonItNhat
-- Stored 25
go
	CREATE PROC sp_SVConHanTraSach
AS BEGIN 
 	Select MaPhieuMuon, pm.MaSV, sv.HoTen, pm.MaSach, s.TenSach, pm.SoLuong, NgayMuon, NgayHenTra
	from PhieuMuon pm join SinhVien sv on pm.MaSV = sv.MaSV
	join Sach s on pm.MaSach = s.MaSach
	where NgayHenTra > (select GETDATE())
END 
go
exec sp_SVConHanTraSach
-- Stored 26
go
	CREATE PROC sp_SVQuaHanTraSach
AS BEGIN 
 	Select MaPhieuMuon, pm.MaSV, sv.HoTen, pm.MaSach, s.TenSach, pm.SoLuong, NgayMuon, NgayHenTra
	from PhieuMuon pm join SinhVien sv on pm.MaSV = sv.MaSV
	join Sach s on pm.MaSach = s.MaSach
	where NgayHenTra < (select GETDATE())
END 
go
exec sp_SVQuaHanTraSach
-- Stored 27
go
	CREATE PROC sp_TongSVConHanTraSach
AS BEGIN 
 	Select COUNT(DISTINCT MaSV) TongSVConHanTraSach 
	from PhieuMuon
	where NgayHenTra > (select GETDATE())
END 
go
exec sp_TongSVConHanTraSach
-- Stored 28
go
	CREATE PROC sp_TongSVQuaHanTraSach
AS BEGIN 
 	Select COUNT(DISTINCT MaSV) TongSVQuaHanTraSach
	from PhieuMuon
	where NgayHenTra < (select GETDATE())
END 
go
exec sp_TongSVQuaHanTraSach
-- Stored 29
go
	CREATE PROC sp_TongSoPhieuConHanTraSach
AS BEGIN 
 	Select COUNT(MaPhieuMuon) TongSoPhieuConHanTraSach
	from PhieuMuon
	where NgayHenTra > (select GETDATE())
END 
go
exec sp_TongSoPhieuConHanTraSach
-- Stored 30
go
	CREATE PROC sp_TongSoPhieuQuaHanTraSach
AS BEGIN 
 	Select COUNT(MaPhieuMuon) TongSoPhieuQuaHanTraSach
	from PhieuMuon
	where NgayHenTra < (select GETDATE())
END 
go
exec sp_TongSoPhieuQuaHanTraSach
-- Stored 31
go
	CREATE PROC sp_TongPM
AS BEGIN 
 	Select COUNT(MaPhieuMuon) TongPM
	from PhieuMuon
END 
go
exec sp_TongPM

-- Stored 32
-- Stored 33
go
	CREATE PROC sp_SVChuaMuonSach
AS BEGIN 
 	Select sv.MaSV, Password, HoTen, NgaySinh, GioiTinh, DiaChi, SDT, Email
	from SinhVien sv full join PhieuMuon pm on sv.MaSV = pm.MaSV
	where pm.MaSV IS NULL
END 
go
exec sp_SVChuaMuonSach
-- Stored 34
go
	CREATE PROC sp_SVDaMuonSach
AS BEGIN 
 	Select DISTINCT pm.MaSV, Password, HoTen, NgaySinh, GioiTinh, DiaChi, SDT, Email
	from SinhVien sv join PhieuMuon pm on sv.MaSV = pm.MaSV
END 
go
exec sp_SVDaMuonSach
-- Stored 35
go
	CREATE PROC sp_TongSVChuaMuonSach
AS BEGIN 
 	Select COUNT(sv.MaSV) TongSVChuaMuonSach
	from SinhVien sv full join PhieuMuon pm on sv.MaSV = pm.MaSV
	where pm.MaSV IS NULL
END 
go
exec sp_TongSVChuaMuonSach
-- Stored 36
go
	CREATE PROC sp_TongSVDaMuonSach
AS BEGIN 
 	Select COUNT(DISTINCT pm.MaSV) TongSVDaMuonSach
	from SinhVien sv join PhieuMuon pm on sv.MaSV = pm.MaSV
END 
go
exec sp_TongSVDaMuonSach
-- Stored 37
go
CREATE PROC sp_SachMuonNhieuNhatSVUI
AS BEGIN 
 	Select  pm.MaSach, s.TenSach, sum(pm.SoLuong) SachMuonNhieuNhatSVUI
	from PhieuMuon pm join Sach s on pm.MaSach = s.MaSach
	group by pm.MaSach,  s.TenSach
	order by sum(pm.SoLuong) desc
END 
go
exec sp_SachMuonNhieuNhat
-- Stored 38
go
CREATE PROC sp_SachMuonItNhatSVUI
AS BEGIN 
 	Select  pm.MaSach, s.TenSach, sum(pm.SoLuong) SachMuonItNhatSVUI
	from PhieuMuon pm join Sach s on pm.MaSach = s.MaSach
	group by pm.MaSach,  s.TenSach
	order by sum(pm.SoLuong) asc
END 
go
exec sp_SachMuonItNhatSVUI