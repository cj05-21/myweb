<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>    
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>* 글 수정 *</h3>
	<form method="post"
			 action="bbsUpdateForm.jsp"
			 onsubmit="return pwCheck(this)">
	<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>">
	<input type="hidden" name="col" value="<%=col%>">
	<input type="hidden" name="word" value="<%=word%>">
	<div class="container">
	<table class="table">
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="passwd"  size="10" maxlength="10" required ></td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="submit" name="확인"  value="확인" class="btn btn-warning">
		</td>
	</tr>
	</table>	
	</div>	 
	</form>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>