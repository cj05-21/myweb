<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	
<%
	String id=(String)session.getAttribute("s_id");
	String subject=request.getParameter("subject").trim();
	String content=request.getParameter("content").trim();
	String conf=request.getParameter("conf").trim();
	dto.setId(id);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setConf(conf);
	int cnt=dao.noticeIns(dto);
	if(cnt==0){
		out.println("<script>");
		out.println("	alert('공지사항 등록 실패했습니다.');");
		out.println("	history.back();");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("	alert('공지사항 등록 성공했습니다.');");
		out.println("	location.href='noticeList.jsp'");
		out.println("</script>");
	}
%>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>