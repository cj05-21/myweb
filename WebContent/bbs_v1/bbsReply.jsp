<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>* 답변쓰기 *</h3>
<%
//부모글 가져오기
int bbsno=Integer.parseInt(request.getParameter("bbsno"));
%>	
	<form name="bbsfrm" method="post" action="bbsReplyProc.jsp" onsubmit="return bbsCheck(this)">
	<input type="hidden" name="bbsno" value="<%=bbsno%>">
	<input type="hidden" name="col" value="<%=col%>">
	<input type="hidden" name="word" value="<%=word%>">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
<div class="container">
	<table class="table table-striped">
	<tr>
		<th>작성자</th>
		<td><input type="text" name="wname" size="10" maxlength="20" required  class="form-control"></td>
		 <!-- required 는 input창에 데이터를 입력하지 않으면 form 을 보낼수 없는 속성이다 -->
	</tr>
	<tr>  
		<th >제목</th>
		<td><input type="text" name="subject" size="30" maxlength="100"  required class="form-control"></td>
	</tr>
	<tr> 	
		<th>내용</th>
		<td><textarea rows="5" cols="30" name="content" class="form-control"></textarea></td>
	</tr>
	<tr> 	
		<th>비밀번호</th>
		<td><input type="password" name="passwd" size="10" maxlength="10" required class="form-control"></td>
	</tr>	
	<tr>
		<td colspan="2"> 		
		<input type="submit"  name="btn1" value="쓰기"  class="btn btn-warning">
		<input type="reset"  name="btn1"  value="취소"  class="btn btn-warning">
	</td>
	</tr>	
	</table>		
</div>			 
<!--회원가입 처럼 여러번 코딩을 해보고 숙달하기  -->	
	
</form>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>