<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>*회원정보 탈퇴 확인*</h3>
	※비밀번호를 입력해 주세요
	
	<div class="container">
	<form method="post"
		   action="memberDeleteProc.jsp"
		   onsubmit="return pwcheck(this)">
	<table>
	<tr>
	<th>아이디:</th>
	<th colspan="3" style="text-align:center"><%=s_id%></th>
	</tr>
	<tr>
	<th>비밀번호:</th>
	<td><input type="password" name="passwd"  size="20" maxlength="10" required ></td>
	<td><input type="submit" name="확인" value="확인" class="btn btn-warning"></td>
	</tr>
	</table>
	</form>
	</div>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>