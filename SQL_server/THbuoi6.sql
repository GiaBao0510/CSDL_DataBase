	--1.Thêm khóa chính cho các bảng đã cho
	--Đặt thuộc tính "ten" là khóa ngoài của bảng LUI_TOI và AN
	--Thêm ràng buộc giá>0 cho cột "gia" của bảng PHUC_VU

alter table NGUOI_AN add primary key (ten);
alter table LUI_TOI add foreign key(ten) references NGUOI_AN(ten); 
alter tale AN add foreign key(ten) references NGUOI_AN(ten);
alter table PHUC_VU add check(gia > 0);

	--2. Cho biết quán ‘Pizza Hut’ đã phục vụ các bánh pizza nào ?

select pizza
from PHUC_VU
where quanPizza like  'Pizza Hut';

	--3. Danh sách các bánh pizza mà các quán có bán ?

select quanPizza,pizza
from PHUC_VU;

	--4. Cho biết tên các quán có phục vụ các bánh pizza mà tên gồm chữ ‘m’

select quanPizza
from PHUC_VU
where pizza like '%m%';

	--5. Tìm tên và tuổi của người ăn đã đến quán ‘Dominos’, sắp xếp kết quả giảm dần theo tuổi?

select ng.ten, ng.tuoi
from nguoi_an ng join lui_toi lt on ng.ten = lt.ten
where lt.quanPizza like 'Dominos'
order by ng.tuoi DESC;

	--6. Tìm tên quán pizza và số bánh pizza mà mỗi quán phục vụ ?

select quanPizza, count(*) soBanhCuaMoiQuan
from PHUC_VU
group by quanPizza;

	--7. Tìm tên những quán pizza phục vụ pizza với giá cao nhất ?

select distinct quanPizza
from PHUC_VU 
where gia = (select max(gia) from phuc_vu)

	--8. Tìm tên các quán có phục vụ ít nhất một bánh pizza mà “Ian” thích ăn ?

select pv.quanpizza
from phuc_vu pv join an on an.pizza = pv.pizza
where an.ten like 'Ian'


	--9.Tìm tên các quán có phục vụ ít nhất một bánh mà “Eli” không thích ?

select pv.quanpizza 
from phuc_vu pv join an on an.pizza = pv.pizza
where an.ten not like 'Eli'


	--10.Tìm tên các quán chỉ phục vụ các bánh mà “Eli” thích ?

select pv.quanPizza ,count(*)
from phuc_vu pv join (select pizza from an where ten like 'Eli') N1 on pv.pizza = N1.pizza
group by pv.quanPizza
having count(*) = (select count(pizza) from an where ten like 'Eli');

	--11.Tên quán có phục vụ bánh với giá lớn hơn tất cả bánh phục vụ bởi quán ‘New York Pizza’

select distinct quanPizza
from phuc_vu
where quanPizza not like 'New York Pizza' and gia > (select max(gia) from phuc_vu where quanPizza like 'New York Pizza');

	--12.Tìm tên các quán chỉ phục vụ các bánh có giá nhỏ hơn 10 ?

select quanPizza
from phuc_vu
group by quanPizza
having max(gia)<10;

	--13.Tìm tên bánh được phục vụ bởi quán ‘New York Pizza’ và quán ‘Dominos’

select pizza
from phuc_vu
where quanPizza like 'New York Pizza'
intersect
select pizza
from phuc_vu
where quanPizza like 'Dominos';

	--14.Tìm tên bánh được phục vụ bởi quán ‘Little Caesars’ và không phục vụ bởi quán 'Pizza Hut'

select pizza
from phuc_vu
where quanPizza like 'Little Caesars'
minus
select pizza
from phuc_vu
where quanPizza like 'Pizza Hut';

	--15.Tìm tên các quán có phục vụ tất cả các loại bánh pizza?

select quanPizza
from phuc_vu
group by quanPizza
having count(*) =(select count(distinct pizza) from phuc_vu);

	--16.Tên quán phục vụ ít nhất 2 bánh pizza mà ‘Gus’ thích ?

select quanPizza
from phuc_vu pv join (select distinct an.pizza from phuc_vu pv join an on pv.pizza = an.pizza where an.ten like 'Gus') K on k.pizza = pv.pizza
group by quanPizza
having count(*) >= 2;

	--17.Tìm tên các quán có phục vụ tất cả các bánh mà ‘Ian’ thích


select pv.quanpizza
from phuc_vu pv join (select distinct an.pizza from phuc_vu pv join an on pv.pizza = an.pizza where an.ten like 'Ian') I on I.pizza = pv.pizza
group by pv.quanpizza
having count(*) = (select count(distinct an.pizza) from phuc_vu pv join an on pv.pizza = an.pizza where an.ten like 'Ian')

	--18.Tên người ăn lui tới ít nhất 3 quán?

select ten
from lui_toi 
group by ten
having count(*) >= 3

	--19.Tính số loại pizza mà mỗi quán có bán ?

select quanPizza, count(*) soBanhCuaMoiQuan
from PHUC_VU
group by quanPizza;

	--20.Tìm tên người ăn thích các bánh ít nhất là giống các bánh mà Hil thích ?

select  an.ten
from an join (select pizza from an where ten like 'Hil') an2 on an.pizza = an2.pizza
where an.ten not like 'Hil'
group by an.ten
having count(*) = (select count(pizza) from an where ten like 'Hil')