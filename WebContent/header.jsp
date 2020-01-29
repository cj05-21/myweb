<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ include file="./member/auth.jsp" %>
<!DOCTYPE html >
<html lang="ko">
<head>
  <title>My Web</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="../css/mystyle.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

  
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="../js/myscript.js"></script>
  
  <style>
     td{ text-align:left; padding:8px; } 
  </style>
</head>
<body>
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
        <li><a href="../member/loginForm.jsp"><strong>로그인</strong></a></li>
<% 
		}else{//로그인이 성공했다면
			out.println("<li><br><strong style='color:blue;'><a href='../member/memberRead.jsp'>"+s_id+"</a></strong>님<br>");
			out.println("<strong>환영합니다</strong></li>");
			out.println("<li><a href='../member/logout.jsp'>[로그아웃]</a></li>");
		}
%>       
        <li><a href="../bbs/bbsList.jsp"><strong>게시판</strong></a></li>
        <li><a href="../notice/noticeList.jsp"><strong>공지사항</strong></a></li>
        <li><a href="../pds/pdsList.jsp"><strong>포토갤러리</strong></a></li>
        <li><a href="../mail/mailForm.jsp"><strong>메일보내기</strong></a></li>
        <li><a href="../bbs2/bbslist.do"><strong>게시판(MVC)</strong></a></li>
        <li><a href="../member2/loginform.do"><strong>로그인(MVC)</strong></a></li>
      </ul>
    </div>
  </div>
</nav>
<!-- 메인 카테고리 끝  -->

<!-- 본문시작 -->
<!-- Container 시작 -->
  <div class="container-fluid bg-3 text-center">
  	<div class="row">
  		<div class="col-sm-12">
  		
  		
  	
