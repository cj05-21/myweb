<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>* 글/수/정 *</h3>
	<br><br>
	<div class="container">
	<form method="get" name="writeform" action="./bbsupdateproc.do">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="ref" value="${ref}">
	<input type="hidden" name="re_step" value="${re_step}">
	<input type="hidden" name="re_level" value="${re_level}">
	<table  border="1">
	<tr>
	<td align="right" colspan="2">
		<a href="<%=request.getContextPath()%>/bbs2/bbslist.do">글목록</a>
	</td>
	</tr>
	
	<tr>
	<td>이름</td>
	<td><input type="text" name="writer" value="${dto.writer}"></td>
	</tr>
	<tr>
	<td>제목</td>
	<td><input type="text" name="subject" value="${dto.subject}"></td>
	</tr>
	<tr>
	<td>이메일</td>
	<td><input type="text" name="email" value="${dto.email }"></td>
	</tr>
	<tr>
	<td>내용</td>
	<td><textarea name="content" rows="5" cols="35">${dto.content }</textarea></td>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><input type="password" name="passwd" value="${dto.passwd }" readonly></td>
	</tr>
	
	<tr>
	<td colspan="2" align="center">
	<input type="submit" value="글수정">
	<input type="reset" value="취소">
	<input type="button" value="목록보기" onclick="location.href='./bbslist.do'">
	</td>
	</tr>
	
	</table>
	
	</form>
	</div>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>