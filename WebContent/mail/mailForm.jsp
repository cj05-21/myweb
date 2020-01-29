<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="../header.jsp"%>
<!-- 본문시작 mailForm.jsp   -->
	<h3>* 메일 보내기 *</h3>
	<div class="container" >
	<form method="post"
			 action="mailProc.jsp">
			 <table class="table" >
			<tr>
			 <th>받는사람</th>
			 <td><input type="text" name="to"></td>
			 </tr>
			<tr>
			 <th>보내는 사람</th>
			 <td><input type="text" name="from"></td>
			 </tr>
			<tr>
			 <th>제목</th>
			 <td><input type="text" name="subject"></td>
			 </tr>
			<tr>
			 <th>내용</th>
			 <td><textarea rows="10" cols="30" name="content"></textarea></td>
			 </tr>
			<tr>
			 <td>
			 	<input type="submit" value="메일보내기" class='btn btn-warning'>
			 	<input type="reset" value="취소" class='btn btn-warning'>
			 </td>
			 </tr>
			 </table>
	</form>
	</div>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>