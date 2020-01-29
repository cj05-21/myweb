<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="net.utility.Utility"%>
<%@page import="javax.mail.Session"%>
<%@page import="net.utility.MyAuthenticator"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="../header.jsp"%>
<!-- 본문시작 mailForm.jsp   -->
	<h3>* 메일 보내기  결과*</h3>
<%
	//1) 메일서버(POP3/SMTP)
	String mailServer="mw-002.cafe24.com";
	Properties props=new Properties();
	props.put("mail.smtp.host",mailServer);
	props.put("mail.smtp.auth","true");
	
	//2) 1) 메일 서버에서 인증받은 계정과 비번이 있어야함
	Authenticator myAuth=new MyAuthenticator();
	
	//3) 1) 과 2) 가 유효한지 검증
	Session sess=Session.getInstance(props,myAuth);
	//out.print("메일 서버 인증 성공!!!");
	
	//4) 메일 보내기
	try{
			request.setCharacterEncoding("UTF-8");
		    String to = request.getParameter("to").trim();
		    String from = request.getParameter("from").trim();
		    String subject = request.getParameter("subject").trim();
		    String content = request.getParameter("content").trim();
		    
			//엔터 및 특수문자 변경
			content= Utility.convertChar(content);
			
			//메일 관련 메세지 작성
			Message msg= new MimeMessage(sess);
			
			//받는사람
			InternetAddress[] address={
					new InternetAddress(to)
			};
			/* 수신인 여러명
				InternetAddress[] address={
					new InternetAddress(to1),
					new InternetAddress(to2),
					new InternetAddress(to3)
			}
			*/
			
			msg.setRecipients(Message.RecipientType.TO, address);
			
			//보내는 사람
			msg.setFrom(new InternetAddress(from));
			
			//메일 제목
			msg.setSubject(subject);
			
			//메일 내용
			msg.setContent(content,"text/html; charset=UTF-8");
			
			//보낸 날짜
			msg.setSentDate(new Date());
			
			//메일 전송
			Transport.send(msg);
			out.print(to+"님에게 메일이 발송되었습니다.");
	}catch(Exception e){
		out.println("<p>메일 전송 실패!!"+e+"</p>");
		out.println("<p><a href='javascript:history.back();'>[다시시도]</a><p>");
	
	}
%>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>