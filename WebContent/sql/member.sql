-- member.sql
-- 회원테이블
CREATE TABLE member (
    id       VARCHAR(10)  NOT NULL, -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼 
    passwd   VARCHAR(10)  NOT NULL, -- 패스워드
    mname    VARCHAR(20)  NOT NULL, -- 성명
    tel      VARCHAR(14)  NULL,     -- 전화번호
    email    VARCHAR(50)  NOT NULL  UNIQUE, -- 전자우편 주소, 중복 안됨
    zipcode  VARCHAR(7)   NULL,     -- 우편번호, 101-101
    address1 VARCHAR(255) NULL,     -- 주소 1
    address2 VARCHAR(255) NULL,     -- 주소 2(나머지주소)
    job      VARCHAR(20)  NOT NULL, -- 직업
    mlevel   CHAR(2)      NOT NULL, -- 회원 등급, A1, B1, C1, D1, E1, F1
    mdate    DATE         NOT NULL, -- 가입일    
    PRIMARY KEY (id)
);

--mySQL DB 생성
CREATE TABLE member (
    id       VARCHAR(10)  NOT NULL , -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼 
=======
--mySQL
CREATE TABLE member (
    id       VARCHAR(10)  NOT NULL, -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼
    passwd   VARCHAR(10)  NOT NULL, -- 패스워드
    mname    VARCHAR(20)  NOT NULL, -- 성명
    tel      VARCHAR(14)  NULL,     -- 전화번호
    email    VARCHAR(50)  NOT NULL  UNIQUE, -- 전자우편 주소, 중복 안됨
    zipcode  VARCHAR(7)   NULL,     -- 우편번호, 101-101
    address1 VARCHAR(255) NULL,     -- 주소 1
    address2 VARCHAR(255) NULL,     -- 주소 2(나머지주소)
    job      VARCHAR(20)  NOT NULL, -- 직업
    mlevel   CHAR(2)      NOT NULL, -- 회원 등급, A1, B1, C1, D1, E1, F1
    mdate    DATETIME         NOT NULL, -- 가입일    
    PRIMARY KEY (id)
);

drop table member;
문제1)  member 테이블 생성하시오

문제2) 테스트용 행추가를 하시오(3개 정도)

insert into member(id,passwd,mname,tel,email,zipcode,address1,address2,job,mlevel,mdate)
values ('soldesk','12341234','솔데스크','123-4567','soldesk@naver.com','12345','서울시 종로구 관철동','코아빌딩5층','A01','D1','2019-09-11');

insert into member(id,passwd,mname,tel,email,zipcode,address1,address2,job,mlevel,mdate)
values ('user','12341234','솔데스크','123-4567','user1@naver.com','12345','서울시 종로구 관철동','코아빌딩5층','A01','D1','2019-09-11');

insert into member(id,passwd,mname,tel,email,zipcode,address1,address2,job,mlevel,mdate)
values ('webmaster','12341234','솔데스크','123-4567','webmaster@naver.com','12345','서울시 종로구 관철동','코아빌딩5층','A02','A1','2019-09-11');

--회원로그인 성공하면 회원등급 가져오기
select mlevel
from member
where id=? and passwd=?
and mlevel in ('A1','B1','C1','D1');

--아이디 중복 확인 

select count(*)
from member
where id=?