<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>    
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>* 글 삭제 *</h3>
	<p><a href="bbsForm.jsp"><button id="me" class="btn btn-warning">쓰기</button></a></p>
	<form method="post"
			 action="bbsDelProc.jsp"
			 onsubmit="return pwCheck(this)">
	<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>">
	<input type="hidden" name="col" value="<%=col%>">
	<input type="hidden" name="word" value="<%=word%>">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<table class="table">
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="passwd" required ></td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="submit" name="확인"  class="btn btn-warning">
		</td>
	</tr>
	</table>		 	 
	</form>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>