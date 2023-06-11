	/*Tạo bảng*/
CREATE TABLE khoa(
	makhoa CHAR(10) primary KEY,
	tenKhoa VARCHAR(50) NOT null
);
CREATE TABLE sinhVien(
	mssv CHAR(10) primary KEY,
	hoten VARCHAR(50) NOT null,
	gioiTinh CHAR(1) NOT null,
	ngaySinh DATE NOT null,
	diaChi VARCHAR(100) NOT null,
	makhoa CHAR(10) NOT NULL,
	FOREIGN KEY (makhoa) REFERENCES khoa(makhoa)
);
CREATE TABLE hocPhan(
	maHP CHAR(10) PRIMARY key,
	tenHP VARCHAR(50) NOT null,
	soTinChi INT NOT null,
	soTietLT INT NOT NULL,
	soTietTH INT NOT NULL
	
);
CREATE TABLE ketQua(
	mssv CHAR(10) NOT NULL,
	maHP CHAR(10) NOT NULL,
	diemSo FLOAT NOT NULL,
	FOREIGN KEY (mssv) REFERENCES sinhvien(mssv),
	FOREIGN KEY (maHP) REFERENCES hocphan(maHP)
);
	/*Thêm dữ liệu vào bảng khóa*/
INSERT INTO khoa VALUES ('ktqtkd','Kinh tế và quản trị kinh doanh');
INSERT INTO khoa VALUES ('cntt&tt','Công nghệ thông tin và truyền thông');
INSERT INTO khoa VALUES ('khtn','Khoa học tự nhiên');
INSERT INTO khoa VALUES ('khxh','Khoa học xã hội');
INSERT INTO khoa VALUES ('sp','Sư phạm');
	/*Thêm dữ liệu vào học phần*/
INSERT INTO hocphan VALUES('ct101','Lập trình căn bản','4','30','60');
INSERT INTO hocphan VALUES('ct176','Lập trình hướng đối tượng','3','30','30');
INSERT INTO hocphan VALUES('ct237','Nguyên lý hệ điều hành','3','30','30');
INSERT INTO hocphan VALUES('tn001','Vi tích phân A1','4','45','0');
INSERT INTO hocphan VALUES('tn101','Xác suất thống kê','3','45','0');
INSERT INTO hocphan VALUES('tn172','Toán rời rạc','4','60','0');
INSERT INTO hocphan VALUES('sp102','Đại số tuyến tính và hình học','4','60','0');
	/*Thêm dữ liệu vào sinh viên*/
INSERT INTO sinhvien VALUES('B1234567','Nguyễn Thanh Hải','M','2001-12-02','Phòng 1, KTX khu B DHCT','cntt&tt');
INSERT INTO sinhvien VALUES('B1234568','Trâng Thanh Mai','M','2001-1-20','232, Nguyễn Văn Kéo, Q.Ninh Kiều, TP Cần Thơ','cntt&tt');
INSERT INTO sinhvien VALUES('B1234569','Nguyễn Thanh Hải','M','2001-12-02','02, Đại lộ Hòa Bình Q.Ninh Kiều, TP Cần Thơ','cntt&tt');
INSERT INTO sinhvien VALUES('B1334569','Nguyễn Thanh Hải','M','2001-12-02','343, 30/4 Q.Ninh Kiều, TP Cần Thơ','sp');
INSERT INTO sinhvien VALUES('B1345678','Nguyễn Thanh Hải','M','2001-12-02','123 , Trần Hưng Đạo, Q.Ninh Kiều, TP Cần Thơ','cntt&tt');
INSERT INTO sinhvien VALUES('B1345679','Nguyễn Thanh Hải','M','2001-12-02','Phòng 201, KTX khu A DHCT','cntt&tt');
INSERT INTO sinhvien VALUES('B1456789','Trần Kim Trọng','M','2003-50-10','177,3/2 , Q.Ninh Kiều, TP Cần Thơ','khtn');
INSERT INTO sinhvien VALUES('B1567890','Lê Bạch Yến','F','2003-10-20','Phòng 201, KTX khu A DHCT','khtn');
	/*Thêm dữ liệu kết quả*/
INSERT INTO ketqua VALUES('B1234567','ct101',4);
INSERT INTO ketqua VALUES('B1234568','ct176',8);
INSERT INTO ketqua VALUES('B1234569','ct237',9);
INSERT INTO ketqua VALUES('B1334569','sp102',2);
INSERT INTO ketqua VALUES('B1345678','ct101',6);
INSERT INTO ketqua VALUES('B1456789','tn172',10);
INSERT INTO ketqua VALUES('B1456789','tn172',7);
INSERT INTO ketqua VALUES('B1234567','ct176',1);
INSERT INTO ketqua VALUES('B1234568','ct101',9);
INSERT INTO ketqua VALUES('B1234569','ct101',8);
INSERT INTO ketqua VALUES('B1334569','ct101',4);
INSERT INTO ketqua VALUES('B1345678','tn001',6);
INSERT INTO ketqua VALUES('B1345679','ct101',2);
INSERT INTO ketqua VALUES('B1456789','ct101',7);
INSERT INTO ketqua VALUES('B1567890','ct101',6);
INSERT INTO ketqua VALUES('B1345679','ct176',5);

	/*1.Hiển thị thông tin: mssv , ho ten, sinh vien nam sinh nam 2001*/
