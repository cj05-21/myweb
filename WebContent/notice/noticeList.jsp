<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp"%>    
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
<h3>* myWeb 공지사항 *</h3>	
<%
//한페이지당 출력할 글의 줄수
int recordPerPage=5;	
ArrayList<NoticeDTO> list=dao.noticeList(col,word, nowPage, recordPerPage);
	
	if(list==null){
			out.println("<script>");		
			out.println("  alert('공지사항을 불러오는데 실패하였습니다.');");		
			out.println("  location.href='noticeForm.jsp'");		
			out.println("</script>");		
		
	}else{	
%>
		<div class="container">
		<table class="table table-hover" >
			<tr>
			<th class="active" style="width:80px">말머리</th>
			<th class="active" style="width:80px">번호</th>
			<th style="width:800px" class="active">제목</th>
			<th style="width:150px" class="active">작성자</th>
			<th style="width:150px" class="active">작성일</th>
			<th style="width:80px" class="active">조회</th>
			</tr>
<% 
		for(int idx=0;idx<list.size();idx++){
			dto=list.get(idx);
			//오늘 날짜를 "2019-09-27" 문자열
			String today=Utility.getDate();
%>
			<tr>
			<th><button class="btn btn-warning" style="width:8px:"><strong>공지</strong></button></th>
			<th><%=dto.getNoticeno()%></th>
			<th>[<%if(dto.getConf().equals("A1")){out.println("안내");}else if(dto.getConf().equals("A2")){out.println("점검");}%>] <a href="noticeRead.jsp?noticeno=<%=dto.getNoticeno()%>"><%=dto.getSubject()%></a>
			<% 
			//조회수가 10이상이면 hot이미지 출력
			if(dto.getReadcnt()>=10){
			out.println("<img src='../images/hot.gif'>");
			}
			if(dto.getRegdt().equals(today)){
			out.println("<img src='../images/new.gif'>");
			}
			
			//댓글 개수
			
			int replecount=dao.replecount(dto.getNoticeno());
				if(replecount>=1){	
			out.println("("+replecount+")");
				}else{
			out.println(" ");		
				}
			%>
			</th>
			<th><%=dto.getId() %></th>
			<th><%=dto.getRegdt().substring(0,10)%></th>
			<th><%=dto.getReadcnt() %></th>
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
		<!-- 페이지 리스트 시작 -->
		<tr>
			<td colspan="6">
<%
			String paging= new Paging().paging2(count, nowPage, recordPerPage, col, word, "noticeList.jsp");
			out.print(paging);

%>
			</td>
		<tr>	
		<!-- 페이지 리스트 끝  -->		
		
		<tr>
		<td colspan="6" style="text-align:center; height:60px;">
		<form method="get" action="noticeList.jsp" onsubmit="return searchCheck(this)"> 
				<select name="col">
				<option value="id">작성자
				<option value="subject">제목
				<option value="content">내용
				<option value="subject_content">제목+내용
				</select>
				<input type="text" name="word">
				<input type="submit" value="검색">
		<span style="float:right"><a href="noticeForm.jsp"><input type="button" value="글쓰기" class="btn btn-warning" style="display:<%if(!s_id.equals("master")){out.println("none;");}%>"></a></span>
			</form>
			</td>	
		</tr>
		</table>
		</div>
<%		
	}//if end
%>
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>