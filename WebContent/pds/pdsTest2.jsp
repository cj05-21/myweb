<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdsTest2.jsp</title>
</head>
<body>
	<h3>* 파일 첨부 테스트 (다중)*</h3>
	<form method="post"
			 action="pdsTestProc2.jsp" 
			 enctype="multipart/form-data">
		     <!-- 파일첨부시 필수!!  -->	   
	이름 : <input type="text" name="uname"><br> 
	제목 : <input type="text" name="subject"><br>
	내용 : <textarea rows="5" cols="20" name="content"></textarea><br>
	첨부1 : <input type="file" name="filenm3"><br>
	첨부2 : <input type="file" name="filenm2"><br>
	첨부3 : <input type="file" name="filenm1"><br>
	<input type="submit" value="전송"><br>	       
	</form>
</body>
</html>