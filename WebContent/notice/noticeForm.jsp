<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>* myWeb 공지사항 *</h3>

	<div class="container">
	<form method="post"
		   action="noticeIns.jsp"
		   onsubmit="return noticeCheck(this) ">
	<table class="table" border="1">
	<tr>
	<th>게시판 : <select name="conf"  id="conf">
          <option value="A1">안내</option>
          <option value="A2">점검</option>
        		</select></th> 
	</tr>
	<tr>
	<th> 제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="subject" size="35%" maxlength="50" placeholder="공지사항 제목을 입력하세요" autofocus required></th>
	</tr>
	<tr>
	<th> 글쓰기<br> 
	 <textarea name="content" rows="10%" cols="40%" required></textarea></th>
	</tr>
	</table>	   
	<input type="submit" name="등록" value="등록" class="btn btn-warning">
	<input type="reset" name="취소" value="취소" class="btn btn-warning">
	</form>
	</div>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>