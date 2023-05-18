create table DIADIEM(
	tenDD varchar(50) primary key,
	socho int,
	tpho varchar(50),
	vung varchar(50),
	gia float
);
create table HOATDONG(
	tenDD varchar(50),
	tenHoatDong varchar(50).
	gia float
);
create table KHACHHANG(
	idKH varchar(30) primary key
	hoKH varchar(10) not null,
	tenKH varchar(30) not null,
	tpho varchar(50),
	vung varchar(50)
);
create table KYNGHI(
	idKH varchar(30) not null references DIADIEM(tenDD),
	tenDD varchar(50) not null references DIADIEM(tenDD),
	ngayBD date primary key,
	ngayKT date,
	socho int not null,
	check(ngayKT > ngayBD)
);
	--Thêm khóa chính cho bảng hoạt động

alter table HOATDONG add primary key (tenHoatDong);

	--Thêm tenDD là khóa ngoại của bảng hoat động

alter table HOATDONG add foreign key(tenDD) references HOATDONG(tenDD);

	--Thêm ràng buộc cho bảng DIADIEM sao cho không có 2 địa điểm trong cùng thành phố và vùng

alter table DIADIEM add unikey(tpho);
alter table DIADIEM add unikey(vung);

	--Hãy cho biết họ & tên khách hàng thuộc vùng Europe

select hoKH,tenKH
from khachhang
where vung like 'Europe';

	--Hãy cho biết tên các vùng gồm các địa điểm du lịch mà khách hàng 'Kerouac Jack' đã tham gia

select dd.vung
from KYNGHI kn join khachhang kh on kn.idKH = kh.idKH
		join DIADIEM dd on dd.tendd = kn.tendd
where tenKH like 'Kerouac Jack';

	--
