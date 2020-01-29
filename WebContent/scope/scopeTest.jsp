<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scopeTest.jsp</title>
</head>
<body>
		<h3>웹페이지의 SCOPE(유효범위)</h3>
<% 		
		/* myweb 프로젝트에서 페이지들간에 값을 공유할 목적 
			-scope의 종류
			1) page			: 현재 페이지에서만 유효, 생략가능(아무것도 선택하지 않으면 기본값)
			2) request		: 서로 연결되어져 있는 모든 페이지에서 유효(부모페이지와 자식페이지에서만 유효)
								부모가 자식을 부를 수 있음 
								ex) bbsDel.jsp(부모)  와 bbsDelProc.jsp(자식)
								서로 부른 페이지에 한에서만 값을 공유하는것이 가능하다
			3) session		: 모든 페이지에서 유효(사용자 개별 접근, 시간) 
								한번 값을 올리면 '나'한에서만 모든페이지에서 사용할 수 있다.
								어느정도 시간이 지나면 사라지기 때문에 로그인 정보와 같은 것을 session에 저장
								그렇기때문에, 어느시간이 지나면 로그아웃 되는 이유도 그러하기 때문
			4) application	: 모든 페이지에서 유효(모든 사용자 접근, 서버정보)
			
			
			-웹페이지의 내장변수 선언형식
			(별도의 자료형이 없다)
			1) pageContext.setAttibute("변수명",값)
			2) request.setAttribute("변수명",값 );
			3) session.setAttribute("변수명",값 );
			4) application.setAttribute("변수명",값 );
			
			-각 SCOPE의 변수값 얻어오기
			1) pageContext.getAttibute("변수명")
			2) request.getAttribute("변수명" );
			3) session.getAttribute("변수명" );
			4) application.getAttribute("변수명" );
			
			-각 SCOPE의 변수 삭제하기
			1) pageContext.removeAttibute("변수명")
			2) request.removeAttribute("변수명" );
			3) session.removegetAttribute("변수명" );
			4) application.removegetAttribute("변수명" );
		*/
//각 SCOPE에 내장 변수를 이용해서 값 올리기		
		pageContext.setAttribute("kor",100);
		request.setAttribute("eng",200);
		session.setAttribute("mat",300);
		application.setAttribute("uname","SOLDESK");
		
//SCOPE영역의 값 가져오기		
		Object obj=pageContext.getAttribute("kor");
		int kor =(int)obj;
		int eng=(int)request.getAttribute("eng");
		int mat=(int)session.getAttribute("mat");
		String uname=(String)application.getAttribute("uname");
//출력
		out.print("1)pageContext 영역: "+kor+"<hr>");
		out.print("2)request 영역: "+eng+"<hr>");
		out.print("3)session 영역: "+mat+"<hr>");
		out.print("4)application 영역: "+uname+"<hr>");
/*		
		
//각 SCOPE 변수 삭제-> null값 반환
		pageContext.removeAttribute("kor");
		request.removeAttribute("eng" );
		session.removeAttribute("mat" );
		application.removeAttribute("uname" );
	
		 out.print("<p>*SCOPE영역 변수 삭제 후*</p>");
		out.print("1)pageContext 영역: "+pageContext.getAttribute("kor")+"<hr>");
		out.print("2)request 영역: "+request.getAttribute("eng")+"<hr>");
		out.print("3)session 영역: "+session.getAttribute("mat")+"<hr>");
		out.print("4)application 영역: "+application.getAttribute("uname")+"<hr>");		
*/		
//---------------------------------------------------------------------
	//request.getAttribute()
	//request.setAttribute("aver",85);
	//out.print(request.getAttribute("aver"));
	
	//request.getParameter() 프로토콜에 들어가는 값을 가져오는것
	//http://172.16.83.15:8090/myweb/scopeTest.jsp?aver=95
	//out.print(request.getParameter("aver"));

	/*
		-페이지 이동
		1) <a href=""></a>
		2) <form action=""><form>
		3) location.href=""
		4) <JSP:forward page=""></jsp:forward>
		5) response.sendRedirect("");
	*/
%>
	<!--1)  
		request.getAttribute("eng")는 null값
		<a href="scopeResult.jsp">[SCOPE결과 페이지로 이동]</a>
	-->		
	<!--2)  
		<form action="scopeResult.jsp">
		<button>[SCOPE결과 페이지로 이동]</button>
		</form>
	-->		
	<!--3)  
		<script>
		alert("SCOPE 결과 페이지로 이동");
		location.href="scopeResult.jsp"
		</script>
	-->		
	<%--4)  
		request.getAttribute("eng")는 200 접근 가능
		<jsp:forward page="scopeResult.jsp"></jsp:forward>
		
	--%>		
<%
		//5)
		//request.getAttribute("eng")는 null값
		//response.sendRedirect("scopeResult.jsp");

		//6)
		String view="scopeResult.jsp";
		RequestDispatcher rd=request.getRequestDispatcher(view);
		rd.forward(request,response);
		
		/*
		scopeTest.jsp 에서 scopeResult.jsp 이동한 경우
								scopeResult.jsp		 그 밖의 JSP페이지
		---------------------------------------------------------------								
		
		page							X							X
		request						O							X
		session						O							O
		application					O							O
		---------------------------------------------------------------
		
		*/
%>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>