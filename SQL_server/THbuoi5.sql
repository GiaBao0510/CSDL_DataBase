	--2.Loại của máy 'p8'

select l.idloai,l.tenloai
from may m join loai l on m.idloai = l.idloai
where m.idmay like 'p8'; 

	--3.Tên của các phần mềm 'UNIX'

select pm.tenPM
from phanmem pm join loai l on pm.idloai = l.idloai
where l.idloai like 'UNIX';

	--4.Tên phòng, địa chỉ IP phòng, mã phòng của các máy loại 'UNIX' hoặc 'PCWS'

select p.tenphong, p.IP, p.MP
from phong p join may m on m.mp = p.mp
	     join loai l on l.idloai = m.idloai
where m.idloai in('UNIX','PCWS');

	--5) Tên phòng, địa chỉ IP phòng, mã phòng của các máy loại 'UNIX' hoặc 'PCWS' ở khu vực '130.120.80', sắp xếp kết quả tăng dần theo mã phòng

select p.tenphong, p.IP, p.MP
from phong p join may m on m.mp = p.mp
	     join loai l on l.idloai = m.idloai	
	     join khuvuc kv on kv.ip = p.ip 
where m.idloai in('UNIX','PCWS') and m.ip like '130.120.80'
order by p.MP;

	--6) Số các phần mềm được cài đặt trên máy 'p6'

select count(*) soPhanMem
from caidat cd join phanmem pm on cd.idpm = pm.idpm
		join may m on m.idmay = cd.idmay
where cd.idmay like 'p6';

	--7) Số các máy đã cài phần mềm 'log1'

select count(*) soMayDaCaiDatPM_log1
from caidat cd join phanmem pm on cd.idpm = pm.idpm
		join may m on m.idmay = cd.idmay
where cd.idpm like 'log1';

	--8) Tên và địa chỉ IP (ví dụ: 130.120.80.1) đầy đủ của các máy loại 'TX'

select m.tenmay, m.ip
from may m join loai l on m.idloai = l.idloai
	   join khuvuc kv on kv.ip = m.ip
where m.ip like '130.120.80.1' and m.idloai like 'TX';

	--9) Tính số phần mềm đã cài đặt trên mỗi máy

select m.idmay, count(*) soPhanMemDaCaiDat
from caidat cd join phanmem pm on cd.idpm = pm.idpm
		join may m on m.idmay = cd.idmay
group by m.idmay;

	--10) Tính số máy mỗi phòng

select p.mp, count(*) soMayMoiphong
from may m join phong p on m.mp = p.mp
group by p.mp;

	--11) Tính số cài lần cài đặt của mỗi phần mềm trên các máy khác nhau

select m.idmay, count(*) soPhanMemDaCaiDat
from caidat cd join phanmem pm on cd.idpm = pm.idpm
		join may m on m.idmay = cd.idmay
group by m.idmay;

	--12) Giá trung bình của các phần mềm UNIX

select avg(pm.gia) giaTrungBinh_UNIX
from phanmem pm join loai l on pm.idloai = l.idloai
where l.idloai like 'UNIX';

	--13) Ngày mua phần mềm gần nhất

select max(ngaymua) NgayMuaGanNhat
from phanmem;

	--14) Số máy có ít nhất 2 phần mềm

select cd.idmay, count(*) soMayItNhatCo2PhanMem
from caidat cd join phanmem pm on cd.idpm = pm.idpm
		join may m on m.idmay = cd.idmay
group by cd.idmay
having  count(*) >= 2;

	--15) Tìm các loại không thuộc loại máy

select idloai
from loai

minus

select idloai
from may;

select idloai
from loai
where loai not in (select idloai
			from may);

	--16)Tìm các loại thuộc cả hai loại máy và loại phần mềm

select idloai
from loai

intersect

select pm.idloai
from phanmem pm join may m on m.idloai = pm.idloai;

	--17)Tìm các loại máy không phải là loại phần mềm

select idloai
from may

minus

select idloai
from phanmem;

	--18) Địa chỉ IP đầy đủ của các máy cài phần mềm 'log6'

select m.ip
from caidat cd join may m on cd.idmay = m.idmay
		join phanmem pm on cd.idpm = pm.idpm
where pm.idpm like 'log6';

	--19) Địa chỉ IP đầy đủ của các máy cài phần mềm tên 'Oracle 8'

select m.ip
from caidat cd join may m on cd.idmay = m.idmay
		join phanmem pm on cd.idpm = pm.idpm
where pm.tenpm like 'Oracle 8';

	--20) Tên của các khu vực có chính xác 3 máy loại 'TX'

select kv.tenkhuvuc ,count(*)
from may m join khuvuc kv on m.ip = kv.ip
	   join loai l on l.idloai = m.idloai
where m.loai like 'TX'
group by kv.tenkhuvuc
having count(*) = 3;

	--21) Tên phòng có ít nhất một máy cài phần mềm tên 'Oracle 6'

select p.tenphong ,count(*) soPhanMem_oracle6
from phong p join may m on p.mp = m.mp
	     join caidat cd on cd.idmay = m.idmay
	     join phanmem pm on pm.idpm = cd.idpm
where pm.tenpm like 'Oracle 6'
group by p.tenphong
having count(*)>=1;

	--22) Tên phần mềm được mua gần nhất

select tenpm 
from phanmem
where ngaymua = (select max(ngaymua)
		from phanmem);

	--23) Tên của phần mềm PCNT có giá lớn hơn bất kỳ giá của một phần mềm UNIX nào

select tenpm
from phanmem
where idloai like 'PCNT' and gia > in(select gia 
					from phanmem
					where idloai like 'UNIX');

	--24)Tên của phần mềm UNIX có giá lớn hơn tất cả các giá của các phần mềm PCNT

select tenpm
from phanmem
where idloai like 'UNIX'and gia > all(select gia 
					from phanmem
					where idloai like 'PCNT');


	--25)Tên của máy có ít nhất một phần mềm chung với máy 'p6'

select m.tenmay
from caidat cd join may m on m.idmay = cd.idmay
		join phanmem pm on cd.idpm=pm.idpm
where m.idmay not like 'p6' and pm.tenpm in(select pm.tenpm
					from caidat cd join may m on m.idmay = cd.idmay
							join phanmem pm on cd.idpm=pm.idpm
					where m.idmay like 'p6');

	--26)Tên của các máy có cùng phần mềm như máy 'p6' (có thể nhiều phần mềm hơn máy 'p6')



















