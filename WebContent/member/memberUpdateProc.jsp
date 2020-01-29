<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 memberProc.jsp  -->
	<h3>* 회원수정 결과*</h3>
<%
	//1)사용자가 입력 요청한 정보 가져오기
		String id=request.getParameter("id").trim();
		String passwd=request.getParameter("newpasswd").trim();
		String tel=request.getParameter("tel").trim();
		String zipcode=request.getParameter("zipcode").trim();
		String address1=request.getParameter("address1").trim();
		String address2=request.getParameter("address2").trim();
		String job=request.getParameter("job").trim();
	//2)1)의 내용을 dto 객체에 담기
		dto.setId(id);
		dto.setPasswd(passwd);
		dto.setTel(tel);
		dto.setZipcode(zipcode);
		dto.setAddress1(address1);
		dto.setAddress2(address2);
		dto.setJob(job);

		int cnt=dao.update(dto);
		if(cnt==1){
			out.println("<script>");
			out.println(" alert('회원수정 되었습니다! \\n로그인 페이지로 이동합니다.')");
			out.println("  location.href='loginForm.jsp'");
			out.println("</script>");
		}
%>	

<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>