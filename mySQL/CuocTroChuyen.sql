CREATE TABLE cuocTroChuyen(
	nguoiGui VARCHAR(100) not NULL,
	thongDiep VARCHAR(255)
);
INSERT INTO cuocTroChuyen VALUES('Lộc Đỉnh','Tuấn Đạt hú hú, ủa chổ bạn đang học toeic êm ko');
INSERT INTO cuocTroChuyen VALUES('Lộc Đỉnh','a2 rủ tui đăng kí chổ khác nè, mà chổ nào cũng ít thông tin để coi quá à');
INSERT INTO cuocTroChuyen VALUES('Tuấn Đạt','Trần Lộc Đỉnh chỗ tui thì ổn áp, mà tui thấy quan trọng là ở mình có cố gắng ko thôi á');
INSERT INTO cuocTroChuyen VALUES('Tuấn Đạt','Nay khóa tui đi thi mà tui thì xin dời lại tháng 6, thấy ai cũng tự tin chắc êm');
INSERT INTO cuocTroChuyen VALUES('Lộc Đỉnh','dị mà a2 nói nhóm bạn của bạn nghỉ dọc học quá tr nên né qua chổ khác');
INSERT INTO cuocTroChuyen VALUES('Tuấn Đạt','À cũng có á');
INSERT INTO cuocTroChuyen VALUES('Tuấn Đạt','Mà ko "quá trời"');
INSERT INTO cuocTroChuyen VALUES('Lộc Đỉnh','chổ đó có dạy mẹo khum m');
INSERT INTO cuocTroChuyen VALUES('Lộc Đỉnh','có mẹo mới h');
INSERT INTO cuocTroChuyen VALUES('Lộc Đỉnh','chứ khả năng tui thì k có theo từ cơ bản nổi r');
INSERT INTO cuocTroChuyen VALUES('Tuấn Đạt','Nói chung thì mẹo là chủ yếu, có phần đọc part 5 là dạy vững để ko tạch');
INSERT INTO cuocTroChuyen VALUES('Lộc Đỉnh','quá đã');
INSERT INTO cuocTroChuyen VALUES('Lộc Đỉnh','1 khóa nhiu tiền dị');
INSERT INTO cuocTroChuyen VALUES('Gia Bảo','=)))');
INSERT INTO cuocTroChuyen VALUES('Tuấn Đạt','part 5 nội dung y như học mình học ngữ pháp năm 12 vậy á');
INSERT INTO cuocTroChuyen VALUES('Lộc Đỉnh','Minh Trường soạn gì đây');
INSERT INTO cuocTroChuyen VALUES('Tuấn Đạt','Trần Lộc Đỉnh 2tr6 á');
INSERT INTO cuocTroChuyen VALUES('Lộc Đỉnh','hời luôn');
INSERT INTO cuocTroChuyen VALUES('Gia Bảo','CN bàn xog là chốt nhe fen =))');
	/*Hiển thị 10 dòng đầu tiên*/
SELECT *
FROM cuoctrochuyen
LIMIT 9;