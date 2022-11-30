		//PHI CONG//
CREATE TABLE phiCong(
	MPC smallint PRIMARY KEY,
	hoTen varchar(50) NOT NULL,
	diaChi varchar(255) NOT NULL,
	nuoc varchar(30) NOT NULL
);
		//CONG TY//
CREATE TABLE congTy(
	MCT smallint PRIMARY KEY,
	tencty varchar(30) NOT NULL,
	nuoc varchar(30) NOT NULL
);
		//LOAI MAY BAY//
CREATE TABLE loaiMayBay(
	loai varchar(20) PRIMARY KEY,
	NSX  varchar(30) NOT NULL,
	soCho int NOT NULL
);
		//MAY BAY//
CREATE TABLE mayBay(
	MMB smallint PRIMARY KEY,
	loai varchar(20) NOT NULL,
	MCT smallint NOT NULL,
	CONSTRAINT fk_mayBay FOREIGN KEY (loai) REFERENCES loaiMayBay(loai),
			     FOREIGN KEY (MCT) REFERENCES congTy(MCT)
);
		//CHUYEN BAY//
CREATE TABLE chuyenBay(
	SOCB varchar(20) PRIMARY KEY,
	ngayBay date PRIMARY KEY,
	MPC smallint NOT NULL,
	MMB smallint NOT NULL,
	giodi time NOT NULL,
 	gioden time NOT NULL,
	noidi varchar(25) DEFAULT 'Sai Gon',
	noiden varchar(25) NOT NULL,
	khoangCach int CHECK(khoangCach > 0),
	CONSTRAINT fk_chuyenBay FOREIGN KEY (MPC) REFERENCES phiCong(MPC),
				FOREIGN KEY (MMB) REFERENCES mayBay(MMB)
);
		//LAM VIEC//
CREATE TABLE lamViec(
	MPC smallint NOT NULL,
	MCT smallint NOT NULL,
	ngayBD date PRIMARY KEY,
	songay int NOT NULL,
	CONSTRAINT fk_lamViec FOREIGN KEY (MPC) REFERENCES phiCong(MPC),
			      FOREIGN KEY (MCT) REFERENCES congTy(MCT)
);