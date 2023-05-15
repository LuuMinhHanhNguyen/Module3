create database product_management;
use product_management;
create table phieu_xuat(
phieuxuat_id int primary key auto_increment,
ngay_xuat date
);

create table vat_tu(
vattu_id int primary key auto_increment,
ten_vattu varchar(45)
);

create table chitiet_phieuxuat(
phieuxuat_id int,
vattu_id int,
primary key(phieuxuat_id, vattu_id),
foreign key (phieuxuat_id) references phieu_xuat(phieuxuat_id),
foreign key (vattu_id) references vat_tu(vattu_id),
dongia_xuat double,
soluong_xuat int
);

create table phieu_nhap(
phieunhap_id int primary key auto_increment,
ngay_nhap date
);

create table chitiet_phieunhap(
vattu_id int,
phieunhap_id int,
dongia_nhap double,
soluong_nhap int,
primary key(vattu_id, phieunhap_id),
foreign key (vattu_id) references vat_tu(vattu_id),
foreign key (phieunhap_id) references phieu_nhap (phieunhap_id)
);

create table don_hang(
donhang_id int primary key auto_increment,
ngay_donhang date
);

create table chitiet_donhang(
donhang_id int,
vattu_id int,
primary key (donhang_id, vattu_id),
foreign key (donhang_id) references don_hang(donhang_id),
foreign key (vattu_id) references vat_tu(vattu_id)
);




create table nha_cung_cap(
nha_cungcap_id int primary key auto_increment,
ten_nhacungcap varchar(45),
dia_chi varchar(45),
donhang_id int,
foreign key(donhang_id) references don_hang(donhang_id)
);

create table dien_thoai_nha_cung_cap(
id int primary key auto_increment,
so_dien_thoai varchar(45),
nha_cungcap_id int,
foreign key (nha_cungcap_id) references nha_cung_cap(nha_cungcap_id)
);

insert into don_hang(ngay_donhang)
values("2023/05/05"), ("2023/04/04");

insert into nha_cung_cap(donhang_id, ten_nhacungcap, dia_chi)
values(1, "Go", "King Street"),
(2, "Bid", "Queen Street")
;

insert into dien_thoai_nha_cung_cap(so_dien_thoai, nha_cungcap_id)
values( "0123456789",1), ( "099999999", 1), ( "088888888",2);

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select ten_nhacungcap, so_dien_thoai, count(so_dien_thoai)
from nha_cung_cap ncc
join dien_thoai_nha_cung_cap dtncc
where ncc.nha_cungcap_id = dtncc.nha_cungcap_id
group by  ten_nhacungcap;

