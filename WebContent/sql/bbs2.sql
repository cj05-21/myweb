- bbs2.sql
create table board(
	num		number			not null,
	writer	varchar2(20)	not null,
	email	varchar2(30),
	subject	varchar2(50)	not null,
	content	varchar2(2000)	not null,
	passwd	varchar2(10)	not null,
	reg_date	date		not null,
	readcount	number		default 0,
	ref			number		not null,-- 그룹번호
	re_step 	number		not null,-- 글순서
	re_level	number		not null,-- 들여쓰기
	ip			varchar2(20) not null,
	primary key(num)
);
--mysql 
create table board(
	num INT not null auto_increment,
	writer varchar(20) not null,
	email varchar (30),
	subject varchar(50) not null,
	content varchar(2000) not null,
	passwd varchar(10) not null,
	reg_date datetime not null,
	readcount INT default 0,
	ref INT not null,
	re_step INT not null,
	re_level INT not null,
	ip varchar(20) not null,
	primary key(num)
);

create sequence board_seq;

drop table board;