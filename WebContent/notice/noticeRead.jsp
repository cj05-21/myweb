<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
<%

	int noticeno= Integer.parseInt(request.getParameter("noticeno"));

	dto=dao.noticeRead(noticeno);
	if(dto==null){
		out.println(" <script>");
		out.println(" 	alert(' 정보를 읽어오는데 실패하였습니다.');");
		out.println(" 	history.back();");
		out.println(" </script>");
	}else{
		//조회수 증가
		dao.increaseCnt(noticeno);
		
%>		
	<div class="container">
	<table  class="table table-hover"  style="margin:0;padding:0;height:100px;width:1000%; align:center;">
		<tr>
		<td colspan="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<strong>[<%if(dto.getConf().equals("A1")){out.println("안내");}else if(dto.getConf().equals("A2")){out.println("점검");}%>]</strong>
		</td>
		</tr>
		<tr>
			<th style="text-align: center">제목</th>
			<th><%=dto.getSubject()%></th>
			<th style="text-align: right">조회수</th>
			<th><%=dto.getReadcnt()%></th>
		</tr>
		<tr style="width:450px; height:450px;">
			<th style="text-align: center; vertical-align:middle">내용</th>
			<td style="vertical-align:middle;" colspan="3">
			<%
				//content에 특수문자 표현을 위해 HTML특수문자로 변환
				String content=dto.getContent();
				content=content.replaceAll("\r\n", "<br>");
				content=content.replaceAll(" ' ", "&apos;");
				content=content.replaceAll(" \" ", "&quot;");
				content=content.replaceAll(" < ", "&lt;");
				content=content.replaceAll(" > ", "&gt;");
			%>
			<%=content%>			
			</td>
		</tr>
		<tr>
			<th style="text-align: center; vertical-align: middle;">작성자</th>
			<th><%=dto.getId()%></th>
			<th style="text-align: right; vertical-align: middle">작성일</th>
			<th><%=dto.getRegdt()%></th>
		</tr>
	</table>
	
	<table  style="width:100%;">
		<tr style="height:50px ;text-valign :center;">

<%
	
		ArrayList<NoticeDTO> list= dao.repleget(noticeno);
		if(list==null){
			out.println("<tr>");
			out.println(" <td colspan='5'><strong>관련자료없음!!</strong></td>");
			out.println("</tr>");
		}else{		
%>
		
<% 			
			for(int idx=0;idx<list.size();idx++){
				dto=list.get(idx);
				
			out.println("<tr>");
			out.println("<td colspan='5'>");
			String reple=dto.getReple();
			reple=reple.replaceAll("\r\n", "<br>");
			reple=reple.replaceAll(" ' ", "&apos;");
			reple=reple.replaceAll(" \" ", "&quot;");
			reple=reple.replaceAll(" < ", "&lt;");
			reple=reple.replaceAll(" > ", "&gt;");
			out.println("&nbsp;&nbsp;"+reple);
			out.println("</td>");
			out.println("</tr>");
					
			out.println("<tr>");
			out.println("<td colspan='	5'>");
			out.println("&nbsp;&nbsp;"+dto.getRegdt());
			out.println("&nbsp;&nbsp;<strong style='color:red;'>["+dto.getId()+"]</strong>&nbsp;&nbsp;<br><br></td>");
			out.println("</tr>");
			}	
		}
%>			

		</table>
</div>
		<form name="pds" method="post" action="noticeReple.jsp?noticeno=<%=noticeno%>" >
		<div class="container">
		
		<table border="1" class="table table-bordered" >
		<tr>
    	<td   style="align:center;text-align:center;"><input type="text" name="reple" required style="margin:0;padding:0;height:100px;width:100%; align:center;"></td>
    	<td valign=middle style="valign:middle; width:10%;"><input type="hidden" name="s_id" value="<%=s_id%>" ><input  class='btn btn-warning' type="submit" value="댓글달기" ></td>
  		</tr>
		</table>
		</div>
		</form>
		<tr>
		<td>
		<a  href="noticeList.jsp" class='btn btn-warning'>목록</a>
		&nbsp;
		<button style="display:<%if(!s_id.equals("master")){out.println("none;");}%>" onclick="location.href='noticeUpdate.jsp?noticeno=<%=noticeno%>' "  class='btn btn-warning' >수정</button>
		&nbsp;
		<button style="display:<%if(!s_id.equals("master")){out.println("none;");}%>" onclick="location.href='noticeDelete.jsp?noticeno=<%=noticeno%>' " class='btn btn-warning' >삭제</button>
		</td>
		</tr>
	
<%		
	}
%>	
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>