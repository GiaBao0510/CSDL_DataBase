		--Cau 1 tao bang --
create table KHOAHOC(
	MAKH varchar(10) primary key,
	TENKH varchar(30) not null,
	NGAYBD date not null,
	NGAYKT date not null, 
	check(NGAYKT > NGAYBD)
);

create table CHUONGTRINH(
	MACT varchar(10) primary key,
	TENCT varchar(50) not null
);
create table LOAILOP(
	MALOAI varchar(10) primary key,
	MACT varchar(10) not null references CHUONGTRINH(MACT),
	TENLOAI varchar(30) not null
);
create table LOP(
	MALOP varchar(10) primary key,
	MALOAI varchar(10) not null references LOAILOP(MALOAI),
	TENLOP varchar(30) not null,
	SISO int,
	MAKH varchar(10) not null references KHOAHOC(MAKH),
	check (SISO > 12)
);
create table HOCVIEN(
	MAHV varchar(10) primary key,
	TENHV varchar(30) not null,
	GIOITINH char(1) check(GIOITINH = '0' or GIOITINH = '1'),
	NGAYSINH date not null,
	SDT int,
	DIACHI varchar(255) not null,
);
create table PHIEUTHU(
	SOPT varchar(10) primary key,
	MAHV varchar(10) not null references HOCVIEN(MAHV),
	MALOP varchar(10) not null references LOP(MALOP),
	NGAYLAPPHIEU date not null,
	THANHTIEN int not null, 
	check(THANHTIEN > 0)
);
create table MONHOC(
	MAMH varchar(10) primary key,
	TENMH varchar(30) not null
);
create table DIEM(
	MAMH varchar(10) not null references MONHOC(MAMH),
	MAHV varchar(10) not null references HOCVIEN(MAHV),
	MALOP varchar(10) not null references LOP(MALOP),
	DIEM int check(DIEM >= 0 and DIEM <=10)
);

		--Cau 2: Them du lieu cho cac quan he--
	--Bang KHOAHOC
insert into KHOAHOC values('k001','khoa 1','2020/01/10','2020/03/20')
insert into KHOAHOC values('k002','khoa 3','2020/03/28','2020/05/28')
insert into KHOAHOC values('k003','khoa 3','2020/04/10','2020/07/20')
insert into KHOAHOC values('k004','khoa 4','2020/06/15','2020/09/20')
	--Bang CHUONGTRINH
insert into CHUONGTRINH values('CT007','Chung Chi Tieng Anh Bac 6(A1,B1,B2,C1)')
insert into CHUONGTRINH values('CT006','Chuong trinh CamBridge')
insert into CHUONGTRINH values('CT005','Tieng Anh IELTS')
insert into CHUONGTRINH values('CT004','Chuong Trinh TOEIC')
insert into CHUONGTRINH values('CT003','Tieng Anh Luyen Ky Nang')
insert into CHUONGTRINH values('CT002','Tieng Anh Tre Em')
insert into CHUONGTRINH values('CT001','Tieng Anhb Tong Quat')
	--Bang LOAILOP
insert into LOAILOP values('LL001','CT001','Tieng Anh Can ban')
insert into LOAILOP values('LL002','CT001','Tieng Anh A1')
insert into LOAILOP values('LL003','CT001','Tieng Anh A2')
insert into LOAILOP values('LL004','CT001','Tieng Anh B1')
insert into LOAILOP values('LL005','CT001','Tieng Anh B2')
insert into LOAILOP values('LL006','CT001','Tieng Anh C1')
	--Bang LOP
insert into LOP values('L001','LL001','Lop 1','30','k001')
insert into LOP values('L002','LL001','Lop 2','30','k001')
insert into LOP values('L003','LL002','Lop 1','25','k001')
	--Bang HOCVIEN
insert into HOCVIEN values('HV0001','Do Binh An','1','2000/11/02','917217036','Co Do - Can Tho')
insert into HOCVIEN values('HV0002','Do Gia Bao','1','2001/12/02','917217036','On Mon - Can Tho')
insert into HOCVIEN values('HV0008','Do Phuc Vinh','1','2002/11/02','917217036','Cu Lao Dung - Soc Trang')
insert into HOCVIEN values('HV0004','Thach Chi Tam','1','2000/01/02','917217036','Chau Thanh - Can Tho')
insert into HOCVIEN values('HV0005','Le Cam Giao','0','2000/11/05','917217036','Phong Dien - Can Tho')
insert into HOCVIEN values('HV0006','Huynh Gia Bao','1','2000/11/02','917217036','Phong Dien - Can Tho')
	--Bang PHIEUTHU
