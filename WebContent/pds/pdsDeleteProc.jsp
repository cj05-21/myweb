<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="ssi.jsp" %>      
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
<h3>* 등록 사진 삭제 결과*</h3>
<%
	int pdsno=Integer.parseInt(request.getParameter("pdsno"));
	String passwd=request.getParameter("passwd");
	String id=(String)session.getAttribute("s_id");
	String saveDir=application.getRealPath("/storage");
	

		int cnt=0;
	//만약 로그인이 되어있는 상태일때 등록된 갤러리 삭제	
	if(passwd!="guest"){
		dto=dao.pdsReadMem(id,passwd);
			if(dto==null){
				out.println(" <script>");
				out.println(" 	alert('비밀번호가 맞지 않거나 본인 게시물이 아닙니다.');");
				out.println(" 	history.back();");
				out.println(" </script>");
			}else{
				dao.pdsDeleteRe(pdsno);
				cnt=dao.pdsDelete(pdsno,saveDir);
					if(cnt==0){
					out.println(" <script>");
					out.println(" 	alert('삭제에 실패했습니다.');");
					out.println(" 	history.back();");
					out.println(" </script>");
					}else{
					out.println(" <script>");
					out.println(" alert(' 사진 삭제 성공하였습니다!!');");
					out.println(" location.href='pdsList.jsp'");
					out.println(" </script>");
					}
					
			}
}
	
%>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>