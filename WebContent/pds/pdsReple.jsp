<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
<%
	int pdsno=Integer.parseInt(request.getParameter("pdsno"));
	String id=(String)session.getAttribute("s_id");
	String reple=request.getParameter("reple");
	
	int cnt=dao.repleset(pdsno,id,reple);
	if(cnt==0){
		out.println(" <script>");	
		out.println(" alert('로그인후 댓글을 작성할 수 있습니다.');");	
		out.println(" history.back();");	
		out.println(" </script>");	
	}else{
		out.println(" <script>");
		out.println(" alert('댓글이 입력되었습니다.');");
		out.println(" window.location=document.referrer;");
		out.println(" </script>");
	}



%> 본문내용을 작성하세요!!
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>