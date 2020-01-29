<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp"%>

<%@ include file="../header.jsp"%>

<!-- 본문시작  -->
	<h2></h2>
	<h2>* 회원 탈퇴 *</h2>
		<%
		String id=(String)session.getAttribute("s_id");
		String passwd=request.getParameter("passwd");
		dto.setId(id);
		dto.setPasswd(passwd);
		int cnt=dao.memberDelete(id,passwd);
		
		if(cnt==0){
			out.println("<script>");
		    out.println("   alert('비밀번호가 일치하지 않습니다');");
		    out.println("   location.href='history.back();");
		    out.println("</script>");
		}else{
			out.println("<script>");
		    out.println("   alert('탈퇴가 완료되었습니다!!');");
		    out.println("   location.href='../member/logout.jsp'");
		    out.println("</script>");
		}
		
		%>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>