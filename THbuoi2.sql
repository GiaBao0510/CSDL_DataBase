	-- 1. Xem nội dung của tất cả các bảng dữ liệu bằng lệnh SELECT

select * from KHOAHOC;
select * from CHUONGTRINH;
select * from LOAILOP;
select * from LOP;
select * from HOCVIEN
select * from PHIEUTHU;
select * from MONHOC;
select * from DIEM;

	--2. Tìm thông tin về các học viên nam

select *
from HOCVIEN
where gioitinh = '1';

	--3. Tìm thông tin về các học viên có địa chỉ ở Cần Thơ

select *
from HOCVIEN
where diachi like '%Cần Thơ%';

	--4. Tìm thông tin về các lớp học của ‘khoá 1’

select *
from lop l join khoahoc kh on l.makh = kh.makh
where l.makh like 'K001';

	--5. Tìm mã và họ tên học viên có học ‘khoá 1’

select hv.mahv , hv.tenhv
from diem d join lop l on d.malop = l.malop
	    join hocvien hv on d.mahv = hv.mahv
	    join khoahoc kh on kh.makh = l.makh
where kh.makh like 'K001';

	--6. Tìm họ tên các học viên có bao gồm chữ ‘Đỗ’

select tenhv
from hocvien
where tenhv like 'Đỗ% ';

	--7. Tìm thông tin các học viên sinh năm 2000 ?

select *
from hocvien
where ngaysinh like '2000% ';

	--8. Tìm thông tin của các học viên sinh tháng 12 năm 2001 ?

select *
from hocvien
where ngaysinh like '2001-12%';

	--9. Tìm thông tin các học viên sinh từ năm 1998 đến 2000

select *
from hocvien
where ngaysinh between '1998-1-1' and '2000-12-31';

	--10. Tìm thông tin các phiếu thu được thực hiện từ ngày 5 đến ngày 10 tháng 6 năm 2021 ?

select *
from PHIEUTHU
where ngaylapphieu between '2021-6-5' and '2021-6-10';

	--11. In danh sách các học viên lớp ‘Lớp 1’ Tiếng anh căn bản

select *
from hocvien hv join diem d on hv.mahv = d.mahv
		join lop l on l.malop = d.malop
		join loailop ll on ll.maloai = l.maloai
where l.tenlop like 'Lớp 1' and ll.tenloai like 'Tiếng Anh căn bản';

	--12. In danh sách các lớp thuộc chương trình ‘Tiếng anh tổng quát’

select *
from lop l join loailop ll on l.maloai = ll.maloai
	   join chuongtrinh ct on ct.mact = ll.mact
where ct.tenct like 'Tiếng anh tổng quát' nad ct.mact like 'CT001';

	--13. Liệt kê thông tin tất cả các phiếu thu của ‘lớp 1’ Tiếng anh A1?

select *
from phieuthu pt join lop l on pt.malop = l.malop
		 join loailop ll on l.maloai = ll.maloai
where l.tenlop like 'lớp 1' and ll.tenloai like 'Tiếng anh A1';

	--14. Tìm họ tên học viên, tên môn và điểm thi các môn của các học viên học ‘khoá 1’

select hv.tenhv , mh.tenmh , d.diem
from hocvien hv join diem d on d.mahv = hv.mahv
		join monhoc mh on d.mamh = mh.mamh
		join lop l on l.malop = d.malop
		join khoahoc kh on l.makh = kh.makh
where tenkh like 'K001';

	--15. Có tất cả bao nhiêu học viên ?

select count(*) tongSoHocVien
from hocvien;
 
	--16.‘Lớp 1’ Tiếng anh căn bản có bao nhiêu học viên ?

select count(*) soLuonghOcVienHocTACB
from hocvien hv join diem d on hv.mahv = d.mahv
		join lop l on l.malop =  d.malop
		join loailop ll on ll.maloai = l.maloai
where ll.maloai like 'LL001' and l.tenlop like 'Lớp 1';

	--17. Tính tổng số tiền đã thu được của ‘lớp 2’ Tiếng anh căn bản

select sum(pt.thanhtien) tongTien
from phieuthu pt join lop l on l.malop = pt.malop
		 join loailop ll on ll.maloai = l.maloai
where ll.maloai like 'LL001' and l.tenlop like 'lớp 2';

	--18. Tính tổng số tiền đã thu được của ‘khoá 1’ ?

select  sum(pt.thanhtien) ongTienDaThuCuaKhoa1
from phieuthu pt join lop l on pt.malop = l.malop
		 join khoahoc kh on kh.makh = l.makh
where kh.makh like 'K001';

	--19. Tính điểm trung bình của học viên 'Đỗ Gia Bảo', sinh ngày 02/12/2001 học ‘lớp 1’ Tiếng anh căn bản ?

select avg(d.diem) DiemTrungBinh
from diem d join hocvien hv on d.mahv = hv.mahv
	    join lop l on d.malop = l.malop
	    join loailop ll on ll.maloai = l.maloai
where hv.tenhv like 'Đỗ Gia Bảo' and hv.ngaysinh '2001-12-02' and l.tenlop like 'lớp 1' and ll.maloai like 'LL001'

	--20. Tìm điểm lớn nhất ?

select max(diem) DiemLonNhat
from diem;