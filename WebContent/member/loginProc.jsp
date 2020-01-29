<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>    
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>*로그인 결과*</h3>
<%
	String id= request.getParameter("id").trim();
	String passwd= request.getParameter("passwd").trim();
	dto.setId(id);
	dto.setPasswd(passwd);
	String mlevel=dao.loginProc(dto);
	if(mlevel==null){
		out.print(" <script>");
		out.print(" alert('아이디/비번 다시 한번 확인해주세요');");
		out.print(" history.back();");
		out.print(" </script>");
	}else{
	//out.print("<p>로그인 성공!!!</p>");
	//out.print(mlevel);
	//다른 페이지에서 로그인 상태를 공유할수 잇도록
	session.setAttribute("s_id", id);
	session.setAttribute("s_passwd", passwd);
	session.setAttribute("s_mlevel", mlevel);
	
	//쿠키(아이디저장)-------------------------------------------------------------
	String c_id=Utility.checkNull(request.getParameter("c_id"));
	Cookie cookie=null;
	if(c_id.equals("SAVE")){ //아이디 저장 체크를 했다면
			//쿠키변수 선언
			//new Cookie("쿠키변수",값)
			cookie=new Cookie("c_id",id);
			//쿠키의 생존기간, 1개월
			cookie.setMaxAge(60*60*24*30);
	}else{
			cookie=new Cookie("c_id","");
			cookie.setMaxAge(0);
	}//if end
	
	//요청한 사용자 PC에 쿠키값을 저장(팩스 형태대로 사용자 PC에 저장을 해준다)
	response.addCookie(cookie);
	//-------------------------------------------------------------------------------
	
	//첫페이지로 이동
	String root=Utility.getRoot();
	response.sendRedirect(root+"/index.jsp");  
	}
%>	
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>