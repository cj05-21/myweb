<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>* 사진 올리기 *</h3>
<%
	String id=(String)session.getAttribute("s_id");
	String passwd=(String)session.getAttribute("s_passwd");
	String str=Utility.checkNull(id);
			
%>
	<div class="container">
	<form name="photoForm"
			  method="post"
			  enctype="multipart/form-data"
			  action="pdsIns.jsp"
			  onsubmit="return pdsCheck(this)">

	<table class="table">
	<tr>
		<th>성명</th>
		<td><input type="text"  name="wname"  size="20"  maxlength="100" value="<%if(s_id=="guest"){out.print(str);}else{out.print(id);}%>"   required autofocus></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><textarea rows="5" cols="30" name="subject"></textarea></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password"  name="passwd"  value="<%=passwd%>" readonly></td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td><input type="file"  name="filename" ></td>
	</tr>
	<tr>
		<td colspan="2">
		 	<input type="submit" value="제출" class='btn btn-warning'>
		 	<input type="reset" value="취소" class='btn btn-warning'>
		</td>
	</tr>
	</table>		 
	</form>
	</div> 

<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>