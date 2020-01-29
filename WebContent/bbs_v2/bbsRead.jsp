<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>    
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
<% 
	String subject=request.getParameter("subject");
%>	
	<h3><%=subject%></h3>
	<div class="container">
	<p>
	<a href="bbsList.jsp"><button id="me" class="btn btn-warning">목록</button></a>
	<a href="bbsForm.jsp"><button id="me" class="btn btn-warning">쓰기</button></a>
	</p>
	</div>
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	dto=dao.read(bbsno);
	if(dto==null){
		out.print("해당 게시물 없음!!");
	}else{
		//조회수 증가 
		 dao.incrementCnt(bbsno); 
%>	
<div class="container">
	<table  class="table table-bordered"  style="margin:0;padding:0;height:100px;width:1000%; align:center;">
		<tr>
			<th style="width:50px">번호</th>
			<td><%=dto.getBbsno()%></td>
		</tr>	
		<tr>
			<th style="width:100px">작성자</th>
			<td><%=dto.getWname()%></td>
		</tr>	
		<tr>	
			<th style="height:200%;">내용</th>
			<td>
<%
				//content에 특수문자 표현을 위해 HTML특수문자로 변환
				String content=dto.getContent();
				content=content.replaceAll("\r\n", "<br>");
				content=content.replaceAll(" ' ", "&apos;");
				content=content.replaceAll(" \" ", "&quot;");
				content=content.replaceAll(" < ", "&lt;");
				content=content.replaceAll(" > ", "&gt;");
				out.print(content);
%>			
			</td>
		</tr>	
		<tr>	
			<th style="width:80px">조회수</th>
			<td><%=dto.getReadcnt()%></td>
		</tr>
		<tr>	
			<th style="width:150px">작성일</th>
			<td><%=dto.getRegdt()%></td>
		</tr>	
		<tr>	
			<th style="width:150px">IP</th>
			<td><%=dto.getIp()%></td>
		</tr>
		<tr style="height:50px ;text-valign :center;">

<%
		


%>			
		</tr>		
		</table>
		</div>
		<form name="bbs" method="post" action="bbsRead.jsp" onsubmit="" >
		<div class="container">
		<table border="1" class="table table-bordered" >
		<tr>
    	<td   style="align:center;text-align:center;"><input type="text" name="reple" required style="margin:0;padding:0;height:100px;width:100%; align:center;"></td>
    	<td valign=middle style="valign:middle; width:10%;"><input type="hidden" name="bbsno" value="1"><input type="submit" value="댓글달기" ></td>
  		</tr>
		</table>
		</div>
		</form>
		<div class="container" align="left">
			<a href="bbsList.jsp?col=<%=col%>&word=<%=word%>"><button  class="btn btn-warning">목록</button></a>
			<a href="bbsReply.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>"><button class="btn btn-warning">답변</button></a>
			&nbsp;
			<a href="bbsUpdate.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>"><button class="btn btn-warning">수정</button></a>
			&nbsp;
			   <a href="bbsDel.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>"><button class="btn btn-warning">삭제</button></a>
		</div>
<%		
	}

%>
	
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>