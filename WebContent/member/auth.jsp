<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    //다른 페이지에서 로그인 상태를 공유할수 잇도록
    //auth.jsp
    //로그인 상태 확인 페이지
    String s_id="";
    String s_passwd="";
    String s_mlevel="";
    
    if(session.getAttribute("s_id")==null ||
	session.getAttribute("s_passwd")==null ||
	session.getAttribute("s_mlevel")==null
	){
    	s_id="guest";
    	s_passwd="guest";
    	s_mlevel="guest";
    }else{
    	s_id=(String)session.getAttribute("s_id");
    	s_passwd=(String)session.getAttribute("s_passwd");
    	s_mlevel=(String)session.getAttribute("s_mlevel");
    }  
%>