<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %>      
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
<h3>* 등록 사진 삭제 결과*</h3>
<%
	int noticeno=Integer.parseInt(request.getParameter("noticeno"));
	
	//
				dao.noticeDeleteRe(noticeno);
				int cnt=dao.noticeDelete(noticeno);
				if(cnt==0){
				out.println(" <script>");
				out.println(" 	alert('삭제에 실패했습니다.');");
				out.println(" 	history.back();");
				out.println(" </script>");
				}else{
				out.println(" <script>");
				out.println(" alert(' 사진 삭제 성공하였습니다!!');");
				out.println(" location.href='noticeList.jsp'");
				out.println(" </script>");
					}
					
			

	
%>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>