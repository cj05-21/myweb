1. 공지사항 개발환경 구축

1) 테이블 생성
	
	drop table tb_notice;

   create table tb_notice(
     noticeno   number           not null  -- 일련번호
    ,subject    varchar2(255)    not null  -- 제목
    ,content    varchar2(4000)   not null  -- 내용
    ,regdt      date    default  sysdate   -- 작성일
    ,id		varchar2(10)	 	not null references member(id)	--아이디
    ,conf       char(2)          not null  -- 공지 구분번호
    ,readcnt    number  default  0         -- 조회수
    ,primary key(noticeno)                 -- noticeno 기본키
   );
   
   --mysql 테이블
   create table tb_notice(
 noticeno   INT           NOT NULL primary key AUTO_INCREMENT
 ,subject    varchar(255)    NOT NULL  
 ,content    varchar(4000)  NOT NULL  
 ,regdt       DATETIME      NOT NULL
 ,id		       varchar(10)	 NOT NULL 	
 ,conf       char(2)           NOT NULL  
 ,readcnt    INT  default  0            
 ,FOREIGN KEY (id) references member(id)
  );


   	
   

※ 추가 구분번호 안내 점검 , 조회


2) 일련번호 시퀀스 생성

   create sequence noticeno_seq;
   create sequence noticeno_seq;

CREATE table tb_notice_reple(
noticeno    	NUMBER         	 references tb_notice(noticeno) NOT NULL
,reple      VARCHAR(2000) 	 NOT NULL
,resno      number(5) 		 NOT NULL
,id	        VARCHAR(10) 	 references member(id)NOT NULL	
,regdt     DATE             NOT NULL

);
   
CREATE table tb_notice_reple(
noticeno   INT  NOT NULL
,reple      VARCHAR(2000) NOT NULL
,resno      INT  primary key auto_increment NOT NULL
,id		     VARCHAR(10)	 	NOT NULL	
,regdt     datetime           	NOT NULL
,FOREIGN KEY (noticeno) references tb_notice(noticeno)
,FOREIGN KEY (id) references member(id)
);
3) JSP 작업폴더 : notice 생성


4) Package명    : net.notice


5) 자바빈즈 파일명
   net.notice.NoticeDTO
   net.notice.NoticeDAO

 

2. JSP 파일

1) 공지사항 입력폼   : noticeForm.jsp  
   - 제목, 내용에 빈 문자열이 입력되지 않도록 자바스크립트 유효성 검사 추가

2) 공지사항 추가     : noticeIns.jsp

3) 공지사항 리스트   : noticeList.jsp
   -제목, 작성일 출력

4) 공지사항 상세보기 : noticeRead.jsp

5) 공지사항 삭제     : noticeDel.jsp

6) 공지사항 수정     : noticeUpdate.jsp

 

※ 게시판 소스 참고

 

------------------------------------------------- [과제]

1) 관리자 페이지

  - 회원관리    : 회원삭제(delete)

  - 게시판관리  : 글삭제(delete)
 
  - 공지사항관리: 쓰기 / 수정 / 삭제

 

2) 메인 페이지
 
  - 로그인  : 아이디/비번 찾기
              회원정보수정 / 회원탈퇴
 
  - 공지사항: 목록/상세보기