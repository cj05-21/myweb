- bbs.sql
- 답변형게시판 (댓글)
=>(강사님 曰)테이블 설계는 신입들한테 맞기지 않고, 테이블을 주어진다음에 CRUD 작업만 하게 한다

create table tb_bbs(
  bbsno   	 number(5)       not null -- 일련번호 -99999~99999
 ,wname   	 varchar2(20)     not null -- 작성자
 ,subject 		 varchar2(100)   not null -- 글제목
 ,content  	 varchar2(2000)  not null -- 글내용
 ,passwd  	 varchar2(10)     not null -- 글비밀번호 ( 강사님 曰 올라오는 글을 함부로 지우면 안된다)
 ,readcnt  	 number(5)       default 0 not null -- 글조회수
 ,regdt    date            default  sysdate -- 글작성일
 ,grpno   		 number(5)       not null  -- 글 그룹번호
 ,indent   	 number(5)       default 0 -- 들여쓰기
 ,ansnum  	 number(5)       default 0 -- 글순서
 ,ip      		 varchar2(15)     not null -- 글 IP		(작성자의 IP가 들어가 있다)
 ,primary key(bbsno)                --bbsno 기본키   (조회할때 수정할때 삭제할때)
);
--mySQL DB 생성
CREATE TABLE tb_bbs (
       bbsno        INT           NOT NULL AUTO_INCREMENT PRIMARY KEY
       ,wname       VARCHAR(20)   NOT NULL
       ,subject     VARCHAR(100)  NOT NULL
       ,content     TEXT          NOT NULL
       ,grpno       TINYINT       NOT NULL
       ,indent      TINYINT       DEFAULT 0    NOT NULL
       ,ansnum      TINYINT       DEFAULT 0    NOT NULL
       ,regdt       DATETIME      NOT NULL
       ,passwd      VARCHAR(15)   NOT NULL
       ,readcnt     INT           DEFAULT 0    NOT NULL
       ,ip          VARCHAR(15)   NOT NULL
  );
--  새글쓰기
	bbsno			:max(bbsno)+1
	wname, subjectm content, passwd : 사용자입력
	default 값 	: readcnt, regdt, ansnum
	grpno			: max(bbsno)+1
	ip				: request 내부객체에서 사용자PC의 IP 정보를 가져옴

-- 행추가
insert into tb_bbs(bbsno, wname, subject, content, passwd, grpno, ip)
values(
			(select nvl(max(bbsno),0)+1 from tb_bbs)
			, '가을비'
			, '가을에 무슨 장마'
			, '여름 다 가고 가을인데'
			, '1234'
			,(select nvl(max(bbsno),0)+1 from tb_bbs)
			,'172.83.16.1' 
);

--행 갯수
select count(*) from tb_bss;

--글삭제
delete from tb_bbs
where passwd=? and bbsno=?

[새글쓰기]
grpno   -> 최대값(bbsno)+1
indent  -> 0
ansnum  -> 0

[답변(댓글)쓰기]
grnpno  -> 부모그룹번호
indent  -> 부모들여쓰기+1
ansnum  -> 부모글순서+1하고 나머지 글순서 재조정
           update tb_bbs set ansnum=ansnum+1
           where grpno=1 and ansnum>4
   
bbsno subject      grpno indent ansnum
2     일본         2      0      0
      ▶도쿄       2
      ▶오사카     2
      ▶후쿠시마   2
1     대한민국     1      0      0
      ▶종로구     1      1      1
      ▶▶인사동   1      2      2
      ▶▶▶탑골   1      3      3
      ▶▶▶솔데   1      3      4
            803호  1      4      5
      ▶▶관철동   1      2      5->6
      ▶강남구     1      1      6->7
      ▶마포구     1      1      7->8


[내용출력할때 특수문자]
엔터 -> <br>
--'    -> &apos;
--"    -> &quot;




문제 1) 부모글에 달려있는 댓글 갯수 구하기
			제목		댓글개수
		======= 		=========
		추석연휴				5
		대한민국				2
		무궁화					0
		오필승코리아			1



--출력 칸수 조절 하기
col subject for a20;

--1) 
select subject, grpno, indent, ansnum
from tb_bbs
order by grpno desc , indent asc;

