<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ include file="./member/auth.jsp" %>
<!DOCTYPE html >
<html lang="ko">
<head>
 	<!-- http://localhost:8090/myweb/index.do -->
  <title>My Web</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/mystyle.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="js/myscript.js"></script>
  <style>
  </style>
</head>
<body id="myPage">
<!-- 메인 카테고리 -->
<!-- Navbar -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
<% 
		if(s_id.equals("guest")||s_passwd.equals("guest")){
%>      
        <li><a href="./member/loginForm.jsp"><strong>로그인</strong></a></li>
<% 
		}else{//로그인이 성공했다면
			out.println("<li><br><strong style='color:blue;'><a href='./member/memberRead.jsp'>"+s_id+"</a></strong>님<br>");
			out.println("<strong>환영합니다</strong></li>");
			out.println("<li><a href='./member/logout.jsp'>[로그아웃]</a></li>");
		}
%>       
        <li><a href="./bbs/bbsList.jsp"><strong>게시판</strong></a></li>
        <li><a href="./notice/noticeList.jsp"><strong>공지사항</strong></a></li>
        <li><a href="./pds/pdsList.jsp"><strong>포토갤러리</strong></a></li>
        <li><a href="./mail/mailForm.jsp"><strong>메일보내기</strong></a></li>
        <li><a href="./bbs2/bbslist.do"><strong>게시판(MVC)</strong></a></li>
        <li><a href="./member2/loginform.do"><strong>로그인(MVC)</strong></a></li>
      </ul>
    </div>
  </div>
</nav>
<!-- 메인 카테고리 끝  -->

<!-- First Container -->
<div class="container-fluid bg-1 text-center">
  <h3 class="margin" >Welcome to MyWeb</h3>
  <img src="images/pabbiyong.jpg"  class="img-responsive img-circle margin" style="display:inline" alt="Bird" width="500" height="500">
  
</div>

<!-- 본문시작 -->
<!-- Container 시작 -->
<div class="container-fluid bg-3 text-center">
  	<div class="row">
  		<div class="col-sm-12">
		  		
		  	<button  id="year" class="date" style="vertical-align:middle"></button>
		  	<button id="month" class="date" style="vertical-align:middle"></button>
		  	<button id="day" class="date" style="vertical-align:middle"></button>
		  	<button id="hour" class="date" style="vertical-align:middle"></button>
		  	<button id="minutes" class="date" style="vertical-align:middle"></button>
		  	<button id="sec" class="date" style="vertical-align:middle"></button>
  		</div>
  		<br>
  
  	</div><!-- row end -->  		
</div>
<!-- Container 끝  -->
<div id="band" class="container text-center">
 
  <iframe width="100%" height="500px" src="https://www.youtube.com/embed/I5dprMvJ0V8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  
  <h3>THE MERCHANDISE</h3>
  <p><strong style="color:#FF7F00;">- We are Cloths -</strong></p>
  <p> </p>
  <br>
 
  <div class="row">
    
    <div class="col-sm-4">
      <p class="text-center"><strong>Angel 라운드 티셔츠</strong></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="./images/pupyangel/TS590_saintAngels.jpg" class="img-circle person" width="255" height="255">
      </a>
      
      <div id="demo" class="collapse">
        <p><strong>판매가: 19,900</strong></p>
        <p><strong>색상: 아이보리/블랙</strong></p>
        <p>&nbsp;베이직한 스트라이프 원단 티셔츠</p>
        <p>&nbsp;위트있는 퍼피엔젤 날개 라벨 포인트</p>
        <p>&nbsp;간절기 산책할 때 간편하게 착용</p>
      </div>
    </div>
    
    <div class="col-sm-4">
      <p class="text-center"><strong>MAGAGIO 레인코트</strong></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="./images/pupyangel/OW404_MAGAGIO.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
        <p><strong>판매가: 59,900</strong></p>
        <p><strong>색상: 아이보리/레드/핑크/블랙/패턴</strong></p>
        <p>&nbsp;후드 등판이 야광 프린팅</p>
        <p>&nbsp;전투기 컨셉 상어 후드 디자인</p>
        <p>&nbsp;장마시에도 산책을 빼놓을 수 없다</p>
      </div>
    </div>
    
    <div class="col-sm-4">
      <p class="text-center"><strong>퍼피엔젤® PBA™농구져지</strong></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="./images/pupyangel/TS616_military.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo3" class="collapse">
        <p><strong>판매가: 19,900</strong></p>
        <p><strong>색상: 밀리터리</strong></p>
        <p>&nbsp;사이즈가 타이트하게 제작된 티셔츠</p>
        <p>&nbsp;NBA 를 모티브로 하는 강아지 농구 져지(PBA)</p>
        <p>&nbsp;카모플라쥬 메쉬소재로 시원한 느낌의 티셔츠</p>
        <p>&nbsp;고급자수를 사용</p>
      </div>
    </div>
  
  </div>
  <br>
  <p><strong style="color:#FF7F00;">- We are HOUSE -</strong></p>
  <div class="row">
    
    <div class="col-sm-4">
      <p class="text-center"><strong>
