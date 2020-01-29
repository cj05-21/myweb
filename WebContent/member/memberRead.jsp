<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>     
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h2 style="align:left;">내정보를 <strong style="color:#FF7F00;">최신 정보로 관리</strong>해 주세요.</h2>
<%
	String id=(String)session.getAttribute("s_id");
	String passwd=(String)session.getAttribute("s_passwd");

	dto.setId(id);
	dto.setPasswd(passwd);
	
	dto=dao.memberRead(id, passwd);

	if(dto==null){
		out.println(" <script> ");
		out.println(" alert('회원정보를 읽어오는데 실패했습니다'); ");
		out.println("  location.href='history.back();");
		out.println(" </script> ");
	}else{
%>
	<br><br>
<div class="container" >
	
<div class="row" style="padding-bottom: 30px;">
		   <div class="col-md-4">
			<table  border="1"  bordercolor="#FF7F00"  width="300"  height="200">
			<tr height="50">
				<td style="font-size: 20px; text-align: center" >my<strong>  프로필</strong>
				</td>
			</tr>
			<tr>
				<td>
				<strong>아이디&nbsp;&nbsp;&nbsp;&nbsp;:</strong> 
				<%=dto.getId() %><br><br>
			    <strong>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong>
				<%=dto.getMname() %><br><br>
			    <strong>가입일&nbsp;&nbsp;&nbsp;:</strong>
				<%=dto.getMdate().substring(0, 10) %><br>
				
				</td>
				
			</tr>
			</table>
			</div>
	
			<div class="col-md-4">
			<table border="1"  bordercolor="#FF7F00"  width="300"  height="200">
			<tr height="50">
				<td style="font-size: 20px; text-align: center">my<strong> 연락처</strong>
				</td>
			</tr>
			<tr>
			<td>
			    <strong>연락처 이메일 &nbsp;&nbsp;:</strong>
				<%=dto.getEmail() %><br><br>
				<strong>연락처 전화번호:</strong> 
				<%=dto.getTel() %><br>
				</td>
			</tr>
			</table>
			</div>
</div>
</div>
<div class="container" >
<div class="row" style="padding-bottom: 30px;">
		   <div class="col-md-4">
			<table border="1"  bordercolor="#FF7F00"  width="300"  height="200">
			<tr height="50">
				<td style="font-size: 20px; text-align: center">my<strong> 지역 설정</strong>
				</td>
			</tr>
			<tr>
				<td>
			    <strong>기본 배송지&nbsp;&nbsp;&nbsp;:</strong><br>
				<%=dto.getAddress1()%>&nbsp;<%=dto.getAddress2() %>&nbsp;<%=dto.getZipcode()%><br><br>
				<strong>선택 배송지&nbsp;&nbsp;&nbsp; :</strong><br>
				<%=dto.getAddress1()%>&nbsp;<%=dto.getAddress2() %>&nbsp;<%=dto.getZipcode()%><br>
				</td>
			</tr>
			</table>
			</div>
	
			<div class="col-md-4">
			<table border="1"  bordercolor="#FF7F00"  width="300"  height="200">
			<tr height="50">
				<td style="font-size: 20px; text-align: center">my<strong> 회원등급</strong>
				</td>
			</tr>
			<tr>
				<td>
			    <strong >등급&nbsp;&nbsp;&nbsp;</strong>
				<p style="color:red; font-size: 50px; text-align: center"><%=dto.getMlevel()%></p><br>
				
				</td>
			</tr>
			</table>
			</div>
</div>
</div>
<div class="container" >
<div class="row" style="padding-bottom: 30px;">
			<div class="col-md-4">
			<table width="300"  height="200" >
			<tr height="50">
			<td style="text-align: right ; vertical-align: top;">
			</td>
			</tr>
			</table>
			</div>
			<div class="col-md-4">
			<table width="300"  height="200" >
			<tr height="50">
			<td style="text-align: center ; vertical-align: top;">
<%			
			out.println("<a href='membermodify.jsp'><button class='btn btn-warning'>회원정보수정</button>");
			out.println("<a href='deleteAgreement.jsp'><button class='btn btn-warning'>회원탈퇴</button>");
%>
				</td>
			</tr>
			</table>
			</div>
			
</div>
</div>
<%		
	}
%>
	
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>