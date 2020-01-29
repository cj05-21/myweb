<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작  bbsList.jsp-->
	<h3>* 게시판 목록 *</h3>
<div class="container">
	<p>
	<a href="bbsList.jsp"><button id="me" class="btn btn-warning">목록</button></a>
	<a href="bbsForm.jsp"><button id="me" class="btn btn-warning">쓰기</button></a>
	</p>
	<table class="table table-bordered">
  	<tr>   
	    <th style="width:300px">제목</th>
	    <th style="width:100px">작성자</th>
	    <th style="width:80px">조회수</th>
	    <th style="width:150px">작성일</th>
	</tr>
<%
//검색 목록(col 칼럼명, word검색어) 
//칼럼명과 검색어가 공통코드이기 때문에 ssi에 넣어 줄 것 이다
	//전체목록
	ArrayList<BbsDTO> list= dao.list(col,word);
	if(list==null){
		out.println("<tr>");
		out.println(" <td colspan='5'><strong>관련자료없음!!</strong></td>");
		out.println("</tr>");
	}else{
		
			//오늘 날짜를 "2019-09-06" 문자열
			String today=Utility.getDate();
		
		for(int idx=0;idx<list.size();idx++){
		dto=list.get(idx);
%>
 <tr>
    <td>
<%
		//답변이미지 출력
		for(int n=1; n<=dto.getIndent(); n++){
			out.println("<img src='../images/reply.gif'>");
		}//for end
%>    
    	<a href="bbsRead.jsp?bbsno=<%=dto.getBbsno()%>&word=<%=word%>&col=<%=col%>&subject=<%=dto.getSubject()%>"><%=dto.getSubject() %></a>
<%     	
    	//조회수가 10이상이면 hot이미지 출력
		if(dto.getReadcnt()>=10){
			out.println("<img src='../images/hot.gif'>");
		}
		//오늘 작성한 글 제목 뒤에 new 이미지 출력
		//regdt에서 년월일 만 자르기 예) 2019-09-04
		
		String regdt=dto.getRegdt().substring(0,10);
		if(regdt.equals(today)){
			out.println("<img src='../images/new.gif'>");
		}
		
%>    
    	</td>
    <td><%=dto.getWname() %></td>
    <td><%=dto.getReadcnt() %></td>
    <td><%=dto.getRegdt().substring(0,10)%></td>
  </tr>		
<% 			
 		}// for end
 		
 		//글개수
 		int count=dao.count(col,word);
 		out.println(" <tr>");
 		out.println(" 		<td colspan='4' style='text-align:center;'>");
 		out.println("		 글개수 :  <strong>"); 		
 		out.println(count);
 		out.println(" 		  </strong>");
 		out.println("		</td>");
 		out.println("	</tr>");
%>
		<!-- 데이터가 있어야 검색을 할 수 있으니까 if 안에 넣는다  -->
		<!-- 검색시작  -->
		<tr>
		<td colspan="4" style="text-align:center; height:60px;">
		<form method="get" action="bbsList.jsp" onsubmit="return searchCheck(this)"> 
				<select name="col">
				<option value="wname">작성자
				<option value="subject">제목
				<option value="content">내용
				<option value="subject_content">제목+내용
				</select>
				<input type="text" name="word">
				<input type="submit" name="검색">
			</form>
			</td>	
		</tr>
		
		<!--  검색 끝-->
<%	
 	}//if end
 %> 	
	</table>	
</div>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>