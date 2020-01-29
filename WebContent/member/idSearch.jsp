<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	
	<h3> 이메일로 아이디 찾기</h3>
		<p style="font-size: 15px">※ 본인확인 이메일 주소와 입력한 이메일 주소가 같아야,<br>아이디를 찾을 수 있습니다.</p>
		<div class="container">
		<Form method="post" action="idSearchForm.jsp" onsubmit="">
		<table>
		<tr>
		<td><Strong>이름&nbsp;&nbsp;&nbsp;:</Strong>&nbsp;<input type="text"  name="mname" autofocus></td>
		</tr>
		<tr>
		<td><Strong>이메일:</Strong>&nbsp;<input type="text"  name="email" autofocus></td>
		</tr>
		</table>
		<div style="align:left;">
		<input type="submit" name="찾기" value="찾기" > 
		<input type="reset" name="취소" value="취소" >
		</div>
	</Form>
		</div>
		<br>
<a href="idSearch.jsp">아이디 찾기</a>/<a href="pwSearch.jsp">비밀번호 찾기</a>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>