[BD092]퍼피엔젤 키세스 하우스 (7컬러)</strong></p><br>
      <a href="#demo4" data-toggle="collapse">
        <img src="./images/pupyangel/[BD092]퍼피엔젤 키세스 하우스 (7컬러).jpg"  class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      
      <div id="demo4" class="collapse">
        <p><strong>판매가: 59,900</strong></p>
        <p><strong>색상: 7컬러(베이지,그레이,브라운,핑크,네이비,블랙)</strong></p>
        <p>&nbsp;럭셔리한 샤넬 스타일 퀼팅의 고급 하우스</p>
        <p>&nbsp;쿠션 분리 가능</p>
        <p>&nbsp;지퍼로 모두 분리되어 세탁에 용이</p>
        <p>&nbsp;울 세제 등으로 가볍게 손세탁</p>
      </div>
    </div>
    
    <div class="col-sm-4">
      <p class="text-center"><strong>[BD127]퍼피엔젤 지브라 강아지집 애견하우스</strong></p><br>
      <a href="#demo5" data-toggle="collapse">
        <img src="./images/pupyangel/[BD127]퍼피엔젤 지브라 강아지집 애견하우스.jpg"  class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo5" class="collapse">
       <p><strong>판매가: 29,900</strong></p>
        <p><strong>색상: 지브라</strong></p>
        <p>&nbsp;작은 동굴같은 형태의 하우스로 편안하고 안락함</p>
        <p>&nbsp;엄마의 손길과 같은 부드러운 소재</p>
        <p>&nbsp;고급스러운 지브라 패텅</p>
        <p>&nbsp;마치 원터치 텐트와 같이 접고 펴기가 간단하며 가벼워 이동이 편합니다.</p>
      </div>
    </div>
    
    <div class="col-sm-4">
      <p class="text-center"><strong>[BD162] 퍼피엔젤(R) MONSTER™ ST 강아지집 애견하우스</strong></p><br>
      <a href="#demo6" data-toggle="collapse">
        <img src="./images/pupyangel/[BD162] 퍼피엔젤(R) MONSTER™ ST 강아지집 애견하우스.jpg"   class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo6" class="collapse">
        <p><strong>Bass player</strong></p>
       <p><strong>판매가: 49,900</strong></p>
        <p><strong>색상: 블루,오렌지,옐로우</strong></p>
        <p>&nbsp;퍼피엔젱의 2번째 몬스터 시리즈</p>
        <p>&nbsp;동물형태의 침대입니다</p>
        <p>&nbsp;4계절 사용할 수 있는 베드 입니다</p>
        <p>&nbsp;퍼피엔젤은 동물털,가죽,거위털,등 동물 소재를 사용하지 않습니다.</p>
      </div>
    </div>
  
  </div>
</div>


<!--Footer  -->
  <footer class="container-fluid bg-4 text-center">
   <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>Bootstrap Theme Made By <a href="https://www.w3schools.com" title="Visit w3schools">www.w3schools.com</a></p>
  <p>Copyright ⓒ 2019 MYWEB</p> 
  </footer>
  <script src="js/jquery.js"></script>
  <script src="js/moment-with-locales.js"></script> 
  <script>
  showTime();
  setInterval(showTime,1000);
  createYearMonthDate();
  </script>
</body>
</html>
