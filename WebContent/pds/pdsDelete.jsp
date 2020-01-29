<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>* 등록 사진 삭제 *</h3>
	※비밀번호를 입력해 주세요
	
	<div class="container">
		<form method="post"
		      action="pdsDeleteProc.jsp"
			  onsubmit="return pwCheck(this)">
		<table>
			<tr>
			<th>비밀번호 :</th>
			<td><input type="password" name="passwd" size="20" maxlength="10" required></td>
			<td><input type="submit" name="확인" value="확인" class="btn btn-warning">
				<input type="hidden" name="pdsno" value="<%=Integer.parseInt(request.getParameter("pdsno"))%>">
			</td>
			
			</tr>	
		</table>
		</form>	
	</div>
	<script>
	
	</script>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>