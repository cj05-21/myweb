<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
<h3> * 등록 사진 수정* </h3>
<%
	int pdsno=Integer.parseInt(request.getParameter("pdsno"));
	String passwd=request.getParameter("passwd");
	
	 	dto=dao.pdsRead(pdsno,passwd);
		if(dto==null){
			out.println(" <script>");
			out.println(" 	alert('비밀번호가 일치하지 않습니다');");
			out.println(" 	history.back();");
			out.println(" </script>");
		
		}else{
%>
		<div class="container">
		<form name="photoForm"
				  method="post"
				  enctype="multipart/form-data"
				  action="pdsUpdatProc.jsp?pdsno=<%=dto.getPdsno()%>"
				  onsubmit="return pdsCheck(this)">
		
		<table class="table">
		<tr>
			<th>성명</th>
			<td><input type="text"  value="<%=dto.getWname()%>" name="wname"  size="20"  maxlength="100" required autofocus></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><textarea rows="5" cols="30" name="subject"><%=dto.getSubject()%></textarea></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password"  name="passwd"  value="<%=dto.getPasswd()%>" readonly></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td><input type="file"  name="filename" ></td>
		</tr>
		<tr>
			<td colspan="2">
			 	<input type="submit" value="수정" class='btn btn-warning'>
			 	<input type="reset" value="취소" class='btn btn-warning'>
			</td>
		</tr>
		</table>		 
		</form>
		</div> 

<% 		
			
		}

%>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>