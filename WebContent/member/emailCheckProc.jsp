<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="ssi.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emailCheckForm.jsp</title>
</head>
<body>
	<div style="text-align: center;">
		<h3>* 이메일 중복확인 결과 *</h3>
	
<%
	String email= request.getParameter("email").trim();
	int cnt=dao.duplecateEmail(email);
	out.println("입력 이메일 : <strong>"+email+"</strong>");
	if(cnt==0){
		out.println("<p>사용 가능한 이메일 입니다!!</p>");
		out.println("<a href='javascript:applye(\""+email+"\")'>[적용]</a>");
%>
<script >

function applye(email){
	//중복확인 id를 부모창에 적용
	//부모창 opener
	opener.document.regForm.email.value=email;
	window.close();
}//apply() end
</script>

<% 		
		
	}else{
		out.println("<p style='color:red'>해당 이메일는 사용할 수 없습니다.</p>");
	}
%>	
	<hr>
	<a href="javascript:history.back()">[다시검색]</a>
	&nbsp;&nbsp;
	<a href="javascript:window.close()">[창닫기]</a>
	
	
	</div>
</body>
</html>