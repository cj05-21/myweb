<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
<%
		String id=request.getParameter("id");
		String email=request.getParameter("email");
		
	
	//1) 메일서버(POP3/SMTP)
		String mailServer="mw-002.cafe24.com";
		Properties props=new Properties();
		props.put("mail.smtp.host",mailServer);
		props.put("mail.smtp.auth","true");
		
		String content="";
	//2) 1) 메일 서버에서 인증받은 계정과 비번이 있어야함
		Authenticator myAuth=new MyAuthenticator();	
	//3) 1) 과 2) 가 유효한지 검증
		Session sess=Session.getInstance(props,myAuth);
		//out.print("메일 서버 인증 성공!!!");
	//4) 메일 보내기
		    String to = email;
	try{
			request.setCharacterEncoding("UTF-8");
		    String from = "compile01@naver.com";
		    String subject = "my web 임시번호 발송";

		 	
		    content+=" <p> ";
		    content+=" <img style='width:400px; height:400px;'src='http://172.16.83.15:8090/myweb/images/mainscreen.PNG'> ";
		    content+=" </p> ";
		    content+=" 임시 비밀번호는 <strong style='color:#FF7F00;'>";
		 	content+=dao.Random(id);
		 	content+=" </strong>입니다.";
		 	content+=" 로그인하여 비밀번호 변경후 이용해 주세요";
			
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
	
	}catch(Exception e){
		out.println("<p>메일 전송 실패!!"+e+"</p>");
		out.println("<p><a href='javascript:history.back();'>[다시시도]</a><p>");
	
	}
		dto.setId(id);
		dto.setEmail(email);
		dto=dao.SearchPw(dto);
		
		if(dto==null){
				out.print(" <script>");
				out.print(" alert('입력된 정보가 틀렸습니다.');");
				out.print(" history.back(); ");
				out.print(" </script>");
		}else{
	
		out.print("※ <strong style='color:#FF7F00;''>"+to+"</strong>님에게 메일이 발송되었습니다.");
%>
	<!--  입력한 회원의 비밀번호는 <i style="color:red"><%=dto.getPasswd() %></i> 였습니다.<br>-->
	
	<p style="font-size: 15px">임시 비밀번호를 변경하여 사용하십쇼!</p>	
	<br>
	<input type="button"  onclick="Close();" value="확인">
<%
			}//if end
%>	

<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>