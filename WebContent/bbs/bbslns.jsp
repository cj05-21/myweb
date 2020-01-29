<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"  %>
  <%--공통페이지 이기 때문에 import 나 usebean 인코딩 을 한페이지에 넣어 놨다  --%>  
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
<%
	//1) 사용자가 입력한 정보를 변수에 담기
	String wname= request.getParameter("wname").trim();
	String subject= request.getParameter("subject").trim();
	String content= request.getParameter("content").trim();
	String passwd= request.getParameter("passwd").trim();
	String ip= request.getRemoteAddr();//요청 PC 의 IP 주소
	//2) 1) 의 내용을 dto 객체에 담기
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setIp(ip);
	//3) 2) 의 내용을 tb_bbs 테이블에 추가하기
	 int cnt=dao.insert(dto);
	//4) 글쓰기 성공후 bbsList.jsp 로 이동하기
	 if(cnt==0){
         out.println("<p>글 추가 실패했습니다</p>");
         out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
     }else{
         out.println("<script>");
         out.println("  alert('게시글이 입력되었습니다');");
         out.println("  location.href='bbsList.jsp';");//목록페이지이동
         out.println("</script>");
     }//if end
%>	
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>