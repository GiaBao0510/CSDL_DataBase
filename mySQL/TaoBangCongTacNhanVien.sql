/*Tao Bang*/
CREATE TABLE DonVi(
	maDV CHAR(5) PRIMARY KEY,
	tenDV VARCHAR(30)  NOT NULL
);
CREATE TABLE ChucVu(
	maCV CHAR(10) PRIMARY KEY,
	tenCV VARCHAR(30)  NOT NULL,
	heSoPhuCap FLOAT
);
CREATE TABLE NhanVien(
	maNV CHAR(10) PRIMARY KEY,
	hoTen VARCHAR(100)  NOT NULL,
	namSinh DATE NOT NULL,
	gioiTinh BIT,
	luong FLOAT CHECK(luong > 0),
	maDV CHAR(5) NOT null,
	maCV CHAR(5) NOT null,
	FOREIGN KEY (maDV) REFERENCES donvi(maDV),
	FOREIGN KEY (maCV) REFERENCES chucvu(maCV)
);
	/*Thêm dữ liệu chức vụ*/
INSERT INTO chucvu VALUES('001','Giam doc','0.4');
INSERT INTO chucvu VALUES('002','Truong Phong Ke Toan','0.3');
INSERT INTO chucvu VALUES('003','Giam doc nhan su','0.4');
INSERT INTO chucvu VALUES('004','Truong phong hanh chinh','0.3');
INSERT INTO chucvu VALUES('005','Giam doc ky thuat','0.4');
INSERT INTO chucvu VALUES('006','Nhan vien','0.2');
	/*Thêm dữ liệu đơn vị*/
INSERT INTO donvi VALUES('001','Ban giam doc');
INSERT INTO donvi VALUES('002','Phong ke toan');
INSERT INTO donvi VALUES('003','Phong nhan su');
INSERT INTO donvi VALUES('004','Phong hanh chinh');
INSERT INTO donvi VALUES('005','Phong ky thuat');
	/*Thêm dữ liệu nhân viên*/
INSERT INTO nhanvien VALUES('001','Do Thanh Nghi','1974-02-12','1','1200','005','006');
INSERT INTO nhanvien VALUES('002','Nguyen Van Tuyen','1980-04-22','1','1500','005','005');
INSERT INTO nhanvien VALUES('003','Nguyen Thanh Binh','1979-07-25','1','3200','001','001');
INSERT INTO nhanvien VALUES('004','Tran Trung Tin','1982-05-10','0','1600','004','004');
INSERT INTO nhanvien VALUES('005','Phan Xuan Trang','1982-08-07','0','1200','004','006');
INSERT INTO nhanvien VALUES('006','Bui Minh Quan','1980-10-20','1','2200','003','003');
INSERT INTO nhanvien VALUES('007','Lam Thuc Hoa','1976-09-15','0','1200','003','006');
INSERT INTO nhanvien VALUES('008','Lu Hy Phung','1975-05-18','0','3200','002','002');
INSERT INTO nhanvien VALUES('009','Nguyen Manh Hung','1967-09-21','1','1200','002','006');
INSERT INTO nhanvien VALUES('0010','Nguyen An Phuoc','1977-06-02','1','1200','005','006');
INSERT INTO nhanvien VALUES('0011','Tran Thanh Tung','1978-07-28','1','1200','005','006');
INSERT INTO nhanvien VALUES('0012','Nguyen Xuan Huy','1984-09-23','1','1200','005','006');