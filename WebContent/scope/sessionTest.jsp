<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionTest.jsp</title>
</head>
<body>
		<h3>세션 session</h3>
<%
	/*
		session 내부객체
		-HttpSession session
		-요청한 사용자에게 개별적으로 접근
		-선언된 세션변수는 전역적 성격으로 유지된다
		-일정 시간동안 이벤트가 발생되지 않으면 자동삭제
	
	out.print("현재세션 유지 시간");
	out.print(session.getMaxInactiveInterval());
	out.print("초단위(30분)");
	out.print("<br>");
	*/
	
	//세션 유지 시간 변경
	//1) 
	/*
	session.setMaxInactiveInterval(60*10);
	out.print("변경된 세션 유지 시간");
	out.print(session.getMaxInactiveInterval());
	out.print("초단위(10분)");
	out.print("<br>");
	*/
	/*
	
	2) 배치관리자 /WEB-INF/web.xml
		세션시간설정, 환경설정등 지정
		web.xml 이 수정이 되면 반드시 서버를 재시작 할 것
		
		<!-- 세션 유지 시간 설정(10분) -->
		  <session-config>
		  	<session-timeout>600</session-timeout>
		  </session-config>
	*/
//-------------------------------------------------------------------
	//세션 변수
	//->myweb프로젝트의 모든 페이지에서 공유되는 전역변수
	//->별도의 자료형이 없다
	
	//세션변수 선언
	//session.setAttribute("변수명", 값)
	session.setAttribute("s_id", "soldesk");
	session.setAttribute("s_pw", "12341234");
	
	//세션변수값 가져오기
	//기본적인 자료형이 Object 형이다
	Object obj=session.getAttribute("s_id");
	String s_id=(String)obj;
	String s_pw=(String)session.getAttribute("s_pw");
	
	out.print("세션변수 s_id : "+s_id+"<hr>");
	out.print("세션변수 s_pw : "+s_pw+"<hr>");
	
	//세션 변수 강제 삭제(로그아웃);
	session.removeAttribute("s_id");
	session.removeAttribute("s_pw");
	out.print("세션변수 삭제후<hr>");
	out.print("세션변수 s_id :"+session.getAttribute("s_id")+ "<hr>");
	out.print("세션변수 s_pw:"+session.getAttribute("s_id")+"<hr>");
	
	//세션영역에 있는 모든 값 전부 강제 삭제
	//session.invalidate();
	
	//세션객체에서 발급해 주는 아니디
	out.print("세션 임시 아이디 : ");
	out.print(session.getId());
	out.print("<hr>");
//-------------------------------------------------------------------
	/* 
	application 내부객체 : 서버에 대한 정보를 관리하는 객체
	-ServeletContext application
	-서버에 대한 정보를 관리하는 객체
	-선언되 application변수도 전역적 성격의 객체
	*/
	// /bbs폴더의 실제 물리적인 경로
	// 실제경로 D:\java0514\workspace\myweb\WebContent\\bbs
	// 웹경로    http://172.16.83.15:8090/myweb/bbs
	out.print(application.getRealPath("/bbs"));
	out.print("<br>");
	out.print(request.getRealPath("/bbs"));
	out.print("<br>");
	
	//application 내장변수
	application.setAttribute("uname", "손흔민");
	out.print(application.getAttribute("uname"));
//---------------------------------------------------------------
	//response 내부객체
	//->요청한 사용자에세 응답할때
	
	//페이지 이동
	response.sendRedirect("파일명");
	
	//요청한 사용자에세 응답 메세지 전손
	PrintWriter writer=response.getWriter();
%>	
</body>
</html>