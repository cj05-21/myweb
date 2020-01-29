<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3> 이메일로 비밀번호 찾기</h3>
		
		<p style="font-size: 15px">※등록된 이름, 아이디와 이메일을 입력해 주세요</p>
		
		<div class="container">
		<Form method="post" action="pwSearchForm.jsp" onsubmit="">
		<table>
	
		<tr>
		<td><Strong>아이디&nbsp;:</Strong>&nbsp;<input type="text"  name="id" autofocus></td>
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

<a href="idSearch.jsp">아이디 찾기</a>/<a href="pwSearch.jsp">비밀번호 찾기</a>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>