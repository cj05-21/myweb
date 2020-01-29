<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    //logout.jsp
    session.removeAttribute("s_id");
    session.removeAttribute("s_passwd");
    session.removeAttribute("s_mlevel");
    
    response.sendRedirect("loginForm.jsp");
%>