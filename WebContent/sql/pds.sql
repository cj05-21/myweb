-- pds.sql
-- 테이블 생성
CREATE TABLE tb_pds (
  pdsno        NUMBER           NOT NULL
  ,wname      VARCHAR2(100)     NOT NULL
  ,subject      VARCHAR2(250)   NOT NULL
  ,regdate     DATE             NOT NULL
  ,passwd      VARCHAR2(15)     NOT NULL
  ,readcnt     NUMBER           DEFAULT 0
  ,filename    VARCHAR2(250)  NOT NULL   --파일명
  ,filesize      NUMBER           DEFAULT 0  --파일크기
  ,id			VARCHAR(10)  references member(id) NOT NULL
  ,PRIMARY KEY(pdsno)
);
--mySQL
CREATE TABLE tb_pds (
      pdsno       INT            NOT NULL AUTO_INCREMENT PRIMARY KEY
      ,wname      VARCHAR(100)   NOT NULL
      ,subject    VARCHAR(250)   NOT NULL
      ,regdate    DATETIME       NOT NULL
      ,passwd     VARCHAR(15)    NOT NULL
      ,readcnt    INT            DEFAULT 0
      ,filename   VARCHAR(250)   NOT NULL
      ,filesize   INT            DEFAULT 0
      ,id         VARCHAR(10) NOT NULL
      ,FOREIGN KEY (id) references member(id)
    );
drop table tb_pds;
-- primary key(pdsno, passwd) 이렇게 모아서 기본키를 지정할때,
-- 2개를 지정할 수 있다.

-- 1)행추가
pdsno : max(일련번호)+1
wname, subject, passwd: 사용자 입력
filename, filesize :첨부파일 관련 정보
regdate: 오늘날짜
insert into tb_pds(pdsno, wname, regdate, passwd, filename, filesizem)
values((select nvl(max(pdsno),0)+1 from tb_pds)
		 ,?,?,?,?,?);
--readcnt 는 조회수 이기 때문에 기본값 0 이 들어가고, 이후에 페이지에 들어가면 +1 씩 되도록 설정
		  
-- 2)목록
select * from tb_pds
order by regdate desc;
-- 3)상세보기
select * from tb_pds where pdsno?

--mySQL 페이징
select pdsno,subject,wname,passwd,regdate,readcnt,filename,filesize
from tb_pds
order by pdsno desc
limit startRow,recordPerPage;



CREATE table tb_pds_reple(
pdsno    	NUMBER         	 references tb_pds(pdsno) NOT NULL
,reple      VARCHAR(2000) 	 NOT NULL
,resno      number(5) 		 NOT NULL
,id	        VARCHAR(10) 	 references member(id)NOT NULL	
,regdt1     DATE             NOT NULL
);


--mySQL

CREATE table tb_pds_reple(
pdsno INT NOT NULL
,reple VARCHAR(2000) NOT NULL
,resno INT NOT NULL auto_increment primary key
,id VARCHAR(10) NOT NULL
,regdt1 DATETIME default now()
,FOREIGN KEY (pdsno) REFERENCES tb_pds(pdsno)
,FOREIGN KEY (id) REFERENCES member(id)
);
drop table tb_pds_reple;

--답글과 회원 테이블 조인해서 회원 등급 가져오기

select member.id,tb.pdsno,tb.reple,tb.resno,tb.regdt1
from member join tb_pds_reple tb
on member.id=tb.id
where pdsno=?
order by resno;

