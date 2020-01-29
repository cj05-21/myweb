<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
		<h3>* 로 그 인 *</h3>
<c:if test="${empty sessionScope.memid }">
		<%
		//사용자 pc 에 저장된 쿠키값 가져오기
		Cookie[] cookies=request.getCookies();
		String c_id="";
		if(cookies!=null){//쿠키가 존재한다면
			for(int idx=0; idx<cookies.length; idx++){
				Cookie item=cookies[idx];
				if(item.getName().equals("c_id")==true){
					c_id=item.getValue();
				}
			}//for end
		}//if end
		%>
		<form name="loginfrm"
				 method="post"
				 action="loginproc.do"
				 onsubmit="return loginCheck(this)">	 
		<div class="container">
		<table class="table table-striped">
		<tr>
		<td>
		<input type="text" name="id" placeholder="아이디"  value="<%=c_id%>" required>
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
		<a href="../member/agreement.jsp">회원가입</a>
		&nbsp;&nbsp;
		아이디/비밀번호
		</td>
		</tr>
		</table>
		</div>
		</form>
</c:if>

<c:if test="${sessionScope.memid !=null }">
	<div class="container">
	<table width="500" cellpadding="0" cellapacing="0" align="center" >
		<tr>
			<td rowspan="3" align="center">
			${sessionScope.memid }님이 방문하셨습니다.<br><br>
			<form method="post" action="./logout.do" style="float:left;">
				<input type="submit" value="로그아웃" class="btn btn-warning">
				&nbsp;
			</form>
			
			<form method="post" action="./modifyform.do" style="float:left;">
				<input type="hidden" name="id" value="${sessionScope.memid }">
				<input type="submit" value="회원정보변경" class="btn btn-warning">
				&nbsp;
			</form>
			
			<form method="post" action="./withdrawForm.do" style="float:left;">
				<input type="submit" value="회원탈퇴" class="btn btn-warning">
				&nbsp;
			</form>
			
			</td>	
		</tr>
	</table>
	</div>
</c:if>		
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>