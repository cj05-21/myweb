<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>    
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>* 글 삭제 *</h3>
	<p><a href="bbsForm.jsp"><button id="me" class="btn btn-warning">쓰기</button></a></p>
	<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	String passwd=request.getParameter("passwd").trim();
	dto.setBbsno(bbsno);
	dto.setPasswd(passwd);
	
	int cnt=dao.delete(dto);
	
	if(cnt==0){
	   out.println("<p>글 삭제 실패했습니다</p>");
	   out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	    }else{
	   out.println("<script>");
	   out.println("  alert('글이 삭제되었습니다'); ");
	   out.println("  location.href='bbsList.jsp?col="+col+"&word="+word+"'; ");//목록페이지이동
	   out.println("</script>");
	    }//if end
%>	
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>