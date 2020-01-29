<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>    
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>* 글 수정 결과 *</h3>
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	String passwd=request.getParameter("passwd").trim();
	
	String wname=request.getParameter("wname").trim();
	String subject=request.getParameter("subject").trim();
	String content=request.getParameter("content").trim();
	String ip      = request.getRemoteAddr();
	
	
	dto.setBbsno(bbsno);
	dto.setPasswd(passwd);
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setIp(ip);

	
	int res=dao.updateProc(dto);
	
	if(res==0){
		out.println("<p>글 수정 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		out.println("<script>");
		out.println("  alert('글이 수정되었습니다');");
		out.println("  location.href='bbsList.jsp?col="+col+"&word="+word+"&nowPage="+nowPage+"';");//목록페이지이동
		out.println("</script>");
	}
	
%>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>