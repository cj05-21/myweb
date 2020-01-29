<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>* 로 그 인 *</h3>
	<div align="center">
	<c:if test="${res==1 }">
		<c:set var="memid" value="${sessionScope.s_id }" scope="session"></c:set>
		<meta http-equiv="Refresh" content="0;url=/myweb/member2/loginform.do">
		<!-- <meta http-equiv="Refresh" content="0;url=/member2/loginform.do"> -->
	</c:if>
	
	<c:if test="${res==0 }">
		아이디 또는 비밀번호를 확인해주세요<br>
		<a href="javascript:history.go(-1)">[돌아가기]</a>
	</c:if>
	</div>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>