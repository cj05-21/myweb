<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
<%

	int pdsno= Integer.parseInt(request.getParameter("pdsno"));

	dto=dao.pdsRead(pdsno);
	if(dto==null){
		out.println(" <script>");
		out.println(" 	alert(' 정보를 읽어오는데 실패하였습니다.');");
		out.println(" 	history.back();");
		out.println(" </script>");
	}else{
		//조회수 증가
		dao.increaseCnt(pdsno);
		
%>		
	<div class="container">
	<table  class="table table-hover"  style="margin:0;padding:0;height:100px;width:1000%; align:center;">
		<tr>
			<td style="text-align: center">제목</td>
			<td><%=dto.getSubject()%></td>
			<td style="text-align: right">조회수</td>
			<td><%=dto.getReadcnt()%></td>
		</tr>
		<tr>
			<td style="text-align: center">사진</td>
			<td colspan="3"><img style="width:350px; height:350px; " src="../storage/<%=dto.getFilename()%>"></td>
		</tr>
		<tr>
			<td style="text-align: center; vertical-align: middle;">작성자</td>
			<td><%=dto.getWname()%></td>
			<td style="text-align: right; vertical-align: middle">작성일</td>
			<td><%=dto.getRegdate()%></td>
		</tr>
	</table>
	
	<table  style="width:100%;">
		<tr style="height:50px ;text-valign :center;">
<%
	
		ArrayList<PdsDTO> list= dao.repleget(pdsno);
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
			out.println("&nbsp;&nbsp;"+dto.getRegdt1());
			out.println("&nbsp;&nbsp;<strong style='color:red;'>["+dto.getId()+"]</strong>&nbsp;&nbsp;<i style='font-size:30px;'>"+dto.getMlevel()+"</i><br><br></td>");
			out.println("</tr>");
			}	
		}
%>			

		</table>
</div>
		<form name="pds" method="post" action="pdsReple.jsp?pdsno=<%=pdsno%>" >
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
		<a href="pdsList.jsp" class='btn btn-warning'>목록</a>&nbsp;<a href="pdsUpdate.jsp?pdsno=<%=dto.getPdsno()%>" class='btn btn-warning'>수정</a>&nbsp;<a href="pdsDelete.jsp?pdsno=<%=dto.getPdsno()%>" class='btn btn-warning'>삭제</a>
		</td>
		</tr>
	
<%		
	}
%>	
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>