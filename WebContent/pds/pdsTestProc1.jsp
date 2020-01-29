<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdsTestProc1.jsp</title>
</head>
<body>
	<h3>* 파일 첨부 테스트 결과*</h3>
<%
	/* request.setCharacterEncoding("UTF-8");
	out.print(request.getParameter("uname"));
	out.print("<hr>");
	out.print(request.getParameter("subject"));
	out.print("<hr>");
	out.print(request.getParameter("title"));
	out.print("<hr>");
	out.print(request.getParameter("filenm"));
	out.print("<hr>"); 
//--------------------------------------------------------
	-<form> 태그에 enctype 속성이 추가가 되면, request객체가 가지고 있는값을 
	제대로 가져올 수 없다
	request.getParameter() 는 null 이 반환된다
	*/
	
try{
	//실제 물리적 경로
	String saveDirectory= application.getRealPath("/storage");
	//저장 최대 용량
	int maxPostSize= 1024*1024*10;
	//한글조합
	String encoding="UTF-8";
	
	//사용자가 전송한 텍스트 정보 및 파일 저장하기
	MultipartRequest mr = new MultipartRequest(request
															  ,saveDirectory
															  ,maxPostSize
															  ,encoding
															  ,new DefaultFileRenamePolicy());
	out.print("<p> 파일 전송 저장 성공!!</p>");
	
	//1) mr 참조변수가 가리키고 있는 텍스트 정보를 가져오기
	out.print(mr.getParameter("uname"));
	out.print("<hr>");
	out.print(mr.getParameter("subject"));
	out.print("<hr>");
	out.print(mr.getParameter("content"));
	out.print("<hr>");
	
	
	//2) storage폴더에 저장된 파일 정보 확인하기 
	//mr 에서 <input type=file>을 전부 가져온다
	Enumeration files=mr.getFileNames();
	//▶열거형
	//Enumeration num={1,2,3}
	//in[] num={1,2,3,}
	
	//3) 2) 의 files가 가지고 있는 값에서 개별 접근
	String item=(String)files.nextElement();
	out.print(item);		//filenm
	out.print("<hr>");

	//4) 3)에서 item이름으로 전송된 실제파일을 
	//mr 객체에서 가져오기
	String ofileName=mr.getOriginalFileName(item);
	String fileName=mr.getFilesystemName(item);
	out.print("원본 파일명 : "+ofileName );
	out.print("<hr>");
	out.print("리네임 파일명 : "+fileName );
	out.print("<hr>");
	
	//5) 저장된 파일의 기타 세부 정보 확인하기
	File file= mr.getFile(item);
	if(file.exists()){ //파일이 존재하는지?
		out.print("파일명 : "+file.getName() );
		out.print("<hr>");
		out.print("파일 크기 : "+file.length() );
		out.print("<hr>");
	}else
	out.print("해당 파일이 존재하지 않은!!!!");

	//6) 전송시킨 파일 다운로드 하기
	//(단, 웹브라우저에서 해석되는 페이지는 제외)
	// .html .jsp .asp .php
	// .png .jpg .gif .avi .mp3
		out.print("첨부파일 : " );
		out.print("<a href='../storage/"+file.getName()+"'>");
		out.print(file.getName());
		out.print("</a>");
	
}catch(Exception e){out.println(e);out.println("<p>파일 업로드 실패!!</p>");out.println("<a href='javascript:history.back();'>[다시시도]</a>");}

%>	
</body>
</html>