insert into PHIEUTHU values('PT000002','HV0002','L001','2021/6/1','1350000')
insert into PHIEUTHU values('PT000003','HV0003','L001','2021/6/1','1350000')
insert into PHIEUTHU values('PT000004','HV0004','L001','2021/6/1','1350000')
insert into PHIEUTHU values('PT000005','HV0005','L001','2021/6/1','1350000')
insert into PHIEUTHU values('PT000006','HV0006','L001','2021/6/1','1350000')
insert into PHIEUTHU values('PT000007','HV0008','L001','2021/6/1','1350000')
		--Cau 3: lieu ('PT00008','HV0012','L001','06-02-2021',1350000) vao PHIEUTHU---
insert into PHIEUTHU values('PT000008','HV0012','L001','6/2/2021','1350000')
--Dòng này không thể thêm vào .Vì nó vi phạm định dạng ngày mặc định và nó cũng vi phạm không tìm thấy khóa cha HV0012
		--Cau 4 Thêm dòng dữ liệu ('L004','LL002','Lớp 4',10,'k001') vào LOP
insert into LOP values('L004','LL002','Lop 1','10','k001')
--Dòng này không thể thêm vào vì vi phạm tính ràng buộc về SISO 
		--Cau 5: Xóa khoá học có mã 'k001', khoá học này có xoá được không
delete from KHOAHOC 
where MAKH = 'k001';
--Xóa mã khóa học 'k001' là không được vì bị vi phạm ràng buộc toàn vẹn, Tức là có bảng khác tham chiếu vào cột MAKH có giá trị 'k001'
		--Cau 6: Xóa khoá học có mã 'K002', khoá học này có xoá được không
delete from KHOAHOC 
where MAKH = 'k002';
--Xóa mã khóa học 'k002' là được vì không vi phạm ràng buộc toàn vẹn, Tức là có bảng khác tham chiếu vào cột MAKH có giá trị 'k002'
		--Cau 7 : Giảm giá trị cột thành tiền của phiếu thu 000001 xuống 10%
update PHIEUTHU set THANHTIEN=1350000 -(1350000*0.1)
where SOPT='PT000002';
		--Cau 8: Thêm vào quan hệ LOP cột hocphi và cập nhật giá trị cho cột này như sau:
alter table LOP add hocphi int;
update LOP set hocphi='1350000'
where MALOAI='LL001';
update LOP set hocphi='1650000'
where MALOAI='LL002';
		--Cau 9: Tạo bảng HOCVIEN_NAM(MAHV,TENHV,SDT,NGAYSINH,DIACHI), chỉ bao gồm các học viên giới tính nam (0)
create table HOCVIEN_NAM(
	MAHV varchar(15) primary key,
	TENHV varchar(50) not null,
	SDT varchar(11) not null,
	NGAYSINH date not null,
	DIACHI varchar(255) not null
);
		--Cau 10: Lấy dữ liệu tự động từ bảng HOCVIEN thêm vào bảng HOCVIEN_NAM vừa tạo
insert into HOCVIEN_NAM(MAHV,TENHV,SDT,NGAYSINH,DIACHI)
select hv.MAHV,hv.TENHV,hv.SDT,hv.NGAYSINH,hv.DIACHI
from HOCVIEN hv
where hv.GIOITINH ='1';
		--Cau 11: Xoá Bảng KHOAHOC, bảng này xoá được không ? Giải thích tại sao ?
drop table KHOAHOC;
--Lỗi xóa không được vì có khóa chính MAKH trong bảng KHOAHOC được tham chiếu bởi khóa ngoại của các bảng khác.
		--Cau 12: Xoá bảng HOCVIEN_NAM bảng này xoá được không ? Giải thích tại sao ?
drop table HOCVIEN_NAM;
--Xóa được vì có khóa chính trong bảng HOCVIEN_NAM không được tham chiếu bởi khóa ngoại của các bảng khác.
		--Cau 13: Đổi kiểu dữ liệu của cột tenMH trong bảng MONHOC thành VARCHAR(100)
alter table MONHOC alter column TENMH varchar(100);