SELECT sv.mssv,sv.hoten,sv.ngaySinh
FROM sinhvien sv
WHERE sv.gioiTinh = 'M' and YEAR(sv.ngaySinh) = 2001;

	
	/*2.In thông tin bảng sinh viên với mã số được săp xếp tăng dần*/
SELECT mssv, hoten,gioiTinh,ngaySinh,diaChi
FROM sinhvien
ORDER BY mssv;

	/*3.Hiên thị danh sách sinh viên thuộc khoa công nghệ thông tin và truyền thông*/
SELECT *
FROM sinhvien sv INNER JOIN khoa ON sv.makhoa = khoa.makhoa
WHERE sv.makhoa like 'cntt&tt';

	/*4.Hiển thị thông tin: mssv , ho ten, diem, hoc phan */
SELECT sv.mssv,sv.hoten,hp.tenHP,kq.diemSo
FROM sinhvien sv INNER JOIN ketqua  kq ON sv.mssv = kq.mssv
		INNER JOIN hocphan hp ON hp.maHP = kq.maHP;

	/*5.Thực hiện hiển thị danh sách mssv, họ tên, só học phần đã học và điểm trung bình*/
SELECT sv.mssv, COUNT(kq.maHP) AS soHocPhan,SUM(hp.soTinChi* kq.diemSo)/SUM(hp.soTinChi) AS diemTB
FROM ketqua kq INNER JOIN sinhvien sv ON sv.mssv = kq.mssv
		INNER JOIN hocphan hp ON hp.maHP = kq.maHP
GROUP BY sv.mssv;
	
	/*6.Thực hiện hiển thị danh sách các môn chua có dinh viên học*/
SELECT maHp,tenHP
FROM hocphan
WHERE maHP NOT IN (SELECT hp.maHP 
		FROM ketqua kq INNER JOIN hocphan hp ON kq.maHP = hp.maHP);

	/*7.Thực hiện hiển thị danh sách các môn chua có dinh viên học*/
SELECT MSSV,HoTen,MAX(diemTB)
FROM (
	SELECT sv.mssv AS MSSV, sv.hoten AS HoTen,SUM(hp.soTinChi* kq.diemSo)/SUM(hp.soTinChi) AS diemTB
	FROM ketqua kq INNER JOIN sinhvien sv ON sv.mssv = kq.mssv
			INNER JOIN hocphan hp ON hp.maHP = kq.maHP
	GROUP BY sv.mssv
) AS bangCau5;
	
	/*8.Thực hiện hiển thị danh sách mssv, họ tên có số điểm trung bình nhỏ hơn trung bình của tổng số điểm trung bình*/
SELECT sv.mssv, COUNT(kq.maHP) AS soHocPhan,SUM(hp.soTinChi* kq.diemSo)/SUM(hp.soTinChi) AS diemTB
FROM ketqua kq INNER JOIN sinhvien sv ON sv.mssv = kq.mssv
		INNER JOIN hocphan hp ON hp.maHP = kq.maHP
GROUP BY sv.mssv
HAVING diemTB < (
		SELECT AVG(diemTB)
		FROM (
			SELECT SUM(hp.soTinChi* kq.diemSo)/SUM(hp.soTinChi) AS diemTB
			FROM ketqua kq INNER JOIN sinhvien sv ON sv.mssv = kq.mssv
					INNER JOIN hocphan hp ON hp.maHP = kq.maHP
			GROUP BY sv.mssv
		) AS bangCau5	
	);

	/*9. Hiển thị danh sách các khoa cùng với số sinh viên tương ứng với khoa đó*/
SELECT khoa.tenKhoa, COUNT(*) TongSoSinhVien
FROM sinhvien sv INNER JOIN khoa ON sv.makhoa = khoa.makhoa
GROUP BY khoa.makhoa;

	/*10. Khoa có nhiều sinh viên  nhất*/
SELECT TENKHOA,MAX(TongSoSinhVien)	
FROM(
	SELECT khoa.tenKhoa as TENKHOA, COUNT(*) TongSoSinhVien
	FROM sinhvien sv INNER JOIN khoa ON sv.makhoa = khoa.makhoa
	GROUP BY khoa.makhoa
)AS BangCau9;

	/*10. Cập nhật lại điểm sinh viên thuộc khoa CNTT&TT học môn ct101 tăng lên 1 điểm*/
UPDATE ketqua SET diemSo = diemSo + 1
WHERE maHP = 'ct101' AND mssv IN (
	SELECT mssv
	FROM sinhvien
	WHERE makhoa = 'cntt&tt'
);