<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
<script>
alert('삭제완료.');
location.href='bbslist.do?pageNum='+${pageNum };
</script>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>