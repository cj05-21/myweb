<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 memberProc.jsp  -->
	<h3>* 공지사항 수정 결과*</h3>
<%
		int noticeno=Integer.parseInt(request.getParameter("noticeno").trim());
		String subject=request.getParameter("subject").trim();
		String content=request.getParameter("content").trim();
		String conf=request.getParameter("conf").trim();

		dto.setNoticeno(noticeno);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setConf(conf);
		int cnt=dao.noticeUpdate(dto);
		if(cnt==1){
				out.println("<script>");
				out.println(" alert('공지사항 수정이 되었습니다.');");
				out.println(" location.href='noticeList.jsp'");
				out.println("</script>");
		}
%>	

<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>