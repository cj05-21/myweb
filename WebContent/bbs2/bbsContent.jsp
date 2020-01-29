<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="../header.jsp"%>
<!-- 본문시작 bbsContent.jsp-->

	<h3><strong>* 글 내용 보기 * </strong></h3>
	<div class="container">
	<table border="1">
	<tr>
		<td>글번호</td>	
		<td>${article.writer}</td>	
		<td>작성일</td>	
		<td>${article.reg_date}</td>	
	</tr>
	<tr>
		<td>글제목</td>
		<td colspan="3">${article.subject }</td>
	</tr>
	<tr>
		<td>글내용</td>
		<td colspan="3">
		<%	//치환 변수 선언
			//pageContext.setAttribute("cr","\r");
			//pageContext.setAttribute("crcn","\r\n");
			pageContext.setAttribute("cn","\n");
			pageContext.setAttribute("br","<br/>");
		%>
			<%--${article.content} --%>
			<!--\n 값이 <br/>값으로 바꿔서 출력하게함  -->
			${fn:replace(article.content,cn,'<br/>') }
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<input type="button" value="글수정"  class="btn btn-warning" onclick="location.href='./bbsupdate.do?num=${article.num}&pageNum=${pageNum}'">
			<input type="button" value="글삭제"  class="btn btn-warning" onclick="location.href='./bbsdeleteform.do?num=${article.num}&pageNum=${pageNum}'">
			<input type="button" value="답변"    class="btn btn-warning" onclick="location.href='./bbsform.do?num=${article.num}&ref=${article.ref}&re_step=${article.re_step }&re_levle=${article.re_level}'">
			<input type="button" value="목록"    class="btn btn-warning"  onclick="location.href='./bbslist.do?num=${article.num}&pageNum=${pageNum}'">
		</td>
	</tr>
	</table>
	</div>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>