--2) grpno가 동일한 행을 그룹화하고, 행갯수를 구한다
select grpno, count(grpno) as cnt
from tb_bbs
group by grpno;

--3) 2 )에서 나온 갯수는 부모글+ 자식글 이므로
-- 	갯수에서 -1 을 한다
select grpno, count(grpno)-1 as cnt
from tb_bbs
group by grpno;
※그룹번호가 같은 갯수를 조회하면 부모글도 포함하여 글의 개수를 조회 한 거기 때문에 -1을 해준다

--4) 3)의 논리적 테이블에 셀프(이너)조인해서
-- 	  최초 부모글 제목 가져오기

select AA.grpno, AA.cnt, tb_bbs.subject , tb_bbs.indent
from(
		select grpno, count(grpno)-1 as cnt
		from tb_bbs
		group by grpno
		) AA inner join tb_bbs
on AA.grpno=tb_bbs.grpno
where tb_bbs.indent=0--최초 부모글
order by AA.grpno desc;






문제2) 목록중에서 위에서부터 5건을 조회
--페이징
--rownum(줄번호) 활용
1)
select subject, grpno, ansnum
from tb_bbs
order by grpno desc, ansnum asc;

2) rownum 추가
select rownum,subject, grpno, ansnum
from tb_bbs
order by grpno desc, ansnum asc;

3) 1)의 SQL문을 셀프조인 후 rownum추가
select rownum,subject, grpno, ansnum
from
(select subject, grpno, ansnum
from tb_bbs
order by grpno desc, ansnum asc
)AA;

4) 줄번호 1~5 조회
select rownum,subject,grpno, ansnum
from(
	select subject, grpno, ansnum
	from tb_bbs
	order by grpno desc, ansnum asc	
)AA
where rownum>=1 and rownum<=5;

5) 줄번호 6~10 조회
select rownum,subject,grpno, ansnum
from(
	select subject, grpno, ansnum
	from tb_bbs
	order by grpno desc, ansnum asc	
)AA
where rownum>=6 and rownum<=10;
//6~10 의 줄번호를 조회 하면 조회가 되지 않는다(중간번호를 조회하면 조회가 안된다)

6) 줄번호가 있는 3) 의 테이블을 한번 더 셀프조인하고
	rownum칼럼명을 rnum으로 바꾼다

select rnum, subject, grpno, ansnum
from(
		select rownum as rnum,subject,grpno,ansnum
		from(
		select subject,grpno,ansnum
		from tb_bbs
		order by grpno desc, ansnum asc
		)
)
where rnum>=6 and rnum<=10;

7) 페이징+검색
	제목에서 '솔데스크' 검색해서 2페이지 출력
select rnum, subject, grpno, ansnum
from(
		select rownum as rnum,subject,grpno,ansnum
		from(
		select subject,grpno,ansnum
		from tb_bbs
		where subject like '%솔데스크%'
		order by grpno desc, ansnum asc
		)
)
where rnum>=1 and rnum<=10;

--mySQL 페이징 

select bbsno,subject,wname,readcnt,indent,regdt
from tb_bbs
order by grpno desc, ansnum asc
limit 0,10;





create table tb_reple(
  bbsno      number(5)        not null references tb_bbs(bbsno)  -- 일련번호 -99999~99999
 ,reple      varchar2(2000)   not null 							-- 댓글내용
 ,resno      number(5) 		  primary key not null 				-- 댓글 번호 
 ,ip         varchar2(15)     not null							 -- 댓글 IP		(작성자의 IP가 들어가 있다)
 ,regdt1      date            default  sysdate 					-- 글작성일
 ,id		 VARCHAR(10)     NOT NULL references member(id)
);
--mySQL 생성
create table tb_reple(
  bbsno      INT  	     not null		
 ,reple     varchar(2000) not null
 ,resno      INT         not null AUTO_INCREMENT PRIMARY KEY		
 ,ip        varchar(15) not null						
 ,regdt1      DATETIME     default now()				
 ,id	     VARCHAR(10)   NOT NULL 
 ,FOREIGN KEY (id) references member(id)
 ,FOREIGN KEY (bbsno) references tb_bbs(bbsno)
 );

 drop table  tb_reple;



		
--댓글 개수 불러오기
select count(*)
from tb_reple;
