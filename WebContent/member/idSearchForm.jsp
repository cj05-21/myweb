<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>본인확인 이메일로 인증</h3>
<%
String mname=request.getParameter("mname");
String email=request.getParameter("email");
dto.setMname(mname);
dto.setEmail(email);

dto=dao.SearchId(dto);
if(dto==null){
	out.print(" <script>");
	out.print(" alert('입력된 정보가 틀렸습니다.');");
	out.print(" history.back();");
	out.print(" </script>");
}else{
	
%>
	입력한 회원의 아이디는 <strong style="color:#FF7F00;"><%=dto.getId() %></strong> 입니다.
	
	<br><br>
	<p><input type="button"  onclick="Close();" value="확인"></p>
	<br>
	
	<a href="pwSearch.jsp?id=<%=dto.getId()%>&email=<%=email%>&mname=<%=mname%>">비밀번호 찾기</a>
<%
}
%>
	
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>