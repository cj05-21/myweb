<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>

<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
		<h3>로그인</h3>
<%
		if(s_id.equals("guest")||s_passwd.equals("guest")){
			//로그인을 하지 않은 경우
			//쿠키값 가져오기--------------------------------------
			Cookie[] cookies=request.getCookies(); //return값이 배열이다
			String c_id="";
			if(cookies!=null){//쿠키가 존재하는지?
				for(int idx=0; idx<cookies.length; idx++){
					Cookie cookie=cookies[idx];
					//쿠키변수 c_id 인지?
					if(cookie.getName().equals("c_id")==true){
						c_id=cookie.getValue();
					}//if end
				}//for end
			}//if end
			//-------------------------------------------------------
%>		
		<form name="loginfrm"
				 method="post"
				 action="loginProc.jsp"
				 onsubmit="return loginCheck(this)">
		<!--get 이 아니라 반드시 post 방식으로 해 줘야한다 -->		 
		<div class="container">
		<table class="table table-striped">
		<tr>
		<td>
		<input type="text" name="id"  value="<%=c_id %>" placeholder="아이디" required>
		</td>
		<!-- cursor: pointer 커서손모양
				<input type=image>기본속성이 submit
			 -->
		<td rowspan="2" style="align:right">
		<input type="image" src="../images/bt_login.gif" style="cursor:pointer;">
		</td>
		</tr>
		<tr>
		<td>
		<input type="password"  name="passwd" placeholder="비밀번호" required>	
		</td>
		</tr>
		<tr>
		<td colspan="2">
		<input type="checkbox" name="c_id" value="SAVE" <%if(!(c_id.isEmpty())){out.println("checked");} %>>아이디저장
		&nbsp;&nbsp;
		<a href="agreement.jsp">회원가입</a>
		&nbsp;&nbsp;
		<a href="#" onclick="idSearch();">아이디</a>/<a href="#" onclick="pwSearch();">비밀번호</a>
		</td>
		</tr>
		</table>
		</div>
		</form>
		<% 
		}else{//로그인이 성공했다면
			out.println("<strong>"+s_id+"</strong>님");
			out.println("<a href='logout.jsp'>[로그아웃]</a>");
			out.println("<br><br>");
			out.println("<a href='membermodify.jsp'>[회원정보수정]");
			out.println("<a href='deleteAgreement.jsp'>[회원탈퇴]");
		}
		%>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>