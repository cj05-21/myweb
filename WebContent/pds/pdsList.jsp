<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>* 포토갤러리 *</h3>
	<%
	//한페이지당 출력할 글의 줄수
	int recordPerPage=5;
	
	request.setCharacterEncoding("UTF-8");
	ArrayList<PdsDTO> list= dao.list(col,word,nowPage, recordPerPage);
	if(list==null){
		out.println("관련자료 없음!!");
	}else{
		//오늘 날짜를 "2019-09-06" 문자열
		String today=Utility.getDate();
%>		
		<div class="container">
		<table class="table table-hover">
		<tr >
			<th class="active">제목</th> 
			<th class="active">사진</th> 
			<th class="active">작성자</th> 
			<th class="active">조회수</th> 
			<th class="active">작성일</th>
			<th class="active"></th>
		</tr>
<%
		for(int idx=0; idx<list.size(); idx++){
			dto=list.get(idx);
			
%>			 
		<tr>
			<th>
			<a href='pdsRead.jsp?pdsno=<%=dto.getPdsno()%>&word=<%=word%>&col=<%=col%>&nowPage=<%=nowPage%>'><%=dto.getSubject()%></a>
<%     	
    	//조회수가 10이상이면 hot이미지 출력
		if(dto.getReadcnt()>=10){
			out.println("<img src='../images/hot.gif'>");
		}
		//오늘 작성한 글 제목 뒤에 new 이미지 출력
		//regdt에서 년월일 만 자르기 예) 2019-09-04
		
		String regdate=dto.getRegdate().substring(0,10);
		if(regdate.equals(today)){
			out.println("<img src='../images/new.gif'>");
		}
		
		//댓글 개수
		int replecount=dao.replecount(dto.getPdsno());
			if(replecount>=1){	
		out.println("("+replecount+")");
			}else{
		out.println(" ");		
			}
%>    
			</th> 
			<th><a href='pdsRead.jsp?pdsno=<%=dto.getPdsno()%>'><img src="../storage/<%=dto.getFilename()%>"  width="50" height="50"></a></th> 
			<th><%=dto.getWname() %></th> 
			<th><%=dto.getReadcnt() %></th> 
			<th><%=dto.getRegdate().substring(0,10) %></th>
			<th ><a href="pdsUpdate.jsp?pdsno=<%=dto.getPdsno()%>" class='btn btn-warning'>수정</a>&nbsp;<a href="pdsDelete.jsp?pdsno=<%=dto.getPdsno()%>" class='btn btn-warning'>삭제</a></th>
		</tr>
<% 
		}//for end	
		//글개수
 		int count=dao.count(col,word);
 		out.println(" <tr>");
 		out.println(" 		<td colspan='6' style='text-align:center;'>");
 		out.println("		 글개수 :  <strong>"); 		
 		out.println(count);
 		out.println(" 		  </strong>");
 		out.println("		</td>");
 		out.println("	</tr>");
%>
	</table>
	</div>
		<!-- 페이지 리스트 시작 -->
		<tr>
			<td colspan="6">
<%
			String paging= new Paging().paging2(count, nowPage, recordPerPage, col, word, "pdsList.jsp");
			out.print(paging);

%>
			<br>
			</td>
		<tr>	
		<!-- 페이지 리스트 끝  -->
<!-- 데이터가 있어야 검색을 할 수 있으니까 if 안에 
		넣는다  -->
		<!-- 검색시작  -->
		<tr>
		<td colspan="4" style="text-align:center; height:60px;">
		<form method="get" action="pdsList.jsp" onsubmit="return searchCheck(this)"> 
				<select name="col">
				<option value="wname">작성자
				<option value="subject">제목
				<option value="content">내용
				<option value="subject_content">제목+내용
				</select>
				<input type="text" name="word">
				<input type="submit" value="검색">
			</form>
			</td>	
		</tr>
		
		<!--  검색 끝-->
<% 
	}//if end	
	%>
	<br>
	<p><a href="pdsForm.jsp?<%=s_id%>" class='btn btn-warning'>사진등록</a></p>
	
		
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>