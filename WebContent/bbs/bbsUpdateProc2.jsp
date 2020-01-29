<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>    
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>* 글 수정 *</h3>
	<p><a href="bbsForm.jsp"><button id="me" class="btn btn-warning">쓰기</button></a></p>
	<form method="post"
			 action="bbsUpdate.jsp"
			 onsubmit="return pwCheck(this)">
	<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>">
	<input type="hidden" name="wname" value="<%=request.getParameter("wname")%>">
	<input type="hidden" name="subject" value="<%=request.getParameter("subject")%>">
	<input type="hidden" name="content" value="<%=request.getParameter("content")%>">
	<input type="hidden" id="password" name="passwd" value="<%=request.getParameter("passwd")%>">
	<table class="table">
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="passwd" required ></td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="submit" name="확인" >
		</td>
	</tr>
	
	</table>		 
			 
	</form>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>