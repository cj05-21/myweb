<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"  %>
  <%--공통페이지 이기 때문에 import 나 usebean 인코딩 을 한페이지에 넣어 놨다  --%>  
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
<%

	String wname= request.getParameter("wname").trim();
	String subject= request.getParameter("subject").trim();
	String content= request.getParameter("content").trim();
	String passwd= request.getParameter("passwd").trim();
	String ip= request.getRemoteAddr();//요청 PC 의 IP 주소
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	
	dto.setBbsno(bbsno);
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setIp(ip);

	 int cnt=dao.reply(dto);
	
	 if(cnt==0){
         out.println("<p>답변 실패했습니다</p>");
         out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
     }else{
         out.println("<script>");
         out.println("  alert('답변글이 입력되었습니다');");
         out.println("  location.href='bbsList.jsp?col="+col+"&word="+word+"&nowPage="+nowPage+"';");//목록페이지이동
         out.println("</script>");
     }//if end
%>	
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>