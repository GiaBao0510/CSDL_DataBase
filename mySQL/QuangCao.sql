CREATE table quangCao(
	hinhAnh VARCHAR(255) not NULL,
	ngayDang DATE NOT NULL,
	noiDung TEXT NOT NULL
);
INSERT INTO quangCao VALUES('QuangCao/TourDuLich/AnhDanhLaThangCanhTrangAn_NinhBinh.png','2023-5-18','Tràng An là khu du lịch sinh thái đã được UNESCO công nhận di sản thế giới từ 2013. Tràng An với hệ thống dãy núi đá vôi dày đặc, nhiều hang động cổ, hồ, đầm đẹp, huyền bí đã tạo nên một điểm đến du lịch hấp dẫn đối với du khách trong và ngoài nước');
INSERT INTO quangCao VALUES('QuangCao/RauSachLamAn/AnhRauTuoiCacLoai.png','2023-5-18','- Rau sạch Lâm An: nguồn thực phẩm an toàn nhất.
- Rau sạch Lâm An:. Rau trồng theo công nghệ Nhật Bản, đảm bảo vệ sinh an toàn thực phẩm, không sử dụng chất kích thích tăng trưởng, không có các chất độc hại
- Rau sạch Lâm An : Chủng loại đa dạng, thỏa mãn nhu cầu người mua, nhận giao hàng tại nhà với số lượng lớn, giá cả hợp lí.');
INSERT INTO quangCao VALUES('QuangCao/BanhSUaBaVi/AnhTrangChuBanhSuaBaVi.png','2023-5-17','- Bánh sữa non thương hiệu Con bò vàng của công ty cổ phần Ba Vì, kính chào quý khách!
- Bánh sữa Ba Vì - "Công nghệ 3 không" KHÔNG NGỌT QUÁ- KHÔNG BÉO - KHÔNG CHẤT BẢO QUẢN
- Bánh sữa Ba Vì dinh dưỡng cho mọi lứa tuổi
- Bánh sữa Ba Vì: giá rẻ bất ngờ, đủ vị, đủ loại.
BÁNH SỮA BA VÌ - QUÀ TẶNG CỦA TỰ NHIÊN VÀ BÀN TAY CON NGƯỜI');

	/*Thống kê ngày đăng*/
SELECT * ,COUNT(ngayDang) ThongKeNgayDang
FROM quangcao
GROUP BY ngayDang;

	/*Lấy ngẫu nhiên 1 bài đăng*/
SELECT * 
FROM quangcao
order BY RAND()
LIMIT 1;